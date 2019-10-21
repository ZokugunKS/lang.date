import '@zokugun/lang'

const $months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
const $days = {
	full: ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday']
	abbr: ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
	short: ['su', 'mo', 'tu', 'we', 'th', 'fr', 'sa']
}

type NS = Number | String

impl Date {
	static {
		create(...args): Date { // {{{
			let utc = false
			if args.length != 0 && args.last() is Boolean {
				utc = args.pop()
			}

			if args.length != 0 {
				if args[0] is Number {
					let date: Date = null

					if args.length == 7 {
						 date = new Date(args[0], args[1], args[2], args[3], args[4], args[5], args[6])
					}
					else if args.length == 6 {
						date = new Date(args[0], args[1], args[2], args[3], args[4], args[5], 0)
					}
					else if args.length == 5 {
						date = new Date(args[0], args[1], args[2], args[3], args[4], 0, 0)
					}
					else if args.length == 3 {
						date = new Date(args[0], args[1], args[2], 0, 0, 0, 0)
					}
					else if args.length == 1 {
						date = new Date(args[0])
					}

					if date != null {
						if utc {
							date.add('minutes', -date.getTimezoneOffset())
						}

						return date
					}
				}
				else if args[0] is Date {
					return new Date(args[0])
				}
				else if Date.isTime(args[0]) {
					return new Date(Date.getTime(args[0]))
				}
			}

			return new Date()
		} // }}}
		getTime(value) { // {{{
			if value.getTime is Function {
				return value.getTime()
			}
			else if value.time is Function {
				return value.time()
			}
			else if value.getEpochTime is Function {
				return value.getEpochTime()
			}
			else {
				return value.epochTime()
			}
		} // }}}
		isTime(value): Boolean { // {{{
			if value is Object {
				if value.getTime is Function || value.time is Function || value.getEpochTime is Function || value.epochTime is Function {
					return true
				}
			}

			return false
		} // }}}
		today(utc: Boolean = false): Date => new Date().midnight(utc)
		tomorrow(utc: Boolean = false): Date => new Date().midnight(utc).add('day', 1)
		yesterday(utc: Boolean = false): Date => new Date().midnight(utc).add('day', -1)
	}
	add(properties: Dictionary): Date ~ ParseError { // {{{
		for const property: NS, name of properties {
			if name[0] == 'd' && (name == 'd' || name == 'day' || name == 'days') {
				this.setDate(this.getDate() + property.toInt())
			}
			else if name[0] == 'h' && (name == 'h' || name == 'hour' || name == 'hours') {
				this.setHours(this.getHours() + property.toInt())
			}
			else if name[0] == 'm' {
				if name == 'ms' || name == 'millisecond' || name == 'milliseconds' {
					this.setMilliseconds(this.getMilliseconds() + property.toInt())
				}
				else if name == 'mn' || name == 'minute' || name == 'minutes' {
					this.setMinutes(this.getMinutes() + property.toInt())
				}
				else if name == 'm' || name == 'month' || name == 'months' {
					this.setMonth(this.getMonth() + property.toInt())
				}
			}
			else if name[0] == 's' && (name == 's' || name == 'second' || name == 'seconds') {
				this.setSeconds(this.getSeconds() + property.toInt())
			}
			else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
				this.setDate(this.getDate() + (property.toInt() * 7))
			}
			else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
				this.setFullYear(this.getFullYear() + property.toInt())
			}
		}

		return this
	} // }}}
	add(name: String, value: Number): Date { // {{{
		if name[0] == 'd' && (name == 'd' || name == 'day' || name == 'days') {
			this.setDate(this.getDate() + value)
		}
		else if name[0] == 'h' && (name == 'h' || name == 'hour' || name == 'hours') {
			this.setHours(this.getHours() + value)
		}
		else if name[0] == 'm' {
			if name == 'ms' || name == 'millisecond' || name == 'milliseconds' {
				this.setMilliseconds(this.getMilliseconds() + value)
			}
			else if name == 'mn' || name == 'minute' || name == 'minutes' {
				this.setMinutes(this.getMinutes() + value)
			}
			else if name == 'm' || name == 'month' || name == 'months' {
				this.setMonth(this.getMonth() + value)
			}
		}
		else if name[0] == 's' && (name == 's' || name == 'second' || name == 'seconds') {
			this.setSeconds(this.getSeconds() + value)
		}
		else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
			this.setDate(this.getDate() + (value * 7))
		}
		else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
			this.setFullYear(this.getFullYear() + value)
		}

		return this
	} // }}}
	add(name: String, value: String): Date ~ ParseError => this.add(name, value.toInt())
	difference(name: String, date: Date): Number { // {{{
		if name[0] == 'd' && (name == 'd' || name == 'day' || name == 'days') {
			return Math.round((date.getTime() - this.getTime()) / 86400000)
		}
		else if name[0] == 'h' && (name == 'h' || name == 'hour' || name == 'hours') {
			return Math.round((date.getTime() - this.getTime()) / 3600000)
		}
		else if name[0] == 'm' {
			if name == 'ms' || name == 'millisecond' || name == 'milliseconds' {
				return date.getTime() - this.getTime()
			}
			else if name == 'mn' || name == 'minute' || name == 'minutes' {
				return Math.round((date.getTime() - this.getTime()) / 60000)
			}
			else if name == 'm' || name == 'month' || name == 'months' {
				let that := this
				if date.getTime() < this.getTime() {
					that = date
					date = this
				}

				let d = date.getMonth() - that.getMonth() - 2

				if date.getFullYear() > that.getFullYear() {
					d += (date.getFullYear() - that.getFullYear() - 1) * 12
				}

				if date.getDayOfMonth() > that.getDayOfMonth() {
					++d
				}
				else if date.getDayOfMonth() == that.getDayOfMonth() {
					if date.getHours() > that.getHours() {
						++d
					}
					else if date.getHours() == that.getHours() {
						if date.getMinutes() > that.getMinutes() {
							++d
						}
						else if date.getMinutes() == that.getMinutes() {
							if date.getSeconds() > that.getSeconds() || (date.getSeconds() == that.getSeconds() && date.getMilliseconds() >= that.getMilliseconds()) {
								++d
							}
						}
					}
				}

				if d < 0 {
					d = 0
				}

				return that == this ? d : -d
			}
		}
		else if name[0] == 'q' && (name == 'q' || name == 'quarter' || name == 'quarters') {
			return Math.round(this.difference('month', date) / 3)
		}
		else if name[0] == 's' {
			if name == 's' || name == 'second' || name == 'seconds' {
				return Math.round((date.getTime() - this.getTime()) / 1000)
			}
			else if name == 'sm' || name == 'semester' || name == 'semesters' {
				return Math.round(this.difference('month', date) / 6)
			}
		}
		else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
			return Math.round(Math.round((date.getTime() - this.getTime()) / 86400000) / 7)
		}
		else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
			let that := this
			if date.getTime() < this.getTime() {
				that = date
				date = this
			}

			let d = date.getFullYear() - that.getFullYear() - 2

			if date.getMonth() > that.getMonth() {
				++d
			}
			else if date.getMonth() == that.getMonth() {
				if date.getDayOfMonth() > that.getDayOfMonth() {
					++d
				}
				else if date.getDayOfMonth() == that.getDayOfMonth() {
					if date.getHours() > that.getHours() {
						++d
					}
					else if date.getHours() == that.getHours() {
						if date.getMinutes() > that.getMinutes() {
							++d
						}
						else if date.getMinutes() == that.getMinutes() {
							if date.getSeconds() > that.getSeconds() || (date.getSeconds() == that.getSeconds() && date.getMilliseconds() >= that.getMilliseconds()) {
								++d
							}
						}
					}
				}
			}

			if d < 0 {
				d = 0
			}

			return that == this ? d : -d
		}
	} // }}}
	difference(name: String, ...args): Number => this.difference(name, Date.create(...args))
	endOf(space: String, utc: Boolean = false): Date { // {{{
		if utc {
			switch space {
				'year' => {
					this.setUTCMonth(11)
					this.setUTCDate(this.getDaysInMonth())
					this.setUTCHours(23)
					this.setUTCMinutes(59)
					this.setUTCSeconds(59)
					this.setUTCMilliseconds(999)
				}
				'month' => {
					this.setUTCDate(this.getDaysInMonth())
					this.setUTCHours(23)
					this.setUTCMinutes(59)
					this.setUTCSeconds(59)
					this.setUTCMilliseconds(999)
				}
				'day' => {
					this.setUTCHours(23)
					this.setUTCMinutes(59)
					this.setUTCSeconds(59)
					this.setUTCMilliseconds(999)
				}
				'hour' => {
					this.setUTCMinutes(59)
					this.setUTCSeconds(59)
					this.setUTCMilliseconds(999)
				}
				'minute' => {
					this.setUTCSeconds(59)
					this.setUTCMilliseconds(999)
				}
				'second' => {
					this.setUTCMilliseconds(999)
				}
				'week' => {
					this.add('day', 6 - (this.getUTCDay() - 1).mod(7))
					this.setUTCHours(23)
					this.setUTCMinutes(59)
					this.setUTCSeconds(59)
					this.setUTCMilliseconds(999)
				}
			}
		}
		else {
			switch space {
				'year' => {
					this.setMonth(11)
					this.setDate(this.getDaysInMonth())
					this.setHours(23)
					this.setMinutes(59)
					this.setSeconds(59)
					this.setMilliseconds(999)
				}
				'month' => {
					this.setDate(this.getDaysInMonth())
					this.setHours(23)
					this.setMinutes(59)
					this.setSeconds(59)
					this.setMilliseconds(999)
				}
				'day' => {
					this.setHours(23)
					this.setMinutes(59)
					this.setSeconds(59)
					this.setMilliseconds(999)
				}
				'hour' => {
					this.setMinutes(59)
					this.setSeconds(59)
					this.setMilliseconds(999)
				}
				'minute' => {
					this.setSeconds(59)
					this.setMilliseconds(999)
				}
				'second' => {
					this.setMilliseconds(999)
				}
				'week' => {
					this.add('day', 6 - (this.getDay() - 1).mod(7))
					this.setHours(23)
					this.setMinutes(59)
					this.setSeconds(59)
					this.setMilliseconds(999)
				}
			}
		}

		return this
	} // }}}
	future(value: String, utc: Boolean = false): Date { // {{{
		value = value.toLowerCase()

		let index: Number
		if value.length == 2 {
			index = $days.short.indexOf(value)
		}
		else if value.length == 3 {
			index = $days.abbr.indexOf(value)
		}
		else {
			index = $days.full.indexOf(value)
		}

		const dw = utc ? this.getUTCDayOfWeek() : this.getDayOfWeek()
		if dw == index {
			this.add('day', 7)
		}
		else {
			this.add('day', index < dw ? index + 7 - dw : index - dw)
		}

		return this
	} // }}}
	futureOrPresent(value: String, utc: Boolean = false): Date { // {{{
		value = value.toLowerCase()

		let index: Number
		if value.length == 2 {
			index = $days.short.indexOf(value)
		}
		else if value.length == 3 {
			index = $days.abbr.indexOf(value)
		}
		else {
			index = $days.full.indexOf(value)
		}

		const dw = utc ? this.getUTCDayOfWeek() : this.getDayOfWeek()
		if dw != index {
			this.add('day', index < dw ? index + 7 - dw : index - dw)
		}

		return this
	} // }}}
	getDaysInMonth(utc: Boolean = false): Number { // {{{
		const m = utc ? this.getUTCMonth() : this.getMonth()
		if m == 1 && this.isLeapYear(utc) {
			return 29
		}
		else {
			return $months[m]
		}
	} // }}}
	getDaysInYear(utc: Boolean = false): Number => this.isLeapYear(utc) ? 366 : 365
	getDayOfMonth(): Number => this.getDate()
	getDayOfWeek(): Number => this.getDay()
	getDayOfYear(): Number => Math.ceil((this.clone().midnight().getTime() - new Date(this.getFullYear(), 0, 1).getTime()) / 86400000) + 1
	getUTCDayOfMonth(): Number => this.getUTCDate()
	getUTCDayOfWeek(): Number => this.getUTCDay()
	getUTCDayOfYear(): Number => Math.ceil((this.clone().midnight(true).getTime() - Date.create(this.getUTCFullYear(), 0, 1, true).getTime()) / 86400000) + 1
	getUTCWeek(): Number { // {{{
		const dw = (Date.create(this.getUTCFullYear(), 0, 1, true).getUTCDayOfWeek() - 1).mod(7)
		let days := this.getUTCDayOfYear()

		if 8 - dw < 4 {
			if days < 7 {
				days = 0
			}
			else {
				days += dw - 7
			}
		}
		else {
			if days < 7 {
				days = 7
			}
			else {
				days += dw
			}
		}

		if days <= 0 {
			return 0
		}

		const week = Math.ceil(days / 7)

		if week >= 52 && this.getUTCDate() >= 25 && (days = days.mod(7)) && 8 - days >= 4 {
			return 0
		}
		else {
			return week
		}
	} // }}}
	getUTCYearOfWeek(): Number { // {{{
		const m = this.getUTCMonth()
		if m == 0 {
			const d = this.getUTCDate()
			if d == 1 {
				if this.getUTCWeek() == 0 {
					return this.getUTCFullYear() - 1
				}
			}
			else {
				this.setUTCDate(1)

				if this.getUTCWeek() == 0 {
					this.setUTCDate(d)

					return this.getUTCFullYear() - 1
				}
				else {
					this.setUTCDate(d)
				}
			}
		}
		else if m == 11 {
			const d = this.getUTCDate()
			if d == 31 {
				if this.getUTCWeek() == 0 {
					return this.getUTCFullYear() + 1
				}
			}
			else {
				this.setUTCDate(31)

				if this.getUTCWeek() == 0 {
					this.setUTCDate(d)

					return this.getUTCFullYear() + 1
				}
				else {
					this.setUTCDate(d)
				}
			}
		}

		return this.getUTCFullYear()
	} // }}}
	getWeek(): Number { // {{{
		const dw = (new Date(this.getFullYear(), 0, 1).getDayOfWeek() - 1).mod(7)
		let days := this.getDayOfYear()

		if 8 - dw < 4 {
			if days < 7 {
				days = 0
			}
			else {
				days += dw - 7
			}
		}
		else {
			if days < 7 {
				days = 7
			}
			else {
				days += dw
			}
		}

		if days <= 0 {
			return 0
		}

		const week = Math.ceil(days / 7)

		if week >= 52 && this.getDate() >= 25 && (days = days.mod(7)) && 8 - days >= 4 {
			return 0
		}
		else {
			return week
		}
	} // }}}
	getWeeksInYear(utc: Boolean = false): Number { // {{{
		let dw: Number, days: Number
		if utc {
			dw = (new Date(this.getUTCFullYear(), 0, 1, true).getUTCDayOfWeek() - 1).mod(7)
			days = new Date(this.getUTCFullYear(), 11, 31, true).getUTCDayOfYear()
		}
		else {
			dw = (new Date(this.getFullYear(), 0, 1).getDayOfWeek() - 1).mod(7)
			days = new Date(this.getFullYear(), 11, 31).getDayOfYear()
		}
		if 8 - dw < 4 {
			days += dw - 7
		}
		else {
			days += dw
		}

		const week = Math.ceil(days / 7)
		if (days = days.mod(7)) != 0 && 8 - days >= 4 {
			return week - 1
		}
		else {
			return week
		}
	} // }}}
	getYearOfWeek() { // {{{
		const m = this.getMonth()
		if m == 0 {
			const d = this.getDate()
			if d == 1 {
				if this.getWeek() == 0 {
					return this.getFullYear() - 1
				}
			}
			else {
				this.setDate(1)

				if this.getWeek() == 0 {
					this.setDate(d)

					return this.getFullYear() - 1
				}
				else {
					this.setDate(d)
				}
			}
		}
		else if m == 11 {
			const d = this.getDate()
			if d == 31 {
				if this.getWeek() == 0 {
					return this.getFullYear() + 1
				}
			}
			else {
				this.setDate(31)

				if this.getWeek() == 0 {
					this.setDate(d)

					return this.getFullYear() + 1
				}
				else {
					this.setDate(d)
				}
			}
		}

		return this.getFullYear()
	} // }}}
	isAfter(value): Boolean { // {{{
		let date
		if Date.isTime(value) {
			date = Date.getTime(value)
		}
		else {
			date = Date.create(value)
		}

		return this.getTime() > date.getTime()
	} // }}}
	isAfter(...args): Boolean => this.getTime() > Date.create(...args).getTime()
	isBefore(value): Boolean { // {{{
		let date
		if Date.isTime(value) {
			date = Date.getTime(value)
		}
		else {
			date = Date.create(value)
		}

		return this.getTime() < date.getTime()
	} // }}}
	isBefore(...args): Boolean => this.getTime() < Date.create(...args).getTime()
	isBetween(value1, value2): Boolean { // {{{
		if Date.isTime(value1) {
			value1 = Date.getTime(value1)
		}
		else {
			value1 = Date.create(value1).getTime()
		}
		if Date.isTime(value2) {
			value2 = Date.getTime(value2)
		}
		else {
			value2 = Date.create(value2).getTime()
		}

		if value1 > value2 {
			return this.getTime() <= value1 && this.getTime() >= value2
		}
		else {
			return this.getTime() >= value1 && this.getTime() <= value2
		}
	} // }}}
	isLeapYear(utc: Boolean = false): Boolean { // {{{
		const year = utc ? this.getUTCFullYear() : this.getFullYear()

		return (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
	} // }}}
	midnight(utc: Boolean = false): Date { // {{{
		if utc {
			this.setUTCHours(0)
			this.setUTCMinutes(0)
			this.setUTCSeconds(0)
			this.setUTCMilliseconds(0)
		}
		else {
			this.setHours(0)
			this.setMinutes(0)
			this.setSeconds(0)
			this.setMilliseconds(0)
		}
		return this
	} // }}}
	noon(utc: Boolean = false): Date { // {{{
		if utc {
			this.setUTCHours(12)
			this.setUTCMinutes(0)
			this.setUTCSeconds(0)
			this.setUTCMilliseconds(0)
		}
		else {
			this.setHours(12)
			this.setMinutes(0)
			this.setSeconds(0)
			this.setMilliseconds(0)
		}

		return this
	} // }}}
	past(value: String, utc: Boolean = false): Date { // {{{
		value = value.toLowerCase()

		let index: Number
		if value.length == 2 {
			index = $days.short.indexOf(value)
		}
		else if value.length == 3 {
			index = $days.abbr.indexOf(value)
		}
		else {
			index = $days.full.indexOf(value)
		}

		const dw = utc ? this.getUTCDayOfWeek() : this.getDayOfWeek()
		if dw == index {
			this.rewind('day', 7)
		}
		else {
			this.rewind('day',  dw < index ? dw + 7 - index : dw - index)
		}

		return this
	} // }}}
	pastOrPresent(value: String, utc: Boolean = false): Date { // {{{
		value = value.toLowerCase()

		let index: Number
		if value.length == 2 {
			index = $days.short.indexOf(value)
		}
		else if value.length == 3 {
			index = $days.abbr.indexOf(value)
		}
		else {
			index = $days.full.indexOf(value)
		}

		const dw = utc ? this.getUTCDayOfWeek() : this.getDayOfWeek()
		if dw != index {
			this.rewind('day',  dw < index ? dw + 7 - index : dw - index)
		}

		return this
	} // }}}
	rewind(properties: Dictionary): Date ~ ParseError { // {{{
		for const property: NS, name of properties {
			if name[0] == 'd' && (name == 'd' || name == 'day' || name == 'days') {
				this.setDate(this.getDate() - property.toInt())
			}
			else if name[0] == 'h' && (name == 'h' || name == 'hour' || name == 'hours') {
				this.setHours(this.getHours() - property.toInt())
			}
			else if name[0] == 'm' {
				if name == 'ms' || name == 'millisecond' || name == 'milliseconds' {
					this.setMilliseconds(this.getMilliseconds() - property.toInt())
				}
				else if name == 'mn' || name == 'minute' || name == 'minutes' {
					this.setMinutes(this.getMinutes() - property.toInt())
				}
				else if name == 'm' || name == 'month' || name == 'months' {
					this.setMonth(this.getMonth() - property.toInt())
				}
			}
			else if name[0] == 's' && (name == 's' || name == 'second' || name == 'seconds') {
				this.setSeconds(this.getSeconds() - property.toInt())
			}
			else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
				this.setDate(this.getDate() - (property.toInt() * 7))
			}
			else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
				this.setFullYear(this.getFullYear() - property.toInt())
			}
		}

		return this
	} // }}}
	rewind(name: String, value: Number): Date { // {{{
		if name[0] == 'd' && (name == 'd' || name == 'day' || name == 'days') {
			this.setDate(this.getDate() - value)
		}
		else if name[0] == 'h' && (name == 'h' || name == 'hour' || name == 'hours') {
			this.setHours(this.getHours() - value)
		}
		else if name[0] == 'm' {
			if name == 'ms' || name == 'millisecond' || name == 'milliseconds' {
				this.setMilliseconds(this.getMilliseconds() - value)
			}
			else if name == 'mn' || name == 'minute' || name == 'minutes' {
				this.setMinutes(this.getMinutes() - value)
			}
			else if name == 'm' || name == 'month' || name == 'months' {
				this.setMonth(this.getMonth() - value)
			}
		}
		else if name[0] == 's' && (name == 's' || name == 'second' || name == 'seconds') {
			this.setSeconds(this.getSeconds() - value)
		}
		else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
			this.setDate(this.getDate() - (value * 7))
		}
		else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
			this.setFullYear(this.getFullYear() - value)
		}

		return this
	} // }}}
	rewind(name: String, value: String): Date ~ ParseError => this.rewind(name, value.toInt())
	set(properties: Dictionary, utc: Boolean = false): Date ~ ParseError { // {{{
		if utc {
			for const property: NS, name of properties {
				if name[0] == 'd' {
					if name == 'dm' || name == 'dayofmonth' {
						this.setUTCDayOfMonth(property.toInt())
					}
					else if name == 'dw' || name == 'dayofweek' {
						this.setUTCDayOfWeek(property.toInt())
					}
					else if name == 'dy' || name == 'dayofyear' {
						this.setUTCDayOfYear(property.toInt())
					}
				}
				else if name[0] == 'h' && (name == 'h' || name == 'hour' || name == 'hours') {
					this.setUTCHours(property.toInt())
				}
				else if name[0] == 'm' {
					if name == 'ms' || name == 'millisecond' || name == 'milliseconds' {
						this.setUTCMilliseconds(property.toInt())
					}
					else if name == 'mn' || name == 'minute' || name == 'minutes' {
						this.setUTCMinutes(property.toInt())
					}
					else if name == 'm' || name == 'month' || name == 'months' {
						this.setUTCMonth(property.toInt())
					}
				}
				else if name[0] == 's' && (name == 's' || name == 'second' || name == 'seconds') {
					this.setUTCSeconds(property.toInt())
				}
				else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
					this.setUTCWeek(property.toInt())
				}
				else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
					this.setUTCFullYear(property.toInt())
				}
			}
		}
		else {
			for const property: NS, name of properties {
				if name[0] == 'd' {
					if name == 'dm' || name == 'dayofmonth' {
						this.setDayOfMonth(property.toInt())
					}
					else if name == 'dw' || name == 'dayofweek' {
						this.setDayOfWeek(property.toInt())
					}
					else if name == 'dy' || name == 'dayofyear' {
						this.setDayOfYear(property.toInt())
					}
				}
				else if name[0] == 'h' && (name == 'h' || name == 'hour' || name == 'hours') {
					this.setHours(property.toInt())
				}
				else if name[0] == 'm' {
					if name == 'ms' || name == 'millisecond' || name == 'milliseconds' {
						this.setMilliseconds(property.toInt())
					}
					else if name == 'mn' || name == 'minute' || name == 'minutes' {
						this.setMinutes(property.toInt())
					}
					else if name == 'm' || name == 'month' || name == 'months' {
						this.setMonth(property.toInt())
					}
				}
				else if name[0] == 's' && (name == 's' || name == 'second' || name == 'seconds') {
					this.setSeconds(property.toInt())
				}
				else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
					this.setWeek(property.toInt())
				}
				else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
					this.setFullYear(property.toInt())
				}
			}
		}

		return this
	} // }}}
	set(name: String, value: Number, utc: Boolean = false): Date { // {{{
		if utc {
			if name[0] == 'd' {
				if name == 'dm' || name == 'dayofmonth' {
					this.setUTCDayOfMonth(value)
				}
				else if name == 'dw' || name == 'dayofweek' {
					this.setUTCDayOfWeek(value)
				}
				else if name == 'dy' || name == 'dayofyear' {
					this.setUTCDayOfYear(value)
				}
			}
			else if name[0] == 'h' && (name == 'h' || name == 'hour' || name == 'hours') {
				this.setUTCHours(value)
			}
			else if name[0] == 'm' {
				if name == 'ms' || name == 'millisecond' || name == 'milliseconds' {
					this.setUTCMilliseconds(value)
				}
				else if name == 'mn' || name == 'minute' || name == 'minutes' {
					this.setUTCMinutes(value)
				}
				else if name == 'm' || name == 'month' || name == 'months' {
					this.setUTCMonth(value)
				}
			}
			else if name[0] == 's' && (name == 's' || name == 'second' || name == 'seconds') {
				this.setUTCSeconds(value)
			}
			else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
				this.setUTCWeek(value)
			}
			else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
				this.setUTCFullYear(value)
			}
		}
		else {
			if name[0] == 'd' {
				if name == 'dm' || name == 'dayofmonth' {
					this.setDayOfMonth(value)
				}
				else if name == 'dw' || name == 'dayofweek' {
					this.setDayOfWeek(value)
				}
				else if name == 'dy' || name == 'dayofyear' {
					this.setDayOfYear(value)
				}
			}
			else if name[0] == 'h' && (name == 'h' || name == 'hour' || name == 'hours') {
				this.setHours(value)
			}
			else if name[0] == 'm' {
				if name == 'ms' || name == 'millisecond' || name == 'milliseconds' {
					this.setMilliseconds(value)
				}
				else if name == 'mn' || name == 'minute' || name == 'minutes' {
					this.setMinutes(value)
				}
				else if name == 'm' || name == 'month' || name == 'months' {
					this.setMonth(value)
				}
			}
			else if name[0] == 's' && (name == 's' || name == 'second' || name == 'seconds') {
				this.setSeconds(value)
			}
			else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
				this.setWeek(value)
			}
			else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
				this.setFullYear(value)
			}
		}

		return this
	} // }}}
	set(name: String, value: String, utc: Boolean = false): Date ~ ParseError => this.set(name, value.toInt(), utc)
	overwrite setDate(value: Number): Date  { // {{{
		precursor(value)

		return this
	} // }}}
	setDate(value: String): Date ~ ParseError => this.setDate(value.toInt())
	setDayOfMonth(value: Number): Date => this.setDate(value)
	setDayOfMonth(value: String): Date ~ ParseError => this.setDate(value.toInt())
	setDayOfWeek(value: Number): Date { // {{{
		const current = (this.getDay() - 1).mod(7)
		value = (value - 1).mod(7)

		this.add('day', value - current)

		return this
	} // }}}
	setDayOfWeek(value: String): Date ~ ParseError => this.setDayOfWeek(value.toInt())
	setDayOfYear(value: Number): Date { // {{{
		let m = 0
		for const i from 0 til 12 {
			if i == 1 {
				if this.isLeapYear() {
					if value > $months[i] + 1 {
						m++
						value -= $months[i] + 1
					}
				}
				else {
					if value > $months[i] {
						m++
						value -= $months[i]
					}
				}
			}
			else {
				if value > $months[i] {
					m++
					value -= $months[i]
				}
			}
		}

		this.setMonth(m)
		this.setDate(value)

		return this
	} // }}}
	setDayOfYear(value: String): Date ~ ParseError => this.setDayOfYear(value.toInt())
	overwrite setUTCDate(value: Number): Date  { // {{{
		precursor(value)

		return this
	} // }}}
	setUTCDate(value: String): Date ~ ParseError => this.setUTCDate(value.toInt())
	setUTCDayOfMonth(value: Number): Date => this.setUTCDate(value)
	setUTCDayOfMonth(value: String): Date ~ ParseError => this.setUTCDate(value.toInt())
	setUTCDayOfWeek(value: Number): Date { // {{{
		const current = (this.getUTCDay() - 1).mod(7)
		value = (value - 1).mod(7)

		this.add('day', value - current)

		return this
	} // }}}
	setUTCDayOfWeek(value: String): Date ~ ParseError => this.setUTCDayOfWeek(value.toInt())
	setUTCDayOfYear(value: Number): Date { // {{{
		let m = 0
		for const i from 0 til 12 {
			if i == 1 {
				if this.isLeapYear(true) {
					if value > $months[i] + 1 {
						m++
						value -= $months[i] + 1
					}
				}
				else {
					if value > $months[i] {
						m++
						value -= $months[i]
					}
				}
			}
			else {
				if value > $months[i] {
					m++
					value -= $months[i]
				}
			}
		}

		this.setUTCMonth(m)
		this.setUTCDate(value)

		return this
	} // }}}
	setUTCDayOfYear(value: String): Date ~ ParseError => this.setUTCDayOfYear(value.toInt())
	setUTCWeek(value: Number): Date { // {{{
		const w = this.getUTCWeek()
		if w != 0 || this.getUTCMonth() == 0 {
			this.add('week', value - w)
		}
		else {
			this.rewind('week', 1).add('week', value - this.getUTCWeek())
		}
		return this
	} // }}}
	setUTCWeek(value: String): Date ~ ParseError => this.setUTCWeek(value.toInt())
	setWeek(value: Number): Date { // {{{
		const w = this.getWeek()
		if w != 0 || this.getMonth() == 0 {
			this.add('week', value - w)
		}
		else {
			this.rewind('week', 1).add('week', value - this.getWeek())
		}

		return this
	} // }}}
	setWeek(value: String): Date ~ ParseError => this.setWeek(value.toInt())
	startOf(space: String, utc: Boolean = false): Date { // {{{
		if utc {
			switch space {
				'year' => {
					this.setUTCMonth(0)
					this.setUTCDate(1)
					this.setUTCHours(0)
					this.setUTCMinutes(0)
					this.setUTCSeconds(0)
					this.setUTCMilliseconds(0)
				}
				'month' => {
					this.setUTCDate(1)
					this.setUTCHours(0)
					this.setUTCMinutes(0)
					this.setUTCSeconds(0)
					this.setUTCMilliseconds(0)
				}
				'day' => {
					this.setUTCHours(0)
					this.setUTCMinutes(0)
					this.setUTCSeconds(0)
					this.setUTCMilliseconds(0)
				}
				'hour' => {
					this.setUTCMinutes(0)
					this.setUTCSeconds(0)
					this.setUTCMilliseconds(0)
				}
				'minute' => {
					this.setUTCSeconds(0)
					this.setUTCMilliseconds(0)
				}
				'second' => {
					this.setUTCMilliseconds(0)
				}
				'week' => {
					this.rewind('day', (this.getUTCDay() - 1).mod(7))
					this.setUTCHours(0)
					this.setUTCMinutes(0)
					this.setUTCSeconds(0)
					this.setUTCMilliseconds(0)
				}
			}
		}
		else {
			switch space {
				'year' => {
					this.setMonth(0)
					this.setDate(1)
					this.setHours(0)
					this.setMinutes(0)
					this.setSeconds(0)
					this.setMilliseconds(0)
				}
				'month' => {
					this.setDate(1)
					this.setHours(0)
					this.setMinutes(0)
					this.setSeconds(0)
					this.setMilliseconds(0)
				}
				'day' => {
					this.setHours(0)
					this.setMinutes(0)
					this.setSeconds(0)
					this.setMilliseconds(0)
				}
				'hour' => {
					this.setMinutes(0)
					this.setSeconds(0)
					this.setMilliseconds(0)
				}
				'minute' => {
					this.setSeconds(0)
					this.setMilliseconds(0)
				}
				'second' => {
					this.setMilliseconds(0)
				}
				'week' => {
					this.rewind('day', (this.getDay() - 1).mod(7))
					this.setHours(0)
					this.setMinutes(0)
					this.setSeconds(0)
					this.setMilliseconds(0)
				}
			}
		}

		return this
	} // }}}
}

export Date