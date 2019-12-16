require|import '@zokugun/lang'

const $months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
const $days = {
	full: ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday']
	abbr: ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat']
	short: ['su', 'mo', 'tu', 'we', 'th', 'fr', 'sa']
}

type NS = Number | String

disclose Date {
	constructor()
	constructor(date: Date)
	constructor(time: Number)
	toISOString(): String

	internal {
		constructor(year: NS, month: NS, day: NS = 1, hours: NS = 0, minutes: NS = 0, seconds: NS = 0, milliseconds: NS = 0)
		getTime(): Number
		getTimezoneOffset(): Number
		getUTCDate(): Number
		getUTCDay(): Number
		getUTCFullYear(): Number
		getUTCHours(): Number
		getUTCMilliseconds(): Number
		getUTCMinutes(): Number
		getUTCMonth(): Number
		getUTCSeconds(): Number
		setUTCDate(value: Number): Number
		setUTCFullYear(year: Number, month: Number = -1, day: Number = -1): Number
		setUTCHours(hours: Number, minutes: Number = -1, seconds: Number = -1, ms: Number = -1): Number
		setUTCMilliseconds(value: Number): Number
		setUTCMinutes(minutes: Number = -1, seconds: Number = -1, ms: Number = -1): Number
		setUTCMonth(value: Number, day: Number = -1): Number
		setUTCSeconds(seconds: Number = -1, ms: Number = -1): Number
		toUTCString(): String
	}
}

impl Date {
	static {
		create(...args): Date { // {{{
			if args.length != 0 {
				if args[0] is NS {
					#[rules(ignore-misfit)]
					return new Date(...args!!)
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
		getTime(value: Date): Number => value.getEpochTime()
		getTime(value: Object): Number { // {{{
			if value.getEpochTime is Function {
				return value.getEpochTime()
			}
			else if value.epochTime is Function {
				return value.epochTime()
			}
			else if value.getTime is Function {
				return value.getTime()
			}
			else {
				return value.time()
			}
		} // }}}
		getTime(value): Number => 0
		isTime(value: Date): Boolean => true
		isTime(value: Object): Boolean { // {{{
			return value.getEpochTime is Function || value.epochTime is Function || value.getTime is Function || value.time is Function
		} // }}}
		isTime(value): Boolean => false
		today(): Date => new Date().midnight()
		tomorrow(): Date => new Date().midnight().add('day', 1)
		yesterday(): Date => new Date().midnight().add('day', -1)
	}
	overwrite constructor(year: NS, month: NS, day: NS = 1, hours: NS = 0, minutes: NS = 0, seconds: NS = 0, milliseconds: NS = 0) { // {{{
		precursor(year, month - 1, day, hours, minutes, seconds, milliseconds)

		this.setUTCMinutes(this.getUTCMinutes() - this.getTimezoneOffset())
	} // }}}
	add(name: String, value: Number): Date { // {{{
		if name[0] == 'd' && (name == 'd' || name == 'day' || name == 'days') {
			this.setUTCDate(this.getUTCDate() + value)
		}
		else if name[0] == 'h' && (name == 'h' || name == 'hour' || name == 'hours') {
			this.setUTCHours(this.getUTCHours() + value)
		}
		else if name[0] == 'm' {
			if name == 'ms' || name == 'millisecond' || name == 'milliseconds' {
				this.setUTCMilliseconds(this.getUTCMilliseconds() + value)
			}
			else if name == 'mn' || name == 'minute' || name == 'minutes' {
				this.setUTCMinutes(this.getUTCMinutes() + value)
			}
			else if name == 'm' || name == 'month' || name == 'months' {
				this.setUTCMonth(this.getUTCMonth() + value)
			}
		}
		else if name[0] == 's' && (name == 's' || name == 'second' || name == 'seconds') {
			this.setUTCSeconds(this.getUTCSeconds() + value)
		}
		else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
			this.setUTCDate(this.getUTCDate() + (value * 7))
		}
		else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
			this.setUTCFullYear(this.getUTCFullYear() + value)
		}

		return this
	} // }}}
	add(properties: Dictionary): Date ~ ParseError { // {{{
		for const property: NS, name of properties {
			if name[0] == 'd' && (name == 'd' || name == 'day' || name == 'days') {
				this.setUTCDate(this.getUTCDate() + property.toInt())
			}
			else if name[0] == 'h' && (name == 'h' || name == 'hour' || name == 'hours') {
				this.setUTCHours(this.getUTCHours() + property.toInt())
			}
			else if name[0] == 'm' {
				if name == 'ms' || name == 'millisecond' || name == 'milliseconds' {
					this.setUTCMilliseconds(this.getUTCMilliseconds() + property.toInt())
				}
				else if name == 'mn' || name == 'minute' || name == 'minutes' {
					this.setUTCMinutes(this.getUTCMinutes() + property.toInt())
				}
				else if name == 'm' || name == 'month' || name == 'months' {
					this.setUTCMonth(this.getUTCMonth() + property.toInt())
				}
			}
			else if name[0] == 's' && (name == 's' || name == 'second' || name == 'seconds') {
				this.setUTCSeconds(this.getUTCSeconds() + property.toInt())
			}
			else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
				this.setUTCDate(this.getUTCDate() + (property.toInt() * 7))
			}
			else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
				this.setUTCFullYear(this.getUTCFullYear() + property.toInt())
			}
		}

		return this
	} // }}}
	add(name: String, value: String): Date ~ ParseError => this.add(name, value.toInt())
	difference(name: String, date: Date): Number { // {{{
		if name[0] == 'd' && (name == 'd' || name == 'day' || name == 'days') {
			return Math.round((date.getEpochTime() - this.getEpochTime()) / 86400000)
		}
		else if name[0] == 'h' && (name == 'h' || name == 'hour' || name == 'hours') {
			return Math.round((date.getEpochTime() - this.getEpochTime()) / 3600000)
		}
		else if name[0] == 'm' {
			if name == 'ms' || name == 'millisecond' || name == 'milliseconds' {
				return date.getEpochTime() - this.getEpochTime()
			}
			else if name == 'mn' || name == 'minute' || name == 'minutes' {
				return Math.round((date.getEpochTime() - this.getEpochTime()) / 60000)
			}
			else if name == 'm' || name == 'month' || name == 'months' {
				auto that = this
				if date.getEpochTime() < this.getEpochTime() {
					that = date
					date = this
				}

				let d = date.getMonth() - that.getMonth() - 2

				if date.getYear() > that.getYear() {
					d += (date.getYear() - that.getYear() - 1) * 12
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
				return Math.round((date.getEpochTime() - this.getEpochTime()) / 1000)
			}
			else if name == 'sm' || name == 'semester' || name == 'semesters' {
				return Math.round(this.difference('month', date) / 6)
			}
		}
		else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
			return Math.round(Math.round((date.getEpochTime() - this.getEpochTime()) / 86400000) / 7)
		}
		else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
			auto that = this
			if date.getEpochTime() < this.getEpochTime() {
				that = date
				date = this
			}

			let d = date.getYear() - that.getYear() - 2

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
	endOf(space: String): Date { // {{{
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

		return this
	} // }}}
	future(value: String): Date { // {{{
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

		const dw = this.getDayOfWeek()
		if dw == index {
			this.add('day', 7)
		}
		else {
			this.add('day', index < dw ? index + 7 - dw : index - dw)
		}

		return this
	} // }}}
	futureOrPresent(value: String): Date { // {{{
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

		const dw = this.getDayOfWeek()
		if dw != index {
			this.add('day', index < dw ? index + 7 - dw : index - dw)
		}

		return this
	} // }}}
	getDay(): Number => this.getUTCDate()
	getDayOfMonth(): Number => this.getUTCDate()
	getDayOfWeek(): Number { // {{{
		const dw = this.getUTCDay()

		return dw == 0 ? 7 : dw
	} // }}}
	getDayOfYear(): Number { // {{{
		return Math.ceil((this.clone().midnight().getTime() - new Date(this.getYear(), 1, 1).getTime()) / 86400000) + 1
	} // }}}
	getDaysInMonth(): Number { // {{{
		const m = this.getUTCMonth()
		if m == 1 && this.isLeapYear() {
			return 29
		}
		else {
			return $months[m]
		}
	} // }}}
	getDaysInYear(): Number => this.isLeapYear() ? 366 : 365
	getHours(): Number => this.getUTCHours()
	getMilliseconds(): Number => this.getUTCMilliseconds()
	getMinutes(): Number => this.getUTCMinutes()
	getMonth(): Number => this.getUTCMonth() + 1
	getSeconds(): Number => this.getUTCSeconds()
	getWeek(): Number { // {{{
		const dw = new Date(this.getYear(), 1, 1).getDayOfWeek() - 1
		const d = (this.getDayOfYear() + dw) / 7
		const w = Math.ceil(d) - (7 - dw >= 4 ? 0 : 1)

		if w == 53 {
			return d - 52 >= 0.5714 ? 53 : 0
		}
		else {
			return w
		}
	} // }}}
	getWeeksInYear(): Number { // {{{
		const dw = new Date(this.getYear(), 1, 1).getDayOfWeek().mod(7)
		let days = new Date(this.getYear(), 12, 31).getDayOfYear()

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
		if m == 1 {
			const d = this.getDay()

			if d == 1 {
				if this.getWeek() == 0 {
					return this.getYear() - 1
				}
			}
			else {
				this.setDay(1)

				if this.getWeek() == 0 {
					this.setDay(d)

					return this.getYear() - 1
				}
				else {
					this.setDay(d)
				}
			}
		}
		else if m == 12 {
			const d = this.getDay()

			if d == 31 {
				if this.getWeek() == 0 {
					return this.getYear() + 1
				}
			}
			else {
				this.setDay(31)

				if this.getWeek() == 0 {
					this.setDay(d)

					return this.getYear() + 1
				}
				else {
					this.setDay(d)
				}
			}
		}

		return this.getYear()
	} // }}}
	getYear(): Number => this.getUTCFullYear()
	isAfter(value: Date): Boolean => this.getEpochTime() > value.getEpochTime()
	isAfter(value): Boolean { // {{{
		const time = Date.isTime(value) ? Date.getTime(value) : Date.create(value).getEpochTime()

		return this.getEpochTime() > time
	} // }}}
	isAfter(...args): Boolean => this.isAfter(Date.create(...args))
	isBefore(value: Date): Boolean => this.getEpochTime() < value.getEpochTime()
	isBefore(value): Boolean { // {{{
		const time = Date.isTime(value) ? Date.getTime(value) : Date.create(value).getEpochTime()

		return this.getEpochTime() < time
	} // }}}
	isBefore(...args): Boolean => this.isBefore(Date.create(...args))
	isBetween(value1: Date, value2: Date): Boolean { // {{{
		const time1 = value1.getEpochTime()
		const time2 = value2.getEpochTime()

		if time1 > time2 {
			return time2 <= this.getEpochTime() <= time1
		}
		else {
			return time1 <= this.getEpochTime() <= time2
		}
	} // }}}
	isBetween(value1, value2): Boolean { // {{{
		if Date.isTime(value1) {
			value1 = Date.getTime(value1)
		}
		else {
			value1 = Date.create(value1).getEpochTime()
		}
		if Date.isTime(value2) {
			value2 = Date.getTime(value2)
		}
		else {
			value2 = Date.create(value2).getEpochTime()
		}

		if value1 > value2 {
			return value2 <= this.getEpochTime() <= value1
		}
		else {
			return value1 <= this.getEpochTime() <= value2
		}
	} // }}}
	isLeapYear(): Boolean { // {{{
		const year = this.getUTCFullYear()

		return (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
	} // }}}
	midnight(): Date { // {{{
		this.setHours(0)
		this.setMinutes(0)
		this.setSeconds(0)
		this.setMilliseconds(0)

		return this
	} // }}}
	noon(): Date { // {{{
		this.setUTCHours(12)
		this.setUTCMinutes(0)
		this.setUTCSeconds(0)
		this.setUTCMilliseconds(0)

		return this
	} // }}}
	past(value: String): Date { // {{{
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

		const dw = this.getDayOfWeek()
		if dw == index {
			this.rewind('day', 7)
		}
		else {
			this.rewind('day',  dw < index ? dw + 7 - index : dw - index)
		}

		return this
	} // }}}
	pastOrPresent(value: String): Date { // {{{
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

		const dw = this.getDayOfWeek()
		if dw != index {
			this.rewind('day',  dw < index ? dw + 7 - index : dw - index)
		}

		return this
	} // }}}
	rewind(properties: Dictionary): Date ~ ParseError { // {{{
		for const property: NS, name of properties {
			if name[0] == 'd' && (name == 'd' || name == 'day' || name == 'days') {
				this.setUTCDate(this.getUTCDate() - property.toInt())
			}
			else if name[0] == 'h' && (name == 'h' || name == 'hour' || name == 'hours') {
				this.setUTCHours(this.getUTCHours() - property.toInt())
			}
			else if name[0] == 'm' {
				if name == 'ms' || name == 'millisecond' || name == 'milliseconds' {
					this.setUTCMilliseconds(this.getUTCMilliseconds() - property.toInt())
				}
				else if name == 'mn' || name == 'minute' || name == 'minutes' {
					this.setUTCMinutes(this.getUTCMinutes() - property.toInt())
				}
				else if name == 'm' || name == 'month' || name == 'months' {
					this.setUTCMonth(this.getUTCMonth() - property.toInt())
				}
			}
			else if name[0] == 's' && (name == 's' || name == 'second' || name == 'seconds') {
				this.setUTCSeconds(this.getUTCSeconds() - property.toInt())
			}
			else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
				this.setUTCDate(this.getUTCDate() - (property.toInt() * 7))
			}
			else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
				this.setUTCFullYear(this.getUTCFullYear() - property.toInt())
			}
		}

		return this
	} // }}}
	rewind(name: String, value: Number): Date { // {{{
		if name[0] == 'd' && (name == 'd' || name == 'day' || name == 'days') {
			this.setUTCDate(this.getUTCDate() - value)
		}
		else if name[0] == 'h' && (name == 'h' || name == 'hour' || name == 'hours') {
			this.setUTCHours(this.getUTCHours() - value)
		}
		else if name[0] == 'm' {
			if name == 'ms' || name == 'millisecond' || name == 'milliseconds' {
				this.setUTCMilliseconds(this.getUTCMilliseconds() - value)
			}
			else if name == 'mn' || name == 'minute' || name == 'minutes' {
				this.setUTCMinutes(this.getUTCMinutes() - value)
			}
			else if name == 'm' || name == 'month' || name == 'months' {
				this.setUTCMonth(this.getUTCMonth() - value)
			}
		}
		else if name[0] == 's' && (name == 's' || name == 'second' || name == 'seconds') {
			this.setUTCSeconds(this.getUTCSeconds() - value)
		}
		else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
			this.setUTCDate(this.getUTCDate() - (value * 7))
		}
		else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
			this.setUTCFullYear(this.getUTCFullYear() - value)
		}

		return this
	} // }}}
	rewind(name: String, value: String): Date ~ ParseError => this.rewind(name, value.toInt())
	set(properties: Dictionary): Date ~ ParseError { // {{{
		for const property: NS, name of properties {
			if name[0] == 'd' {
				if name == 'd' || name == 'day' || name == 'dayofmonth' {
					this.setUTCDate(property.toInt())
				}
				else if name == 'dw' || name == 'dayofweek' {
					this.setDayOfWeek(property.toInt())
				}
				else if name == 'dy' || name == 'dayofyear' {
					this.setDayOfYear(property.toInt())
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
					this.setUTCMonth(property.toInt() - 1)
				}
			}
			else if name[0] == 's' && (name == 's' || name == 'second' || name == 'seconds') {
				this.setUTCSeconds(property.toInt())
			}
			else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
				this.setWeek(property.toInt())
			}
			else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
				this.setUTCFullYear(property.toInt())
			}
		}

		return this
	} // }}}
	set(name: String, value: Number): Date { // {{{
		if name[0] == 'd' {
			if name == 'd' || name == 'day' || name == 'dayofmonth' {
				this.setUTCDate(value)
			}
			else if name == 'dw' || name == 'dayofweek' {
				this.setDayOfWeek(value)
			}
			else if name == 'dy' || name == 'dayofyear' {
				this.setDayOfYear(value)
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
				this.setUTCMonth(value - 1)
			}
		}
		else if name[0] == 's' && (name == 's' || name == 'second' || name == 'seconds') {
			this.setUTCSeconds(value)
		}
		else if name[0] == 'w' && (name == 'w' || name == 'week' || name == 'weeks') {
			this.setWeek(value)
		}
		else if name[0] == 'y' && (name == 'y' || name == 'year' || name == 'years') {
			this.setUTCFullYear(value)
		}

		return this
	} // }}}
	set(name: String, value: String): Date ~ ParseError => this.set(name, value.toInt())
	setDay(value: Number): Date { // {{{
		this.setUTCDate(value)

		return this
	} // }}}
	setDay(value: String): Date ~ ParseError => this.setDay(value.toInt())
	setDayOfMonth(value: Number): Date { // {{{
		this.setUTCDate(value)

		return this
	} // }}}
	setDayOfMonth(value: String): Date ~ ParseError => this.setDayOfMonth(value.toInt())
	setDayOfWeek(value: Number): Date { // {{{
		this.add('day', value - this.getDayOfWeek())

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
		this.setDay(value)

		return this
	} // }}}
	setDayOfYear(value: String): Date ~ ParseError => this.setDayOfYear(value.toInt())
	setHours(value: Number): Date { // {{{
		this.setUTCHours(value)

		return this
	} // }}}
	setHours(value: String): Date ~ ParseError => this.setHours(value.toInt())
	setMilliseconds(value: Number): Date { // {{{
		this.setUTCMilliseconds(value)

		return this
	} // }}}
	setMilliseconds(value: String): Date ~ ParseError => this.setMilliseconds(value.toInt())
	setMinutes(value: Number): Date { // {{{
		this.setUTCMinutes(value)

		return this
	} // }}}
	setMinutes(value: String): Date ~ ParseError => this.setMinutes(value.toInt())
	setMonth(value: Number): Date { // {{{
		this.setUTCMonth(value - 1)

		return this
	} // }}}
	setMonth(value: String): Date ~ ParseError => this.setMonth(value.toInt())
	setSeconds(value: Number): Date { // {{{
		this.setUTCSeconds(value)

		return this
	} // }}}
	setSeconds(value: String): Date ~ ParseError => this.setSeconds(value.toInt())
	setYear(value: Number): Date { // {{{
		this.setUTCFullYear(value)

		return this
	} // }}}
	setYear(value: String): Date ~ ParseError => this.setYear(value.toInt())
	setWeek(value: Number): Date { // {{{
		const w = this.getWeek()
		if w != 0 || this.getMonth() == 1 {
			this.add('week', value - w)
		}
		else {
			this.rewind('week', 1).add('week', value - this.getWeek())
		}

		return this
	} // }}}
	setWeek(value: String): Date ~ ParseError => this.setWeek(value.toInt())
	startOf(space: String): Date { // {{{
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

		return this
	} // }}}
	toString(): String => this.toUTCString()
}

export Date, ParseError