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

			if args.length {
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
				if value.getTime || value.time || value.getEpochTime || value.epochTime {
					return true
				}
			}

			return false
		} // }}}
		today(utc: Boolean = false): Date => new Date().midnight(utc)
		tomorrow(utc: Boolean = false): Date => new Date().midnight(utc).add('day', 1)
		yesterday(utc: Boolean = false): Date => new Date().midnight(utc).add('day', -1)
	}
	add(properties: Object): Date { // {{{
		for const :name of properties {
			if name[0] == 'd' && (name == 'd' || name == 'day' || name == 'days') {
				this.setDate(this.getDate() + properties[name]:NS.toInt())
			}
			else if name[0] == 'h' && (name == 'h' || name == 'hour' || name == 'hours') {
				this.setHours(this.getHours() + properties[name]:NS.toInt())
			}
			else if name[0] == 'm' {
				if name == 'ms' || name == 'millisecond' || name == 'milliseconds' {
					this.setMilliseconds(this.getMilliseconds() + properties[name]:NS.toInt())
				}
				else if name == 'mn' || name == 'minute' || name == 'minutes' {
					this.setMinutes(this.getMinutes() + properties[name]:NS.toInt())
				}
				else if name == 'm' || name == 'month' || name == 'months' {
					this.setMonth(this.getMonth() + properties[name]:NS.toInt())
				}
			}
			else if name[0] == 's' && (name == 's' || name == 'second' || name == 'seconds') {
				this.setSeconds(this.getSeconds() + properties[name]:NS.toInt())
			}
			else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
				this.setDate(this.getDate() + (properties[name]:NS.toInt() * 7))
			}
			else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
				this.setFullYear(this.getFullYear() + properties[name]:NS.toInt())
			}
		}

		return this
	} // }}}
	add(name: String, value: Number | String): Date { // {{{
		if name[0] == 'd' && (name == 'd' || name == 'day' || name == 'days') {
			this.setDate(this.getDate() + value.toInt())
		}
		else if name[0] == 'h' && (name == 'h' || name == 'hour' || name == 'hours') {
			this.setHours(this.getHours() + value.toInt())
		}
		else if name[0] == 'm' {
			if name == 'ms' || name == 'millisecond' || name == 'milliseconds' {
				this.setMilliseconds(this.getMilliseconds() + value.toInt())
			}
			else if name == 'mn' || name == 'minute' || name == 'minutes' {
				this.setMinutes(this.getMinutes() + value.toInt())
			}
			else if name == 'm' || name == 'month' || name == 'months' {
				this.setMonth(this.getMonth() + value.toInt())
			}
		}
		else if name[0] == 's' && (name == 's' || name == 'second' || name == 'seconds') {
			this.setSeconds(this.getSeconds() + value.toInt())
		}
		else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
			this.setDate(this.getDate() + (value.toInt() * 7))
		}
		else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
			this.setFullYear(this.getFullYear() + value.toInt())
		}

		return this
	} // }}}
	clone(): Date => new Date(this)
	difference(name: String, date: Date): Number { // {{{
		if name[0] == 'd' && (name == 'd' || name == 'day' || name == 'days') {
			return Math.round((date - this) / 86400000)
		}
		else if name[0] == 'h' && (name == 'h' || name == 'hour' || name == 'hours') {
			return Math.round((date - this) / 3600000)
		}
		else if name[0] == 'm' {
			if name == 'ms' || name == 'millisecond' || name == 'milliseconds' {
				return date - this
			}
			else if name == 'mn' || name == 'minute' || name == 'minutes' {
				return Math.round((date - this) / 60000)
			}
			else if name == 'm' || name == 'month' || name == 'months' {
				let that := this
				if date < this {
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
				return Math.round((date - this) / 1000)
			}
			else if name == 'sm' || name == 'semester' || name == 'semesters' {
				return Math.round(this.difference('month', date) / 6)
			}
		}
		else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
			return Math.round(Math.round((date - this) / 86400000) / 7)
		}
		else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
			let that := this
			if date < this {
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
	equals(value): Boolean => !(this < value || this > value)
	future(value: String, utc: Boolean = false): Date { // {{{
		value = value.toLowerCase()

		let index
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

		let index
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
	getDayOfYear(): Number => Math.ceil((this.clone().midnight() - new Date(this.getFullYear(), 0, 1)) / 86400000) + 1
	getUTCDayOfMonth(): Number => this.getUTCDate()
	getUTCDayOfWeek(): Number => this.getUTCDay()
	getUTCDayOfYear(): Number => Math.ceil((this.clone().midnight(true) - Date.create(this.getUTCFullYear(), 0, 1, true)) / 86400000) + 1
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
				if !this.getUTCWeek() {
					return this.getUTCFullYear() - 1
				}
			}
			else {
				this.setUTCDate(1)

				if !this.getUTCWeek() {
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
				if !this.getUTCWeek() {
					return this.getUTCFullYear() + 1
				}
			}
			else {
				this.setUTCDate(31)

				if !this.getUTCWeek() {
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
	getWeek() { // {{{
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
		if (days = days.mod(7)) && 8 - days >= 4 {
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
				if !this.getWeek() {
					return this.getFullYear() - 1
				}
			}
			else {
				this.setDate(1)

				if !this.getWeek() {
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
				if !this.getWeek() {
					return this.getFullYear() + 1
				}
			}
			else {
				this.setDate(31)

				if !this.getWeek() {
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

		return this > date
	} // }}}
	isAfter(...args): Boolean => this > Date.create(...args)
	isBefore(value): Boolean { // {{{
		let date
		if Date.isTime(value) {
			date = Date.getTime(value)
		}
		else {
			date = Date.create(value)
		}

		return this < date
	} // }}}
	isBefore(...args): Boolean => this < Date.create(...args)
	isBetween(value1, value2): Boolean { // {{{
		if Date.isTime(value1) {
			value1 = Date.getTime(value1)
		}
		else {
			value1 = Date.create(value1)
		}
		if Date.isTime(value2) {
			value2 = Date.getTime(value2)
		}
		else {
			value2 = Date.create(value2)
		}

		if value1 > value2 {
			return this <= value1 && this >= value2
		}
		else {
			return this >= value1 && this <= value2
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

		let index
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

		let index
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
	rewind(properties: Object): Date { // {{{
		for const :name of properties {
			if name[0] == 'd' && (name == 'd' || name == 'day' || name == 'days') {
				this.setDate(this.getDate() - properties[name]:NS.toInt())
			}
			else if name[0] == 'h' && (name == 'h' || name == 'hour' || name == 'hours') {
				this.setHours(this.getHours() - properties[name]:NS.toInt())
			}
			else if name[0] == 'm' {
				if name == 'ms' || name == 'millisecond' || name == 'milliseconds' {
					this.setMilliseconds(this.getMilliseconds() - properties[name]:NS.toInt())
				}
				else if name == 'mn' || name == 'minute' || name == 'minutes' {
					this.setMinutes(this.getMinutes() - properties[name]:NS.toInt())
				}
				else if name == 'm' || name == 'month' || name == 'months' {
					this.setMonth(this.getMonth() - properties[name]:NS.toInt())
				}
			}
			else if name[0] == 's' && (name == 's' || name == 'second' || name == 'seconds') {
				this.setSeconds(this.getSeconds() - properties[name]:NS.toInt())
			}
			else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
				this.setDate(this.getDate() - (properties[name]:NS.toInt() * 7))
			}
			else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
				this.setFullYear(this.getFullYear() - properties[name]:NS.toInt())
			}
		}

		return this
	} // }}}
	rewind(name: String, value: Number | String): Date { // {{{
		if name[0] == 'd' && (name == 'd' || name == 'day' || name == 'days') {
			this.setDate(this.getDate() - value.toInt())
		}
		else if name[0] == 'h' && (name == 'h' || name == 'hour' || name == 'hours') {
			this.setHours(this.getHours() - value.toInt())
		}
		else if name[0] == 'm' {
			if name == 'ms' || name == 'millisecond' || name == 'milliseconds' {
				this.setMilliseconds(this.getMilliseconds() - value.toInt())
			}
			else if name == 'mn' || name == 'minute' || name == 'minutes' {
				this.setMinutes(this.getMinutes() - value.toInt())
			}
			else if name == 'm' || name == 'month' || name == 'months' {
				this.setMonth(this.getMonth() - value.toInt())
			}
		}
		else if name[0] == 's' && (name == 's' || name == 'second' || name == 'seconds') {
			this.setSeconds(this.getSeconds() - value.toInt())
		}
		else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
			this.setDate(this.getDate() - (value.toInt() * 7))
		}
		else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
			this.setFullYear(this.getFullYear() - value.toInt())
		}

		return this
	} // }}}
	set(properties: Object, utc: Boolean = false): Date { // {{{
		if utc {
			for const :name of properties {
				if name[0] == 'd' {
					if name == 'dm' || name == 'dayofmonth' {
						this.setUTCDayOfMonth(properties[name]:NS.toInt())
					}
					else if name == 'dw' || name == 'dayofweek' {
						this.setUTCDayOfWeek(properties[name]:NS.toInt())
					}
					else if name == 'dy' || name == 'dayofyear' {
						this.setUTCDayOfYear(properties[name]:NS.toInt())
					}
				}
				else if name[0] == 'h' && (name == 'h' || name == 'hour' || name == 'hours') {
					this.setUTCHours(properties[name]:NS.toInt())
				}
				else if name[0] == 'm' {
					if name == 'ms' || name == 'millisecond' || name == 'milliseconds' {
						this.setUTCMilliseconds(properties[name]:NS.toInt())
					}
					else if name == 'mn' || name == 'minute' || name == 'minutes' {
						this.setUTCMinutes(properties[name]:NS.toInt())
					}
					else if name == 'm' || name == 'month' || name == 'months' {
						this.setUTCMonth(properties[name]:NS.toInt())
					}
				}
				else if name[0] == 's' && (name == 's' || name == 'second' || name == 'seconds') {
					this.setUTCSeconds(properties[name]:NS.toInt())
				}
				else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
					this.setUTCWeek(properties[name]:NS.toInt())
				}
				else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
					this.setUTCFullYear(properties[name]:NS.toInt())
				}
			}
		}
		else {
			for const :name of properties {
				if name[0] == 'd' {
					if name == 'dm' || name == 'dayofmonth' {
						this.setDayOfMonth(properties[name]:NS.toInt())
					}
					else if name == 'dw' || name == 'dayofweek' {
						this.setDayOfWeek(properties[name]:NS.toInt())
					}
					else if name == 'dy' || name == 'dayofyear' {
						this.setDayOfYear(properties[name]:NS.toInt())
					}
				}
				else if name[0] == 'h' && (name == 'h' || name == 'hour' || name == 'hours') {
					this.setHours(properties[name]:NS.toInt())
				}
				else if name[0] == 'm' {
					if name == 'ms' || name == 'millisecond' || name == 'milliseconds' {
						this.setMilliseconds(properties[name]:NS.toInt())
					}
					else if name == 'mn' || name == 'minute' || name == 'minutes' {
						this.setMinutes(properties[name]:NS.toInt())
					}
					else if name == 'm' || name == 'month' || name == 'months' {
						this.setMonth(properties[name]:NS.toInt())
					}
				}
				else if name[0] == 's' && (name == 's' || name == 'second' || name == 'seconds') {
					this.setSeconds(properties[name]:NS.toInt())
				}
				else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
					this.setWeek(properties[name]:NS.toInt())
				}
				else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
					this.setFullYear(properties[name]:NS.toInt())
				}
			}
		}

		return this
	} // }}}
	set(name: String, value: Number | String, utc: Boolean = false): Date { // {{{
		if utc {
			if name[0] == 'd' {
				if name == 'dm' || name == 'dayofmonth' {
					this.setUTCDayOfMonth(value.toInt())
				}
				else if name == 'dw' || name == 'dayofweek' {
					this.setUTCDayOfWeek(value.toInt())
				}
				else if name == 'dy' || name == 'dayofyear' {
					this.setUTCDayOfYear(value.toInt())
				}
			}
			else if name[0] == 'h' && (name == 'h' || name == 'hour' || name == 'hours') {
				this.setUTCHours(value.toInt())
			}
			else if name[0] == 'm' {
				if name == 'ms' || name == 'millisecond' || name == 'milliseconds' {
					this.setUTCMilliseconds(value.toInt())
				}
				else if name == 'mn' || name == 'minute' || name == 'minutes' {
					this.setUTCMinutes(value.toInt())
				}
				else if name == 'm' || name == 'month' || name == 'months' {
					this.setUTCMonth(value.toInt())
				}
			}
			else if name[0] == 's' && (name == 's' || name == 'second' || name == 'seconds') {
				this.setUTCSeconds(value.toInt())
			}
			else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
				this.setUTCWeek(value.toInt())
			}
			else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
				this.setUTCFullYear(value.toInt())
			}
		}
		else {
			if name[0] == 'd' {
				if name == 'dm' || name == 'dayofmonth' {
					this.setDayOfMonth(value.toInt())
				}
				else if name == 'dw' || name == 'dayofweek' {
					this.setDayOfWeek(value.toInt())
				}
				else if name == 'dy' || name == 'dayofyear' {
					this.setDayOfYear(value.toInt())
				}
			}
			else if name[0] == 'h' && (name == 'h' || name == 'hour' || name == 'hours') {
				this.setHours(value.toInt())
			}
			else if name[0] == 'm' {
				if name == 'ms' || name == 'millisecond' || name == 'milliseconds' {
					this.setMilliseconds(value.toInt())
				}
				else if name == 'mn' || name == 'minute' || name == 'minutes' {
					this.setMinutes(value.toInt())
				}
				else if name == 'm' || name == 'month' || name == 'months' {
					this.setMonth(value.toInt())
				}
			}
			else if name[0] == 's' && (name == 's' || name == 'second' || name == 'seconds') {
				this.setSeconds(value.toInt())
			}
			else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
				this.setWeek(value.toInt())
			}
			else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
				this.setFullYear(value.toInt())
			}
		}

		return this
	} // }}}
	setDayOfMonth(value: Number | String): Date { // {{{
		this.setDate(value)
		return this
	} // }}}
	setDayOfWeek(value: Number | String): Date { // {{{
		const current = (this.getDay() - 1).mod(7)
		value = (value.toInt() - 1).mod(7)

		this.add('day', value - current)

		return this
	} // }}}
	setDayOfYear(value: Number | String): Date { // {{{
		value = value.toInt()

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
	setUTCDayOfMonth(value: Number | String): Date { // {{{
		this.setUTCDate(value)

		return this
	} // }}}
	setUTCDayOfWeek(value: Number | String): Date { // {{{
		const current = (this.getUTCDay() - 1).mod(7)
		value = (value.toInt() - 1).mod(7)

		this.add('day', value - current)

		return this
	} // }}}
	setUTCDayOfYear(value: Number | String): Date { // {{{
		value = value.toInt()

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
	setUTCWeek(value: Number | String): Date { // {{{
		value = value.toInt()

		const w = this.getUTCWeek()
		if w || !this.getUTCMonth() {
			this.add('week', value - w)
		}
		else {
			this.rewind('week', 1).add('week', value - this.getUTCWeek())
		}
		return this
	} // }}}
	setWeek(value: Number | String): Date { // {{{
		value = value.toInt()

		const w = this.getWeek()
		if w || !this.getMonth() {
			this.add('week', value - w)
		}
		else {
			this.rewind('week', 1).add('week', value - this.getWeek())
		}

		return this
	} // }}}
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