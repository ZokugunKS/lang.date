require|import '@zokugun/lang'

const $months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

type NS = Number | String

enum DateField {
	DAY
	DAY_OF_WEEK
	DAY_OF_YEAR
	HOUR
	MINUTE
	MILLISECOND
	MONTH
	SECOND
	WEEK
	YEAR
	YEAR_OF_WEEK

	static fromString(value: String): DateField ~ ParseError { // {{{
		switch value[0] {
			'd' => {
				if value == 'd' | 'day' {
					return DateField::DAY
				}
				else if value == 'dow' | 'dayofweek' | 'day_of_week' {
					return DateField::DAY
				}
				if value == 'doy' | 'dayofyear' | 'day_of_year' {
					return DateField::DAY
				}
			}
			'h' => return DateField::HOUR if value == 'h' | 'hour'
			'm' => {
				if value == 'ms' | 'millisecond' {
					return DateField::MILLISECOND
				}
				else if value == 'min' | 'minute' {
					return DateField::MINUTE
				}
				else if value == 'm' | 'month' {
					return DateField::MONTH
				}
			}
			's' => return DateField::SECOND if value == 's' | 'sec' | 'second'
			'w' => return DateField::WEEK if value == 'w' | 'week'
			'y' => {
				if value == 'y' | 'year' {
					return DateField::YEAR
				}
				else if value == 'yow' | 'yearofweek' | 'year_of_week' {
					return DateField::YEAR
				}
			}
		}

		throw new ParseError(`"\(value)" can't be converted to a DateField`)
	} // }}}
}

enum TimeUnit {
	CENTURIES
	DAYS
	DECADES
	HALF_DAYS
	HOURS
	MILLENNIA
	MILLISECONDS
	MINUTES
	MONTHS
	QUARTERS
	SECONDS
	SEMESTERS
	WEEKS
	YEARS

	static fromString(value: String): TimeUnit ~ ParseError { // {{{
		switch value[0] {
			'c' => return TimeUnit::CENTURIES if value == 'c' | 'century' | 'centuries'
			'd' => {
				if value == 'd' | 'day' | 'days' {
					return TimeUnit::DAYS
				}
				else if value == 'dd' | 'decade' | 'decades' {
					return TimeUnit::DECADES
				}
			}
			'h' => {
				if value == 'h' | 'hour' | 'hours' {
					return TimeUnit::HOURS
				}
				else if value == 'hd' | 'halfday' | 'halfdays' | 'half_day' | 'half_days' {
					return TimeUnit::HALF_DAYS
				}
			}
			'm' => {
				if value == 'ms' | 'millisecond' | 'milliseconds' {
					return TimeUnit::MILLISECONDS
				}
				else if value == 'min' | 'minute' | 'minutes' {
					return TimeUnit::MINUTES
				}
				else if value == 'm' | 'month' | 'months' {
					return TimeUnit::MONTHS
				}
				else if value == 'mil' | 'millennia' {
					return TimeUnit::MILLENNIA
				}
			}
			'q' => return TimeUnit::QUARTERS if value == 'q' | 'quarter' | 'quarters'
			's' => {
				if value == 's' | 'sec' | 'second' | 'seconds' {
					return TimeUnit::SECONDS
				}
				else if value == 'sem' | 'semester' | 'semesters' {
					return TimeUnit::SEMESTERS
				}
			}
			'w' => return TimeUnit::WEEKS if value == 'w' | 'week' | 'weeks'
			'y' => return TimeUnit::YEARS if value == 'y' | 'year' | 'years'
		}

		throw new ParseError(`"\(value)" can't be converted to a TimeUnit`)
	} // }}}
}

enum WeekField {
	SUNDAY
	MONDAY
	TUESDAY
	WEDNESDAY
	THURSDAY
	FRIDAY
	SATURDAY

	static fromString(value: String): WeekField ~ ParseError { // {{{
		switch value[0] {
			'f' => return WeekField::FRIDAY if value == 'fr' | 'fri' | 'friday'
			'm' => return WeekField::MONDAY if value == 'mo' | 'mon' | 'monday'
			's' => {
				if value == 'sa' | 'sat' | 'saturday' {
					return WeekField::SATURDAY
				}
				else if value == 'su' | 'sun' | 'sunday' {
					return WeekField::SUNDAY
				}
			}
			't' => {
				if value == 'th' | 'thu' | 'thursday' {
					return WeekField::THURSDAY
				}
				else if value == 'tu' | 'tue' | 'tuesday' {
					return WeekField::TUESDAY
				}
			}
			'w' => return WeekField::WEDNESDAY if value == 'we' | 'wed' | 'wednesday'
		}
		throw new ParseError(`"\(value)" can't be converted to a WeekField`)
	} // }}}
}

disclose Date {
	constructor()
	constructor(date: Date)
	constructor(time: Number)

	internal {
		constructor(year: NS, month: NS, day: NS = 1, hours: NS = 0, minutes: NS = 0, seconds: NS = 0, milliseconds: NS = 0)
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
		toISOString(): String
	}
}

impl Date {
	static {
		create(...args): Date { // {{{
			if args.length != 0 {
				if args[0] is NS {
					return new Date(...args)
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
		getDaysInYear(year: Number): Number => Date.isInLeapYear(year) ? 366 : 365
		getTime(value: Date): Number => value.getTime()
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
		isInLeapYear(year: Number): Boolean => (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
		isTime(value: Date): Boolean => true
		isTime(value: Object): Boolean { // {{{
			return value.getEpochTime is Function || value.epochTime is Function || value.getTime is Function || value.time is Function
		} // }}}
		isTime(value): Boolean => false
		today(): Date => new Date().midnight()
		tomorrow(): Date => new Date().midnight().plus(TimeUnit::DAYS, 1)
		yesterday(): Date => new Date().midnight().minus(TimeUnit::DAYS, 1)
	}
	overwrite constructor(year: NS, month: NS, day: NS = 1, hours: NS = 0, minutes: NS = 0, seconds: NS = 0, milliseconds: NS = 0) { // {{{
		this()

		this.setUTCFullYear(year, month - 1, day)
		this.setUTCHours(hours, minutes, seconds, milliseconds)
	} // }}}
	difference(unit: TimeUnit, date: Date): Number { // {{{
		switch unit {
			TimeUnit::CENTURIES		=> {
				return this.difference(TimeUnit::YEARS, date) /. 100
			}
			TimeUnit::DAYS			=> {
				return (date.getTime() - this.getTime()) /. 86400000
			}
			TimeUnit::DECADES		=> {
				return this.difference(TimeUnit::YEARS, date) /. 10
			}
			TimeUnit::HALF_DAYS		=> {
				return (date.getTime() - this.getTime()) /. 3600000 /. 12
			}
			TimeUnit::HOURS			=> {
				return (date.getTime() - this.getTime()) /. 3600000
			}
			TimeUnit::MILLENNIA		=> {
				return this.difference(TimeUnit::YEARS, date) /. 1_000
			}
			TimeUnit::MILLISECONDS	=> {
				return date.getTime() - this.getTime()
			}
			TimeUnit::MINUTES		=> {
				return (date.getTime() - this.getTime()) /. 60000
			}
			TimeUnit::MONTHS		=> {
				auto that = this

				if date.getTime() < this.getTime() {
					that = date
					date = this
				}

				let d = date.getMonth() - that.getMonth() - 2

				if date.getYear() > that.getYear() {
					d += (date.getYear() - that.getYear() - 1) * 12
				}

				if date.getDay() > that.getDay() {
					++d
				}
				else if date.getDay() == that.getDay() {
					if date.getHour() > that.getHour() {
						++d
					}
					else if date.getHour() == that.getHour() {
						if date.getMinute() > that.getMinute() {
							++d
						}
						else if date.getMinute() == that.getMinute() {
							if date.getSecond() > that.getSecond() || (date.getSecond() == that.getSecond() && date.getMillisecond() >= that.getMillisecond()) {
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
			TimeUnit::QUARTERS		=> {
				return this.difference(TimeUnit::MONTHS, date) /. 3
			}
			TimeUnit::SECONDS		=> {
				return (date.getTime() - this.getTime()) /. 1000
			}
			TimeUnit::SEMESTERS		=> {
				return this.difference(TimeUnit::MONTHS, date) /. 6
			}
			TimeUnit::WEEKS			=> {
				return (date.getTime() - this.getTime()) /. 86400000 /. 7
			}
			TimeUnit::YEARS			=> {
				auto that = this

				if date.getTime() < this.getTime() {
					that = date
					date = this
				}

				let d = date.getYear() - that.getYear() - 2

				if date.getMonth() > that.getMonth() {
					++d
				}
				else if date.getMonth() == that.getMonth() {
					if date.getDay() > that.getDay() {
						++d
					}
					else if date.getDay() == that.getDay() {
						if date.getHour() > that.getHour() {
							++d
						}
						else if date.getHour() == that.getHour() {
							if date.getMinute() > that.getMinute() {
								++d
							}
							else if date.getMinute() == that.getMinute() {
								if date.getSecond() > that.getSecond() || (date.getSecond() == that.getSecond() && date.getMillisecond() >= that.getMillisecond()) {
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
		}

		return 0
	} // }}}
	difference(unit: TimeUnit, ...args): Number => this.difference(unit, Date.create(...args))
	difference(unit: String, date: Date): Number ~ ParseError => this.difference(TimeUnit.fromString(unit), date)
	difference(unit: String, ...args): Number ~ ParseError => this.difference(TimeUnit.fromString(unit), Date.create(...args))
	endOf(field: DateField): this { // {{{
		switch field {
			DateField::YEAR => {
				this.setUTCMonth(11)
				this.setUTCDate(this.getDaysInMonth())
				this.setUTCHours(23)
				this.setUTCMinutes(59)
				this.setUTCSeconds(59)
				this.setUTCMilliseconds(999)
			}
			DateField::MONTH => {
				this.setUTCDate(this.getDaysInMonth())
				this.setUTCHours(23)
				this.setUTCMinutes(59)
				this.setUTCSeconds(59)
				this.setUTCMilliseconds(999)
			}
			DateField::DAY => {
				this.setUTCHours(23)
				this.setUTCMinutes(59)
				this.setUTCSeconds(59)
				this.setUTCMilliseconds(999)
			}
			DateField::HOUR => {
				this.setUTCMinutes(59)
				this.setUTCSeconds(59)
				this.setUTCMilliseconds(999)
			}
			DateField::MINUTE => {
				this.setUTCSeconds(59)
				this.setUTCMilliseconds(999)
			}
			DateField::SECOND => {
				this.setUTCMilliseconds(999)
			}
			DateField::WEEK => {
				this.plusDays(6 - (this.getUTCDay() - 1).mod(7))
				this.setUTCHours(23)
				this.setUTCMinutes(59)
				this.setUTCSeconds(59)
				this.setUTCMilliseconds(999)
			}
		}
	} // }}}
	endOf(field: String): this ~ ParseError => this.endOf(DateField.fromString(field))
	future(field: WeekField): this { // {{{
		const dw = this.getDayOfWeek()

		if dw == field {
			this.plusDays(7)
		}
		else {
			this.plusDays(field < dw ? field + 7 - dw : field - dw)
		}
	} // }}}
	future(field: String): this ~ ParseError => this.future(WeekField.fromString(field))
	futureOrPresent(field: WeekField): this { // {{{
		const dw = this.getDayOfWeek()

		if dw != field {
			this.plusDays(field < dw ? field + 7 - dw : field - dw)
		}
	} // }}}
	futureOrPresent(field: String): this ~ ParseError => this.futureOrPresent(WeekField.fromString(field))
	getDay(): Number => this.getUTCDate()
	getDayOfWeek(): Number { // {{{
		const dw = this.getUTCDay()

		return dw == 0 ? 7 : dw
	} // }}}
	getDayOfYear(): Number { // {{{
		return Math.ceil((this.clone().midnight().getTime() - new Date(this.getYear(), 1, 1).getTime()) / 86400000) + 1
	} // }}}
	getDaysInMonth(): Number { // {{{
		const m = this.getMonth()
		if m == 2 && this.isInLeapYear() {
			return 29
		}
		else {
			return $months[m - 1]
		}
	} // }}}
	getDaysInYear(): Number => Date.getDaysInYear(this.getYear())
	getHour(): Number => this.getUTCHours()
	getMillisecond(): Number => this.getUTCMilliseconds()
	getMinute(): Number => this.getUTCMinutes()
	getMonth(): Number => this.getUTCMonth() + 1
	getSecond(): Number => this.getUTCSeconds()
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
	isAfter(value: Date): Boolean => this.getTime() > value.getTime()
	isAfter(value): Boolean { // {{{
		const time = Date.isTime(value) ? Date.getTime(value) : Date.create(value).getTime()

		return this.getTime() > time
	} // }}}
	isAfter(...args): Boolean => this.isAfter(Date.create(...args))
	isBefore(value: Date): Boolean => this.getTime() < value.getTime()
	isBefore(value): Boolean { // {{{
		const time = Date.isTime(value) ? Date.getTime(value) : Date.create(value).getTime()

		return this.getTime() < time
	} // }}}
	isBefore(...args): Boolean => this.isBefore(Date.create(...args))
	isBetween(value1: Date, value2: Date): Boolean { // {{{
		const time1 = value1.getTime()
		const time2 = value2.getTime()

		if time1 > time2 {
			return time2 <= this.getTime() <= time1
		}
		else {
			return time1 <= this.getTime() <= time2
		}
	} // }}}
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
			return value2 <= this.getTime() <= value1
		}
		else {
			return value1 <= this.getTime() <= value2
		}
	} // }}}
	isInLeapYear(): Boolean => Date.isInLeapYear(this.getUTCFullYear())
	isUTC(): Boolean => true
	midnight(): this { // {{{
		this.setHour(0)
		this.setMinute(0)
		this.setSecond(0)
		this.setMillisecond(0)
	} // }}}
	minus(unit: TimeUnit, value: Number): this { // {{{
		switch unit {
			TimeUnit::CENTURIES		=> this.setUTCFullYear(this.getUTCFullYear() - (value * 100))
			TimeUnit::DAYS			=> this.setUTCDate(this.getUTCDate() - value)
			TimeUnit::DECADES		=> this.setUTCFullYear(this.getUTCFullYear() - (value * 10))
			TimeUnit::HALF_DAYS		=> this.setUTCHours(this.getUTCHours() - (value * 12))
			TimeUnit::HOURS			=> this.setUTCHours(this.getUTCHours() - value)
			TimeUnit::MILLENNIA		=> this.setUTCFullYear(this.getUTCFullYear() - (value * 1_000))
			TimeUnit::MILLISECONDS	=> this.setUTCMilliseconds(this.getUTCMilliseconds() - value)
			TimeUnit::MINUTES		=> this.setUTCMinutes(this.getUTCMinutes() - value)
			TimeUnit::MONTHS		=> this.setUTCMonth(this.getUTCMonth() - value)
			TimeUnit::QUARTERS		=> this.setUTCMonth(this.getUTCMonth() - (value * 3))
			TimeUnit::SECONDS		=> this.setUTCSeconds(this.getUTCSeconds() - value)
			TimeUnit::SEMESTERS		=> this.setUTCMonth(this.getUTCMonth() - (value * 6))
			TimeUnit::WEEKS			=> this.setUTCDate(this.getUTCDate() - (value * 7))
			TimeUnit::YEARS			=> this.setUTCFullYear(this.getUTCFullYear() - value)
		}
	} // }}}
	minus(unit: TimeUnit, value: String): this ~ ParseError => this.minus(unit, value.toInt())
	minus(unit: String, value: Number): this ~ ParseError => this.minus(TimeUnit.fromString(unit), value)
	minus(unit: String, value: String): this ~ ParseError => this.minus(TimeUnit.fromString(unit), value.toInt())
	minus(properties: Dictionary<NS>): this ~ ParseError { // {{{
		for const value, unit of properties {
			this.minus(unit, value)
		}
	} // }}}
	minusDays(value: Number): this { // {{{
		this.setUTCDate(this.getUTCDate() - value)
	} // }}}
	minusDays(value: String): this ~ ParseError => this.minusDays(value.toInt())
	minusHours(value: Number): this { // {{{
		this.setUTCHours(this.getUTCHours() - value)
	} // }}}
	minusHours(value: String): this ~ ParseError => this.minusHours(value.toInt())
	minusMilliseconds(value: Number): this { // {{{
		this.setUTCMilliseconds(this.getUTCMilliseconds() - value)
	} // }}}
	minusMilliseconds(value: String): this ~ ParseError => this.minusMilliseconds(value.toInt())
	minusMinutes(value: Number): this { // {{{
		this.setUTCMinutes(this.getUTCMinutes() - value)
	} // }}}
	minusMinutes(value: String): this ~ ParseError => this.minusMinutes(value.toInt())
	minusMonths(value: Number): this { // {{{
		this.setUTCMonth(this.getUTCMonth() - value)
	} // }}}
	minusMonths(value: String): this ~ ParseError => this.minusMonths(value.toInt())
	minusSeconds(value: Number): this { // {{{
		this.setUTCSeconds(this.getUTCSeconds() - value)
	} // }}}
	minusSeconds(value: String): this ~ ParseError => this.minusSeconds(value.toInt())
	minusWeeks(value: Number): this { // {{{
		this.setUTCDate(this.getUTCDate() - (value * 7))
	} // }}}
	minusWeeks(value: String): this ~ ParseError => this.minusWeeks(value.toInt())
	minusYears(value: Number): this { // {{{
		this.setUTCFullYear(this.getUTCFullYear() - value)
	} // }}}
	minusYears(value: String): this ~ ParseError => this.minusYears(value.toInt())
	noon(): this { // {{{
		this.setHour(12)
		this.setMinute(0)
		this.setSecond(0)
		this.setMillisecond(0)
	} // }}}
	past(field: WeekField): this { // {{{
		const dw = this.getDayOfWeek()

		if dw == field {
			this.minusDays(7)
		}
		else {
			this.minusDays(dw < field ? dw + 7 - field : dw - field)
		}
	} // }}}
	past(field: String): this ~ ParseError => this.past(WeekField.fromString(field))
	pastOrPresent(field: WeekField): this { // {{{
		const dw = this.getDayOfWeek()

		if dw != field {
			this.minusDays(dw < field ? dw + 7 - field : dw - field)
		}
	} // }}}
	pastOrPresent(field: String): this ~ ParseError => this.pastOrPresent(WeekField.fromString(field))
	plus(unit: TimeUnit, value: Number): this { // {{{
		switch unit {
			TimeUnit::CENTURIES		=> this.setUTCFullYear(this.getUTCFullYear() + (value * 100))
			TimeUnit::DAYS			=> this.setUTCDate(this.getUTCDate() + value)
			TimeUnit::DECADES		=> this.setUTCFullYear(this.getUTCFullYear() + (value * 10))
			TimeUnit::HALF_DAYS		=> this.setUTCHours(this.getUTCHours() + (value * 12))
			TimeUnit::HOURS			=> this.setUTCHours(this.getUTCHours() + value)
			TimeUnit::MILLENNIA		=> this.setUTCFullYear(this.getUTCFullYear() + (value * 1_000))
			TimeUnit::MILLISECONDS	=> this.setUTCMilliseconds(this.getUTCMilliseconds() + value)
			TimeUnit::MINUTES		=> this.setUTCMinutes(this.getUTCMinutes() + value)
			TimeUnit::MONTHS		=> this.setUTCMonth(this.getUTCMonth() + value)
			TimeUnit::QUARTERS		=> this.setUTCMonth(this.getUTCMonth() + (value * 3))
			TimeUnit::SECONDS		=> this.setUTCSeconds(this.getUTCSeconds() + value)
			TimeUnit::SEMESTERS		=> this.setUTCMonth(this.getUTCMonth() + (value * 6))
			TimeUnit::WEEKS			=> this.setUTCDate(this.getUTCDate() + (value * 7))
			TimeUnit::YEARS			=> this.setUTCFullYear(this.getUTCFullYear() + value)
		}
	} // }}}
	plus(unit: TimeUnit, value: String): this ~ ParseError => this.plus(unit, value.toInt())
	plus(unit: String, value: Number): this ~ ParseError => this.plus(TimeUnit.fromString(unit), value)
	plus(unit: String, value: String): this ~ ParseError => this.plus(TimeUnit.fromString(unit), value.toInt())
	plus(properties: Dictionary<NS>): this ~ ParseError { // {{{
		for const value, unit of properties {
			this.plus(unit, value)
		}
	} // }}}
	plusDays(value: Number): this { // {{{
		this.setUTCDate(this.getUTCDate() + value)
	} // }}}
	plusDays(value: String): this ~ ParseError => this.plusDays(value.toInt())
	plusHours(value: Number): this { // {{{
		this.setUTCHours(this.getUTCHours() + value)
	} // }}}
	plusHours(value: String): this ~ ParseError => this.plusHours(value.toInt())
	plusMilliseconds(value: Number): this { // {{{
		this.setUTCMilliseconds(this.getUTCMilliseconds() + value)
	} // }}}
	plusMilliseconds(value: String): this ~ ParseError => this.plusMilliseconds(value.toInt())
	plusMinutes(value: Number): this { // {{{
		this.setUTCMinutes(this.getUTCMinutes() + value)
	} // }}}
	plusMinutes(value: String): this ~ ParseError => this.plusMinutes(value.toInt())
	plusMonths(value: Number): this { // {{{
		this.setUTCMonth(this.getUTCMonth() + value)
	} // }}}
	plusMonths(value: String): this ~ ParseError => this.plusMonths(value.toInt())
	plusSeconds(value: Number): this { // {{{
		this.setUTCSeconds(this.getUTCSeconds() + value)
	} // }}}
	plusSeconds(value: String): this ~ ParseError => this.plusSeconds(value.toInt())
	plusWeeks(value: Number): this { // {{{
		this.setUTCDate(this.getUTCDate() + (value * 7))
	} // }}}
	plusWeeks(value: String): this ~ ParseError => this.plusWeeks(value.toInt())
	plusYears(value: Number): this { // {{{
		this.setUTCFullYear(this.getUTCFullYear() + value)
	} // }}}
	plusYears(value: String): this ~ ParseError => this.plusYears(value.toInt())
	set(field: DateField, value: Number): this { // {{{
		switch field {
			DateField::DAY => {
				this.setUTCDate(value)
			}
			DateField::DAY_OF_WEEK => {
				this.setDayOfWeek(value)
			}
			DateField::DAY_OF_YEAR => {
				this.setDayOfYear(value)
			}
			DateField::HOUR => {
				this.setUTCHours(value)
			}
			DateField::MONTH => {
				this.setUTCMonth(value - 1)
			}
			DateField::MILLISECOND => {
				this.setUTCMilliseconds(value)
			}
			DateField::MINUTE => {
				this.setUTCMinutes(value)
			}
			DateField::SECOND => {
				this.setUTCSeconds(value)
			}
			DateField::WEEK => {
				this.setWeek(value)
			}
			DateField::YEAR => {
				this.setUTCFullYear(value)
			}
		}
	} // }}}
	set(field: DateField, value: String): this ~ ParseError => this.set(field, value.toInt())
	set(field: String, value: Number): this ~ ParseError => this.set(DateField.fromString(field), value)
	set(field: String, value: String): this ~ ParseError => this.set(DateField.fromString(field), value.toInt())
	set(properties: Dictionary<NS>): this ~ ParseError { // {{{
		for const value, field of properties {
			this.set(field, value)
		}
	} // }}}
	setDay(value: Number): this { // {{{
		this.setUTCDate(value)
	} // }}}
	setDay(value: String): this ~ ParseError => this.setDay(value.toInt())
	setDayOfWeek(value: Number): this { // {{{
		this.plusDays(value - this.getDayOfWeek())
	} // }}}
	setDayOfWeek(value: String): this ~ ParseError => this.setDayOfWeek(value.toInt())
	setDayOfYear(value: Number): this { // {{{
		let m = 0
		for const i from 0 til 12 {
			if i == 1 {
				if this.isInLeapYear() {
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
	} // }}}
	setDayOfYear(value: String): this ~ ParseError => this.setDayOfYear(value.toInt())
	setHour(value: Number): this { // {{{
		this.setUTCHours(value)
	} // }}}
	setHour(value: String): this ~ ParseError => this.setHour(value.toInt())
	setMillisecond(value: Number): this { // {{{
		this.setUTCMilliseconds(value)
	} // }}}
	setMillisecond(value: String): this ~ ParseError => this.setMillisecond(value.toInt())
	setMinute(value: Number): this { // {{{
		this.setUTCMinutes(value)
	} // }}}
	setMinute(value: String): this ~ ParseError => this.setMinute(value.toInt())
	setMonth(value: Number): this { // {{{
		this.setUTCMonth(value - 1)
	} // }}}
	setMonth(value: String): this ~ ParseError => this.setMonth(value.toInt())
	setSecond(value: Number): this { // {{{
		this.setUTCSeconds(value)
	} // }}}
	setSecond(value: String): this ~ ParseError => this.setSecond(value.toInt())
	setYear(value: Number): this { // {{{
		this.setUTCFullYear(value)
	} // }}}
	setYear(value: String): this ~ ParseError => this.setYear(value.toInt())
	setWeek(value: Number): this { // {{{
		const w = this.getWeek()

		if w != 0 || this.getMonth() == 1 {
			this.plusWeeks(value - w)
		}
		else {
			this.minusWeeks(1).plusWeeks(value - this.getWeek())
		}
	} // }}}
	setWeek(value: String): this ~ ParseError => this.setWeek(value.toInt())
	startOf(field: DateField): this { // {{{
		switch field {
			DateField::YEAR => {
				this.setUTCMonth(0)
				this.setUTCDate(1)
				this.setUTCHours(0)
				this.setUTCMinutes(0)
				this.setUTCSeconds(0)
				this.setUTCMilliseconds(0)
			}
			DateField::MONTH => {
				this.setUTCDate(1)
				this.setUTCHours(0)
				this.setUTCMinutes(0)
				this.setUTCSeconds(0)
				this.setUTCMilliseconds(0)
			}
			DateField::DAY => {
				this.setUTCHours(0)
				this.setUTCMinutes(0)
				this.setUTCSeconds(0)
				this.setUTCMilliseconds(0)
			}
			DateField::HOUR => {
				this.setUTCMinutes(0)
				this.setUTCSeconds(0)
				this.setUTCMilliseconds(0)
			}
			DateField::MINUTE => {
				this.setUTCSeconds(0)
				this.setUTCMilliseconds(0)
			}
			DateField::SECOND => {
				this.setUTCMilliseconds(0)
			}
			DateField::WEEK => {
				this.minusDays((this.getUTCDay() - 1).mod(7))
				this.setUTCHours(0)
				this.setUTCMinutes(0)
				this.setUTCSeconds(0)
				this.setUTCMilliseconds(0)
			}
		}
	} // }}}
	startOf(field: String): this ~ ParseError => this.startOf(DateField.fromString(field))
	toString(): String => this.toISOString()
}

export Date, DateField, TimeUnit, WeekField, ParseError