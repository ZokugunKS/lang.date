#![bin]
#![error(off)]

extern {
	describe:	func
	it:			func
}

import {
	'chai'		for expect
	'..'
}

describe('manipulate', func() {
	const o = new Date()

	describe('endOf', func() { // {{{
		const r = new Date(o)

		describe('year', func() {
			it('enu', func() { // {{{
				const d = new Date(o).endOf(DateField::YEAR)

				expect(d.getYear()).to.equal(r.getYear())
				expect(d.getMonth()).to.equal(12)
				expect(d.getDay()).to.equal(31)
				expect(d.getHour()).to.equal(23)
				expect(d.getMinute()).to.equal(59)
				expect(d.getSecond()).to.equal(59)
				expect(d.getMillisecond()).to.equal(999)
			}) // }}}

			it('str', func() { // {{{
				const d = new Date(o).endOf('year')

				expect(d.getYear()).to.equal(r.getYear())
				expect(d.getMonth()).to.equal(12)
				expect(d.getDay()).to.equal(31)
				expect(d.getHour()).to.equal(23)
				expect(d.getMinute()).to.equal(59)
				expect(d.getSecond()).to.equal(59)
				expect(d.getMillisecond()).to.equal(999)
			}) // }}}
		})

		describe('month', func() {
			it('enu', func() { // {{{
				const d = new Date(o).endOf(DateField::MONTH)

				expect(d.getYear()).to.equal(r.getYear())
				expect(d.getMonth()).to.equal(r.getMonth())
				expect(d.getDay()).to.equal(r.getDaysInMonth())
				expect(d.getHour()).to.equal(23)
				expect(d.getMinute()).to.equal(59)
				expect(d.getSecond()).to.equal(59)
				expect(d.getMillisecond()).to.equal(999)
			}) // }}}

			it('str', func() { // {{{
				const d = new Date(o).endOf('month')

				expect(d.getYear()).to.equal(r.getYear())
				expect(d.getMonth()).to.equal(r.getMonth())
				expect(d.getDay()).to.equal(r.getDaysInMonth())
				expect(d.getHour()).to.equal(23)
				expect(d.getMinute()).to.equal(59)
				expect(d.getSecond()).to.equal(59)
				expect(d.getMillisecond()).to.equal(999)
			}) // }}}
		})

		describe('day', func() {
			it('enu', func() { // {{{
				const d = new Date(o).endOf(DateField::DAY)

				expect(d.getYear()).to.equal(r.getYear())
				expect(d.getMonth()).to.equal(r.getMonth())
				expect(d.getDay()).to.equal(r.getDay())
				expect(d.getHour()).to.equal(23)
				expect(d.getMinute()).to.equal(59)
				expect(d.getSecond()).to.equal(59)
				expect(d.getMillisecond()).to.equal(999)
			}) // }}}

			it('str', func() { // {{{
				const d = new Date(o).endOf('day')

				expect(d.getYear()).to.equal(r.getYear())
				expect(d.getMonth()).to.equal(r.getMonth())
				expect(d.getDay()).to.equal(r.getDay())
				expect(d.getHour()).to.equal(23)
				expect(d.getMinute()).to.equal(59)
				expect(d.getSecond()).to.equal(59)
				expect(d.getMillisecond()).to.equal(999)
			}) // }}}
		})

		describe('hour', func() {
			it('enu', func() { // {{{
				const d = new Date(o).endOf(DateField::HOUR)

				expect(d.getYear()).to.equal(r.getYear())
				expect(d.getMonth()).to.equal(r.getMonth())
				expect(d.getDay()).to.equal(r.getDay())
				expect(d.getHour()).to.equal(r.getHour())
				expect(d.getMinute()).to.equal(59)
				expect(d.getSecond()).to.equal(59)
				expect(d.getMillisecond()).to.equal(999)
			}) // }}}

			it('str', func() { // {{{
				const d = new Date(o).endOf('hour')

				expect(d.getYear()).to.equal(r.getYear())
				expect(d.getMonth()).to.equal(r.getMonth())
				expect(d.getDay()).to.equal(r.getDay())
				expect(d.getHour()).to.equal(r.getHour())
				expect(d.getMinute()).to.equal(59)
				expect(d.getSecond()).to.equal(59)
				expect(d.getMillisecond()).to.equal(999)
			}) // }}}
		})

		describe('minute', func() {
			it('enu', func() { // {{{
				const d = new Date(o).endOf(DateField::MINUTE)

				expect(d.getYear()).to.equal(r.getYear())
				expect(d.getMonth()).to.equal(r.getMonth())
				expect(d.getDay()).to.equal(r.getDay())
				expect(d.getHour()).to.equal(r.getHour())
				expect(d.getMinute()).to.equal(r.getMinute())
				expect(d.getSecond()).to.equal(59)
				expect(d.getMillisecond()).to.equal(999)
			}) // }}}

			it('str', func() { // {{{
				const d = new Date(o).endOf('minute')

				expect(d.getYear()).to.equal(r.getYear())
				expect(d.getMonth()).to.equal(r.getMonth())
				expect(d.getDay()).to.equal(r.getDay())
				expect(d.getHour()).to.equal(r.getHour())
				expect(d.getMinute()).to.equal(r.getMinute())
				expect(d.getSecond()).to.equal(59)
				expect(d.getMillisecond()).to.equal(999)
			}) // }}}
		})

		describe('second', func() {
			it('enu', func() { // {{{
				const d = new Date(o).endOf(DateField::SECOND)

				expect(d.getYear()).to.equal(r.getYear())
				expect(d.getMonth()).to.equal(r.getMonth())
				expect(d.getDay()).to.equal(r.getDay())
				expect(d.getHour()).to.equal(r.getHour())
				expect(d.getMinute()).to.equal(r.getMinute())
				expect(d.getSecond()).to.equal(r.getSecond())
				expect(d.getMillisecond()).to.equal(999)
			}) // }}}

			it('str', func() { // {{{
				const d = new Date(o).endOf('second')

				expect(d.getYear()).to.equal(r.getYear())
				expect(d.getMonth()).to.equal(r.getMonth())
				expect(d.getDay()).to.equal(r.getDay())
				expect(d.getHour()).to.equal(r.getHour())
				expect(d.getMinute()).to.equal(r.getMinute())
				expect(d.getSecond()).to.equal(r.getSecond())
				expect(d.getMillisecond()).to.equal(999)
			}) // }}}
		})
	}) // }}}

	describe('future', func() { // {{{
		it('2000-1-1 saturday str', func() { // {{{
			const d = Date.create(2000, 1, 1).future('saturday')

			expect(d.getYear()).to.equal(2000)
			expect(d.getMonth()).to.equal(1)
			expect(d.getDay()).to.equal(8)
		}) // }}}

		it('2000-1-1 sunday str', func() { // {{{
			const d = Date.create(2000, 1, 1).future('sunday')

			expect(d.getYear()).to.equal(2000)
			expect(d.getMonth()).to.equal(1)
			expect(d.getDay()).to.equal(2)
		}) // }}}

		it('2000-1-3 saturday str', func() { // {{{
			const d = Date.create(2000, 1, 3).future('saturday')

			expect(d.getYear()).to.equal(2000)
			expect(d.getMonth()).to.equal(1)
			expect(d.getDay()).to.equal(8)
		}) // }}}

		it('2000-1-3 sunday str', func() { // {{{
			const d = Date.create(2000, 1, 3).future('sunday')

			expect(d.getYear()).to.equal(2000)
			expect(d.getMonth()).to.equal(1)
			expect(d.getDay()).to.equal(9)
		}) // }}}
	}) // }}}

	describe('futureOrPresent', func() { // {{{
		it('2000-1-1 enu', func() { // {{{
			const d = Date.create(2000, 1, 1).futureOrPresent(WeekField::SATURDAY)

			expect(d.getYear()).to.equal(2000)
			expect(d.getMonth()).to.equal(1)
			expect(d.getDay()).to.equal(1)
		}) // }}}

		it('2000-1-1 str', func() { // {{{
			const d = Date.create(2000, 1, 1).futureOrPresent('saturday')

			expect(d.getYear()).to.equal(2000)
			expect(d.getMonth()).to.equal(1)
			expect(d.getDay()).to.equal(1)
		}) // }}}
	}) // }}}

	it('midnight', func() { // {{{
		const d = new Date(o).midnight()

		expect(d.getHour()).to.equal(0)
		expect(d.getMinute()).to.equal(0)
		expect(d.getSecond()).to.equal(0)
		expect(d.getMillisecond()).to.equal(0)
	}) // }}}

	describe('minus', func() { // {{{
		describe('year', func() {
			const r = new Date(o)
			r.setYear(r.getYear() - 1)

			it('i', func() { // {{{
				const d = new Date(o)

				d.minusYears(1)

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}

			it('s', func() { // {{{
				const d = new Date(o)

				d.minusYears('1')

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}

			it('d_i', func() { // {{{
				const d = new Date(o)

				d.minus({years: 1})

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}

			it('d_s', func() { // {{{
				const d = new Date(o)

				d.minus({years: '1'})

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}

			it('e_i', func() { // {{{
				const d = new Date(o)

				d.minus(TimeUnit::YEARS, 1)

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}

			it('e_s', func() { // {{{
				const d = new Date(o)

				d.minus(TimeUnit::YEARS, '1')

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}

			it('s_i', func() { // {{{
				const d = new Date(o)

				d.minus('year', 1)

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}

			it('s_s', func() { // {{{
				const d = new Date(o)

				d.minus('year', '1')

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}
		})

		describe('month', func() {
			const r = new Date(o)
			r.setMonth(r.getMonth() - 1)

			it('i', func() { // {{{
				const d = new Date(o)

				d.minusMonths(1)

				expect(d.getMonth()).to.equal(r.getMonth())
			}) // }}}

			it('s', func() { // {{{
				const d = new Date(o)

				d.minusMonths('1')

				expect(d.getMonth()).to.equal(r.getMonth())
			}) // }}}

			it('d_i', func() { // {{{
				const d = new Date(o)

				d.minus({months: 1})

				expect(d.getMonth()).to.equal(r.getMonth())
			}) // }}}

			it('d_s', func() { // {{{
				const d = new Date(o)

				d.minus({months: '1'})

				expect(d.getMonth()).to.equal(r.getMonth())
			}) // }}}

			it('e_i', func() { // {{{
				const d = new Date(o)

				d.minus(TimeUnit::MONTHS, 1)

				expect(d.getMonth()).to.equal(r.getMonth())
			}) // }}}

			it('e_s', func() { // {{{
				const d = new Date(o)

				d.minus(TimeUnit::MONTHS, '1')

				expect(d.getMonth()).to.equal(r.getMonth())
			}) // }}}

			it('s_i', func() { // {{{
				const d = new Date(o)

				d.minus('month', 1)

				expect(d.getMonth()).to.equal(r.getMonth())
			}) // }}}

			it('s_s', func() { // {{{
				const d = new Date(o)

				d.minus('month', '1')

				expect(d.getMonth()).to.equal(r.getMonth())
			}) // }}}
		})

		describe('week', func() {
			const r = new Date(o)
			r.setWeek(r.getWeek() - 1)

			it('i', func() { // {{{
				const d = new Date(o)

				d.minusWeeks(1)

				expect(d.getWeek()).to.equal(r.getWeek())
			}) // }}}

			it('s', func() { // {{{
				const d = new Date(o)

				d.minusWeeks('1')

				expect(d.getWeek()).to.equal(r.getWeek())
			}) // }}}

			it('d_i', func() { // {{{
				const d = new Date(o)

				d.minus({weeks: 1})

				expect(d.getWeek()).to.equal(r.getWeek())
			}) // }}}

			it('d_s', func() { // {{{
				const d = new Date(o)

				d.minus({weeks: '1'})

				expect(d.getWeek()).to.equal(r.getWeek())
			}) // }}}

			it('e_i', func() { // {{{
				const d = new Date(o)

				d.minus(TimeUnit::WEEKS, 1)

				expect(d.getWeek()).to.equal(r.getWeek())
			}) // }}}

			it('e_s', func() { // {{{
				const d = new Date(o)

				d.minus(TimeUnit::WEEKS, '1')

				expect(d.getWeek()).to.equal(r.getWeek())
			}) // }}}

			it('s_i', func() { // {{{
				const d = new Date(o)

				d.minus('week', 1)

				expect(d.getWeek()).to.equal(r.getWeek())
			}) // }}}

			it('s_s', func() { // {{{
				const d = new Date(o)

				d.minus('week', '1')

				expect(d.getWeek()).to.equal(r.getWeek())
			}) // }}}
		})

		describe('day', func() {
			const r = new Date(o)
			r.setDay(r.getDay() - 1)

			it('i', func() { // {{{
				const d = new Date(o)

				d.minusDays(1)

				expect(d.getDay()).to.equal(r.getDay())
			}) // }}}

			it('s', func() { // {{{
				const d = new Date(o)

				d.minusDays('1')

				expect(d.getDay()).to.equal(r.getDay())
			}) // }}}

			it('d_i', func() { // {{{
				const d = new Date(o)

				d.minus({days: 1})

				expect(d.getDay()).to.equal(r.getDay())
			}) // }}}

			it('d_s', func() { // {{{
				const d = new Date(o)

				d.minus({days: '1'})

				expect(d.getDay()).to.equal(r.getDay())
			}) // }}}

			it('e_i', func() { // {{{
				const d = new Date(o)

				d.minus(TimeUnit::DAYS, 1)

				expect(d.getDay()).to.equal(r.getDay())
			}) // }}}

			it('e_s', func() { // {{{
				const d = new Date(o)

				d.minus(TimeUnit::DAYS, '1')

				expect(d.getDay()).to.equal(r.getDay())
			}) // }}}

			it('s_i', func() { // {{{
				const d = new Date(o)

				d.minus('day', 1)

				expect(d.getDay()).to.equal(r.getDay())
			}) // }}}

			it('s_s', func() { // {{{
				const d = new Date(o)

				d.minus('day', '1')

				expect(d.getDay()).to.equal(r.getDay())
			}) // }}}
		})

		describe('hour', func() {
			const r = new Date(o)
			r.setHour(r.getHour() - 1)

			it('i', func() { // {{{
				const d = new Date(o)

				d.minusHours(1)

				expect(d.getHour()).to.equal(r.getHour())
			}) // }}}

			it('s', func() { // {{{
				const d = new Date(o)

				d.minusHours('1')

				expect(d.getHour()).to.equal(r.getHour())
			}) // }}}

			it('d_i', func() { // {{{
				const d = new Date(o)

				d.minus({hours: 1})

				expect(d.getHour()).to.equal(r.getHour())
			}) // }}}

			it('d_s', func() { // {{{
				const d = new Date(o)

				d.minus({hours: '1'})

				expect(d.getHour()).to.equal(r.getHour())
			}) // }}}

			it('e_i', func() { // {{{
				const d = new Date(o)

				d.minus(TimeUnit::HOURS, 1)

				expect(d.getHour()).to.equal(r.getHour())
			}) // }}}

			it('e_s', func() { // {{{
				const d = new Date(o)

				d.minus(TimeUnit::HOURS, '1')

				expect(d.getHour()).to.equal(r.getHour())
			}) // }}}

			it('s_i', func() { // {{{
				const d = new Date(o)

				d.minus('hour', 1)

				expect(d.getHour()).to.equal(r.getHour())
			}) // }}}

			it('s_s', func() { // {{{
				const d = new Date(o)

				d.minus('hour', '1')

				expect(d.getHour()).to.equal(r.getHour())
			}) // }}}
		})

		describe('minute', func() {
			const r = new Date(o)
			r.setMinute(r.getMinute() - 1)

			it('i', func() { // {{{
				const d = new Date(o)

				d.minusMinutes(1)

				expect(d.getMinute()).to.equal(r.getMinute())
			}) // }}}

			it('s', func() { // {{{
				const d = new Date(o)

				d.minusMinutes('1')

				expect(d.getMinute()).to.equal(r.getMinute())
			}) // }}}

			it('d_i', func() { // {{{
				const d = new Date(o)

				d.minus({minutes: 1})

				expect(d.getMinute()).to.equal(r.getMinute())
			}) // }}}

			it('d_s', func() { // {{{
				const d = new Date(o)

				d.minus({minutes: '1'})

				expect(d.getMinute()).to.equal(r.getMinute())
			}) // }}}

			it('e_i', func() { // {{{
				const d = new Date(o)

				d.minus(TimeUnit::MINUTES, 1)

				expect(d.getMinute()).to.equal(r.getMinute())
			}) // }}}

			it('e_s', func() { // {{{
				const d = new Date(o)

				d.minus(TimeUnit::MINUTES, '1')

				expect(d.getMinute()).to.equal(r.getMinute())
			}) // }}}

			it('s_i', func() { // {{{
				const d = new Date(o)

				d.minus('minute', 1)

				expect(d.getMinute()).to.equal(r.getMinute())
			}) // }}}

			it('s_s', func() { // {{{
				const d = new Date(o)

				d.minus('minute', '1')

				expect(d.getMinute()).to.equal(r.getMinute())
			}) // }}}
		})

		describe('second', func() {
			const r = new Date(o)
			r.setSecond(r.getSecond() - 1)

			it('i', func() { // {{{
				const d = new Date(o)

				d.minusSeconds(1)

				expect(d.getSecond()).to.equal(r.getSecond())
			}) // }}}

			it('s', func() { // {{{
				const d = new Date(o)

				d.minusSeconds('1')

				expect(d.getSecond()).to.equal(r.getSecond())
			}) // }}}

			it('d_i', func() { // {{{
				const d = new Date(o)

				d.minus({seconds: 1})

				expect(d.getSecond()).to.equal(r.getSecond())
			}) // }}}

			it('d_s', func() { // {{{
				const d = new Date(o)

				d.minus({seconds: '1'})

				expect(d.getSecond()).to.equal(r.getSecond())
			}) // }}}

			it('e_i', func() { // {{{
				const d = new Date(o)

				d.minus(TimeUnit::SECONDS, 1)

				expect(d.getSecond()).to.equal(r.getSecond())
			}) // }}}

			it('e_s', func() { // {{{
				const d = new Date(o)

				d.minus(TimeUnit::SECONDS, '1')

				expect(d.getSecond()).to.equal(r.getSecond())
			}) // }}}

			it('s_i', func() { // {{{
				const d = new Date(o)

				d.minus('second', 1)

				expect(d.getSecond()).to.equal(r.getSecond())
			}) // }}}

			it('s_s', func() { // {{{
				const d = new Date(o)

				d.minus('second', '1')

				expect(d.getSecond()).to.equal(r.getSecond())
			}) // }}}
		})

		describe('millisecond', func() {
			const r = new Date(o)
			r.setMillisecond(r.getMillisecond() - 1)

			it('i', func() { // {{{
				const d = new Date(o)

				d.minusMilliseconds(1)

				expect(d.getMillisecond()).to.equal(r.getMillisecond())
			}) // }}}

			it('s', func() { // {{{
				const d = new Date(o)

				d.minusMilliseconds('1')

				expect(d.getMillisecond()).to.equal(r.getMillisecond())
			}) // }}}

			it('d_i', func() { // {{{
				const d = new Date(o)

				d.minus({milliseconds: 1})

				expect(d.getMillisecond()).to.equal(r.getMillisecond())
			}) // }}}

			it('d_s', func() { // {{{
				const d = new Date(o)

				d.minus({milliseconds: '1'})

				expect(d.getMillisecond()).to.equal(r.getMillisecond())
			}) // }}}

			it('e_i', func() { // {{{
				const d = new Date(o)

				d.minus(TimeUnit::MILLISECONDS, 1)

				expect(d.getMillisecond()).to.equal(r.getMillisecond())
			}) // }}}

			it('e_s', func() { // {{{
				const d = new Date(o)

				d.minus(TimeUnit::MILLISECONDS, '1')

				expect(d.getMillisecond()).to.equal(r.getMillisecond())
			}) // }}}

			it('s_i', func() { // {{{
				const d = new Date(o)

				d.minus('millisecond', 1)

				expect(d.getMillisecond()).to.equal(r.getMillisecond())
			}) // }}}

			it('s_s', func() { // {{{
				const d = new Date(o)

				d.minus('millisecond', '1')

				expect(d.getMillisecond()).to.equal(r.getMillisecond())
			}) // }}}
		})

		describe('millennia', func() {
			const r = new Date(o)
			r.setYear(r.getYear() - 1_000)

			it('enu', func() { // {{{
				const d = new Date(o)

				d.minus(TimeUnit::MILLENNIA, 1)

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}

			it('str', func() { // {{{
				const d = new Date(o)

				d.minus('millennia', 1)

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}
		})

		describe('centuries', func() {
			const r = new Date(o)
			r.setYear(r.getYear() - 100)

			it('enu', func() { // {{{
				const d = new Date(o)

				d.minus(TimeUnit::CENTURIES, 1)

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}

			it('str', func() { // {{{
				const d = new Date(o)

				d.minus('centuries', 1)

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}
		})

		describe('decades', func() {
			const r = new Date(o)
			r.setYear(r.getYear() - 10)

			it('enu', func() { // {{{
				const d = new Date(o)

				d.minus(TimeUnit::DECADES, 1)

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}

			it('str', func() { // {{{
				const d = new Date(o)

				d.minus('decades', 1)

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}
		})

		describe('semesters', func() {
			const r = new Date(o)
			r.setMonth(r.getMonth() - 6)

			it('enu', func() { // {{{
				const d = new Date(o)

				d.minus(TimeUnit::SEMESTERS, 1)

				expect(d.getMonth()).to.equal(r.getMonth())
			}) // }}}

			it('str', func() { // {{{
				const d = new Date(o)

				d.minus('semesters', 1)

				expect(d.getMonth()).to.equal(r.getMonth())
			}) // }}}
		})

		describe('quarters', func() {
			const r = new Date(o)
			r.setMonth(r.getMonth() - 3)

			it('enu', func() { // {{{
				const d = new Date(o)

				d.minus(TimeUnit::QUARTERS, 1)

				expect(d.getMonth()).to.equal(r.getMonth())
			}) // }}}

			it('str', func() { // {{{
				const d = new Date(o)

				d.minus('quarters', 1)

				expect(d.getMonth()).to.equal(r.getMonth())
			}) // }}}
		})

		describe('half_days', func() {
			const r = new Date(o)
			r.setHour(r.getHour() - 12)

			it('enu', func() { // {{{
				const d = new Date(o)

				d.minus(TimeUnit::HALF_DAYS, 1)

				expect(d.getHour()).to.equal(r.getHour())
			}) // }}}

			it('str', func() { // {{{
				const d = new Date(o)

				d.minus('half_days', 1)

				expect(d.getHour()).to.equal(r.getHour())
			}) // }}}
		})
	}) // }}}

	it('noon', func() { // {{{
		const d = new Date(o).noon()

		expect(d.getHour()).to.equal(12)
		expect(d.getMinute()).to.equal(0)
		expect(d.getSecond()).to.equal(0)
		expect(d.getMillisecond()).to.equal(0)
	}) // }}}

	describe('past', func() { // {{{
		it('2000-1-1 saturday str', func() { // {{{
			const d = Date.create(2000, 1, 1).past('saturday')

			expect(d.getYear()).to.equal(1999)
			expect(d.getMonth()).to.equal(12)
			expect(d.getDay()).to.equal(25)
		}) // }}}

		it('2000-1-1 saturday enu', func() { // {{{
			const d = Date.create(2000, 1, 1).past(WeekField::SATURDAY)

			expect(d.getYear()).to.equal(1999)
			expect(d.getMonth()).to.equal(12)
			expect(d.getDay()).to.equal(25)
		}) // }}}

		it('2000-1-3 saturday str', func() { // {{{
			const d = Date.create(2000, 1, 3).past('saturday')

			expect(d.getYear()).to.equal(2000)
			expect(d.getMonth()).to.equal(1)
			expect(d.getDay()).to.equal(1)
		}) // }}}

		it('2000-1-3 saturday enu', func() { // {{{
			const d = Date.create(2000, 1, 3).past(WeekField::SATURDAY)

			expect(d.getYear()).to.equal(2000)
			expect(d.getMonth()).to.equal(1)
			expect(d.getDay()).to.equal(1)
		}) // }}}

		it('2000-1-3 sunday str', func() { // {{{
			const d = Date.create(2000, 1, 3).past('sunday')

			expect(d.getYear()).to.equal(2000)
			expect(d.getMonth()).to.equal(1)
			expect(d.getDay()).to.equal(2)
		}) // }}}

		it('2000-1-3 sunday enu', func() { // {{{
			const d = Date.create(2000, 1, 3).past(WeekField::SUNDAY)

			expect(d.getYear()).to.equal(2000)
			expect(d.getMonth()).to.equal(1)
			expect(d.getDay()).to.equal(2)
		}) // }}}
	}) // }}}

	describe('pastOrPresent', func() { // {{{
		it('pastOrPresent 2000-1-1 str', func() { // {{{
			const d = Date.create(2000, 1, 1).pastOrPresent('saturday')

			expect(d.getYear()).to.equal(2000)
			expect(d.getMonth()).to.equal(1)
			expect(d.getDay()).to.equal(1)
		}) // }}}

		it('pastOrPresent 2000-1-1 enu', func() { // {{{
			const d = Date.create(2000, 1, 1).pastOrPresent(WeekField::SATURDAY)

			expect(d.getYear()).to.equal(2000)
			expect(d.getMonth()).to.equal(1)
			expect(d.getDay()).to.equal(1)
		}) // }}}
	}) // }}}

	describe('plus', func() { // {{{
		describe('year', func() {
			const r = new Date(o)
			r.setYear(r.getYear() + 1)

			it('i', func() { // {{{
				const d = new Date(o)

				d.plusYears(1)

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}

			it('s', func() { // {{{
				const d = new Date(o)

				d.plusYears('1')

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}

			it('d_i', func() { // {{{
				const d = new Date(o)

				d.plus({years: 1})

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}

			it('d_s', func() { // {{{
				const d = new Date(o)

				d.plus({years: '1'})

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}

			it('e_i', func() { // {{{
				const d = new Date(o)

				d.plus(TimeUnit::YEARS, 1)

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}

			it('e_s', func() { // {{{
				const d = new Date(o)

				d.plus(TimeUnit::YEARS, '1')

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}

			it('s_i', func() { // {{{
				const d = new Date(o)

				d.plus('year', 1)

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}

			it('s_s', func() { // {{{
				const d = new Date(o)

				d.plus('year', '1')

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}

			it('end 29.28 +1', func() { // {{{
				const d = new Date(2008, 2, 29, 12, 0, 0)

				expect(d.toString()).to.equal('2008-02-29T12:00:00.000Z')

				d.plus(TimeUnit::YEARS, 1)

				expect(d.toString()).to.equal('2009-02-28T12:00:00.000Z')
			}) // }}}

			it('end 29.28 +4', func() { // {{{
				const d = new Date(2008, 2, 29, 12, 0, 0)

				expect(d.toString()).to.equal('2008-02-29T12:00:00.000Z')

				d.plus(TimeUnit::YEARS, 4)

				expect(d.toString()).to.equal('2012-02-29T12:00:00.000Z')
			}) // }}}
		})

		describe('month', func() {
			const r = new Date(o)
			r.setMonth(r.getMonth() + 1)

			it('i', func() { // {{{
				const d = new Date(o)

				d.plusMonths(1)

				expect(d.getMonth()).to.equal(r.getMonth())
			}) // }}}

			it('s', func() { // {{{
				const d = new Date(o)

				d.plusMonths('1')

				expect(d.getMonth()).to.equal(r.getMonth())
			}) // }}}

			it('d_i', func() { // {{{
				const d = new Date(o)

				d.plus({months: 1})

				expect(d.getMonth()).to.equal(r.getMonth())
			}) // }}}

			it('d_s', func() { // {{{
				const d = new Date(o)

				d.plus({months: '1'})

				expect(d.getMonth()).to.equal(r.getMonth())
			}) // }}}

			it('e_i', func() { // {{{
				const d = new Date(o)

				d.plus(TimeUnit::MONTHS, 1)

				expect(d.getMonth()).to.equal(r.getMonth())
			}) // }}}

			it('e_s', func() { // {{{
				const d = new Date(o)

				d.plus(TimeUnit::MONTHS, '1')

				expect(d.getMonth()).to.equal(r.getMonth())
			}) // }}}

			it('s_i', func() { // {{{
				const d = new Date(o)

				d.plus('month', 1)

				expect(d.getMonth()).to.equal(r.getMonth())
			}) // }}}

			it('s_s', func() { // {{{
				const d = new Date(o)

				d.plus('month', '1')

				expect(d.getMonth()).to.equal(r.getMonth())
			}) // }}}

			it('end 30.30 +1', func() { // {{{
				const d = new Date(2008, 5, 30, 12, 0, 0)

				expect(d.toString()).to.equal('2008-05-30T12:00:00.000Z')

				d.plus(TimeUnit::MONTHS, 1)

				expect(d.toString()).to.equal('2008-06-30T12:00:00.000Z')
			}) // }}}

			it('end 31.30 +1', func() { // {{{
				const d = new Date(2008, 5, 31, 12, 0, 0)

				expect(d.toString()).to.equal('2008-05-31T12:00:00.000Z')

				d.plus(TimeUnit::MONTHS, 1)

				expect(d.toString()).to.equal('2008-06-30T12:00:00.000Z')
			}) // }}}

			it('end 31.30 +4', func() { // {{{
				const d = new Date(2008, 5, 31, 12, 0, 0)

				expect(d.toString()).to.equal('2008-05-31T12:00:00.000Z')

				d.plus(TimeUnit::MONTHS, 4)

				expect(d.toString()).to.equal('2008-09-30T12:00:00.000Z')
			}) // }}}

			it('end 29.29 +11', func() { // {{{
				const d = new Date(2008, 2, 29, 12, 0, 0)

				expect(d.toString()).to.equal('2008-02-29T12:00:00.000Z')

				d.plus(TimeUnit::MONTHS, 11)

				expect(d.toString()).to.equal('2009-01-29T12:00:00.000Z')
			}) // }}}

			it('end 29.28 +12', func() { // {{{
				const d = new Date(2008, 2, 29, 12, 0, 0)

				expect(d.toString()).to.equal('2008-02-29T12:00:00.000Z')

				d.plus(TimeUnit::MONTHS, 12)

				expect(d.toString()).to.equal('2009-02-28T12:00:00.000Z')
			}) // }}}

			it('end 31.29 +1', func() { // {{{
				const d = new Date(2008, 1, 31, 12, 0, 0)

				expect(d.toString()).to.equal('2008-01-31T12:00:00.000Z')

				d.plus(TimeUnit::MONTHS, 1)

				expect(d.toString()).to.equal('2008-02-29T12:00:00.000Z')
			}) // }}}

			it('end 31.29 +13', func() { // {{{
				const d = new Date(2007, 1, 31, 12, 0, 0)

				expect(d.toString()).to.equal('2007-01-31T12:00:00.000Z')

				d.plus(TimeUnit::MONTHS, 13)

				expect(d.toString()).to.equal('2008-02-29T12:00:00.000Z')
			}) // }}}

			it('end 31.28 +1', func() { // {{{
				const d = new Date(2006, 1, 31, 12, 0, 0)

				expect(d.toString()).to.equal('2006-01-31T12:00:00.000Z')

				d.plus(TimeUnit::MONTHS, 1)

				expect(d.toString()).to.equal('2006-02-28T12:00:00.000Z')
			}) // }}}
		})

		describe('week', func() {
			const r = new Date(o)
			r.setWeek(r.getWeek() + 1)

			it('i', func() { // {{{
				const d = new Date(o)

				d.plusWeeks(1)

				expect(d.getWeek()).to.equal(r.getWeek())
			}) // }}}

			it('s', func() { // {{{
				const d = new Date(o)

				d.plusWeeks('1')

				expect(d.getWeek()).to.equal(r.getWeek())
			}) // }}}

			it('d_i', func() { // {{{
				const d = new Date(o)

				d.plus({weeks: 1})

				expect(d.getWeek()).to.equal(r.getWeek())
			}) // }}}

			it('d_s', func() { // {{{
				const d = new Date(o)

				d.plus({weeks: '1'})

				expect(d.getWeek()).to.equal(r.getWeek())
			}) // }}}

			it('e_i', func() { // {{{
				const d = new Date(o)

				d.plus(TimeUnit::WEEKS, 1)

				expect(d.getWeek()).to.equal(r.getWeek())
			}) // }}}

			it('e_s', func() { // {{{
				const d = new Date(o)

				d.plus(TimeUnit::WEEKS, '1')

				expect(d.getWeek()).to.equal(r.getWeek())
			}) // }}}

			it('s_i', func() { // {{{
				const d = new Date(o)

				d.plus('week', 1)

				expect(d.getWeek()).to.equal(r.getWeek())
			}) // }}}

			it('s_s', func() { // {{{
				const d = new Date(o)

				d.plus('week', '1')

				expect(d.getWeek()).to.equal(r.getWeek())
			}) // }}}
		})

		describe('day', func() {
			const r = new Date(o)
			r.setDay(r.getDay() + 1)

			it('i', func() { // {{{
				const d = new Date(o)

				d.plusDays(1)

				expect(d.getDay()).to.equal(r.getDay())
			}) // }}}

			it('s', func() { // {{{
				const d = new Date(o)

				d.plusDays('1')

				expect(d.getDay()).to.equal(r.getDay())
			}) // }}}

			it('d_i', func() { // {{{
				const d = new Date(o)

				d.plus({days: 1})

				expect(d.getDay()).to.equal(r.getDay())
			}) // }}}

			it('d_s', func() { // {{{
				const d = new Date(o)

				d.plus({days: '1'})

				expect(d.getDay()).to.equal(r.getDay())
			}) // }}}

			it('e_i', func() { // {{{
				const d = new Date(o)

				d.plus(TimeUnit::DAYS, 1)

				expect(d.getDay()).to.equal(r.getDay())
			}) // }}}

			it('e_s', func() { // {{{
				const d = new Date(o)

				d.plus(TimeUnit::DAYS, '1')

				expect(d.getDay()).to.equal(r.getDay())
			}) // }}}

			it('s_i', func() { // {{{
				const d = new Date(o)

				d.plus('day', 1)

				expect(d.getDay()).to.equal(r.getDay())
			}) // }}}

			it('s_s', func() { // {{{
				const d = new Date(o)

				d.plus('day', '1')

				expect(d.getDay()).to.equal(r.getDay())
			}) // }}}
		})

		describe('hour', func() {
			const r = new Date(o)
			r.setHour(r.getHour() + 1)

			it('i', func() { // {{{
				const d = new Date(o)

				d.plusHours(1)

				expect(d.getHour()).to.equal(r.getHour())
			}) // }}}

			it('s', func() { // {{{
				const d = new Date(o)

				d.plusHours('1')

				expect(d.getHour()).to.equal(r.getHour())
			}) // }}}

			it('d_i', func() { // {{{
				const d = new Date(o)

				d.plus({hours: 1})

				expect(d.getHour()).to.equal(r.getHour())
			}) // }}}

			it('d_s', func() { // {{{
				const d = new Date(o)

				d.plus({hours: '1'})

				expect(d.getHour()).to.equal(r.getHour())
			}) // }}}

			it('e_i', func() { // {{{
				const d = new Date(o)

				d.plus(TimeUnit::HOURS, 1)

				expect(d.getHour()).to.equal(r.getHour())
			}) // }}}

			it('e_s', func() { // {{{
				const d = new Date(o)

				d.plus(TimeUnit::HOURS, '1')

				expect(d.getHour()).to.equal(r.getHour())
			}) // }}}

			it('s_i', func() { // {{{
				const d = new Date(o)

				d.plus('hour', 1)

				expect(d.getHour()).to.equal(r.getHour())
			}) // }}}

			it('s_s', func() { // {{{
				const d = new Date(o)

				d.plus('hour', '1')

				expect(d.getHour()).to.equal(r.getHour())
			}) // }}}
		})

		describe('minute', func() {
			const r = new Date(o)
			r.setMinute(r.getMinute() + 1)

			it('i', func() { // {{{
				const d = new Date(o)

				d.plusMinutes(1)

				expect(d.getMinute()).to.equal(r.getMinute())
			}) // }}}

			it('s', func() { // {{{
				const d = new Date(o)

				d.plusMinutes('1')

				expect(d.getMinute()).to.equal(r.getMinute())
			}) // }}}

			it('d_i', func() { // {{{
				const d = new Date(o)

				d.plus({minutes: 1})

				expect(d.getMinute()).to.equal(r.getMinute())
			}) // }}}

			it('d_s', func() { // {{{
				const d = new Date(o)

				d.plus({minutes: '1'})

				expect(d.getMinute()).to.equal(r.getMinute())
			}) // }}}

			it('e_i', func() { // {{{
				const d = new Date(o)

				d.plus(TimeUnit::MINUTES, 1)

				expect(d.getMinute()).to.equal(r.getMinute())
			}) // }}}

			it('e_s', func() { // {{{
				const d = new Date(o)

				d.plus(TimeUnit::MINUTES, '1')

				expect(d.getMinute()).to.equal(r.getMinute())
			}) // }}}

			it('s_i', func() { // {{{
				const d = new Date(o)

				d.plus('minute', 1)

				expect(d.getMinute()).to.equal(r.getMinute())
			}) // }}}

			it('s_s', func() { // {{{
				const d = new Date(o)

				d.plus('minute', '1')

				expect(d.getMinute()).to.equal(r.getMinute())
			}) // }}}
		})

		describe('second', func() {
			const r = new Date(o)
			r.setSecond(r.getSecond() + 1)

			it('i', func() { // {{{
				const d = new Date(o)

				d.plusSeconds(1)

				expect(d.getSecond()).to.equal(r.getSecond())
			}) // }}}

			it('s', func() { // {{{
				const d = new Date(o)

				d.plusSeconds('1')

				expect(d.getSecond()).to.equal(r.getSecond())
			}) // }}}

			it('d_i', func() { // {{{
				const d = new Date(o)

				d.plus({seconds: 1})

				expect(d.getSecond()).to.equal(r.getSecond())
			}) // }}}

			it('d_s', func() { // {{{
				const d = new Date(o)

				d.plus({seconds: '1'})

				expect(d.getSecond()).to.equal(r.getSecond())
			}) // }}}

			it('e_i', func() { // {{{
				const d = new Date(o)

				d.plus(TimeUnit::SECONDS, 1)

				expect(d.getSecond()).to.equal(r.getSecond())
			}) // }}}

			it('e_s', func() { // {{{
				const d = new Date(o)

				d.plus(TimeUnit::SECONDS, '1')

				expect(d.getSecond()).to.equal(r.getSecond())
			}) // }}}

			it('s_i', func() { // {{{
				const d = new Date(o)

				d.plus('second', 1)

				expect(d.getSecond()).to.equal(r.getSecond())
			}) // }}}

			it('s_s', func() { // {{{
				const d = new Date(o)

				d.plus('second', '1')

				expect(d.getSecond()).to.equal(r.getSecond())
			}) // }}}
		})

		describe('millisecond', func() {
			const r = new Date(o)
			r.setMillisecond(r.getMillisecond() + 1)

			it('i', func() { // {{{
				const d = new Date(o)

				d.plusMilliseconds(1)

				expect(d.getMillisecond()).to.equal(r.getMillisecond())
			}) // }}}

			it('s', func() { // {{{
				const d = new Date(o)

				d.plusMilliseconds('1')

				expect(d.getMillisecond()).to.equal(r.getMillisecond())
			}) // }}}

			it('d_i', func() { // {{{
				const d = new Date(o)

				d.plus({milliseconds: 1})

				expect(d.getMillisecond()).to.equal(r.getMillisecond())
			}) // }}}

			it('d_s', func() { // {{{
				const d = new Date(o)

				d.plus({milliseconds: '1'})

				expect(d.getMillisecond()).to.equal(r.getMillisecond())
			}) // }}}

			it('e_i', func() { // {{{
				const d = new Date(o)

				d.plus(TimeUnit::MILLISECONDS, 1)

				expect(d.getMillisecond()).to.equal(r.getMillisecond())
			}) // }}}

			it('e_s', func() { // {{{
				const d = new Date(o)

				d.plus(TimeUnit::MILLISECONDS, '1')

				expect(d.getMillisecond()).to.equal(r.getMillisecond())
			}) // }}}

			it('s_i', func() { // {{{
				const d = new Date(o)

				d.plus('millisecond', 1)

				expect(d.getMillisecond()).to.equal(r.getMillisecond())
			}) // }}}

			it('s_s', func() { // {{{
				const d = new Date(o)

				d.plus('millisecond', '1')

				expect(d.getMillisecond()).to.equal(r.getMillisecond())
			}) // }}}
		})

		describe('millennia', func() {
			const r = new Date(o)
			r.setYear(r.getYear() + 1_000)

			it('enu', func() { // {{{
				const d = new Date(o)

				d.plus(TimeUnit::MILLENNIA, 1)

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}

			it('str', func() { // {{{
				const d = new Date(o)

				d.plus('millennia', 1)

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}
		})

		describe('centuries', func() {
			const r = new Date(o)
			r.setYear(r.getYear() + 100)

			it('enu', func() { // {{{
				const d = new Date(o)

				d.plus(TimeUnit::CENTURIES, 1)

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}

			it('str', func() { // {{{
				const d = new Date(o)

				d.plus('centuries', 1)

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}
		})

		describe('decades', func() {
			const r = new Date(o)
			r.setYear(r.getYear() + 10)

			it('enu', func() { // {{{
				const d = new Date(o)

				d.plus(TimeUnit::DECADES, 1)

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}

			it('str', func() { // {{{
				const d = new Date(o)

				d.plus('decades', 1)

				expect(d.getYear()).to.equal(r.getYear())
			}) // }}}
		})

		describe('semesters', func() {
			const r = new Date(o)
			r.setMonth(r.getMonth() + 6)

			it('enu', func() { // {{{
				const d = new Date(o)

				d.plus(TimeUnit::SEMESTERS, 1)

				expect(d.getMonth()).to.equal(r.getMonth())
			}) // }}}

			it('str', func() { // {{{
				const d = new Date(o)

				d.plus('semesters', 1)

				expect(d.getMonth()).to.equal(r.getMonth())
			}) // }}}
		})

		describe('quarters', func() {
			const r = new Date(o)
			r.setMonth(r.getMonth() + 3)

			it('enu', func() { // {{{
				const d = new Date(o)

				d.plus(TimeUnit::QUARTERS, 1)

				expect(d.getMonth()).to.equal(r.getMonth())
			}) // }}}

			it('str', func() { // {{{
				const d = new Date(o)

				d.plus('quarters', 1)

				expect(d.getMonth()).to.equal(r.getMonth())
			}) // }}}
		})

		describe('half_days', func() {
			const r = new Date(o)
			r.setHour(r.getHour() + 12)

			it('enu', func() { // {{{
				const d = new Date(o)

				d.plus(TimeUnit::HALF_DAYS, 1)

				expect(d.getHour()).to.equal(r.getHour())
			}) // }}}

			it('str', func() { // {{{
				const d = new Date(o)

				d.plus('half_days', 1)

				expect(d.getHour()).to.equal(r.getHour())
			}) // }}}
		})
	}) // }}}

	describe('set', func() { // {{{
		it('month enu', func() { // {{{
			const d = new Date().set(DateField::MONTH, 3)

			expect(d.getMonth()).to.equal(3)
		}) // }}}

		it('month str', func() { // {{{
			const d = new Date().set('month', 3)

			expect(d.getMonth()).to.equal(3)
		}) // }}}

		it('dictionary', func() { // {{{
			const d = new Date().set({
				month: 5,
				day: 12,
				hour: 6
			})

			expect(d.getMonth()).to.equal(5)
			expect(d.getDay()).to.equal(12)
			expect(d.getHour()).to.equal(6)
		}) // }}}
	}) // }}}

	it('setDayOfYear', func() { // {{{
		const d = Date.create(2000, 1, 1).setDayOfYear(66)

		expect(d.getMonth()).to.equal(3)
		expect(d.getDay()).to.equal(6)
	}) // }}}

	it('setDay', func() { // {{{
		const d = Date.create(2000, 1, 1).setDay(15)

		expect(d.getDay()).to.equal(15)
	}) // }}}

	describe('setMonth', func() {
		it('i', func() { // {{{
			const d = new Date().setMonth(3)

			expect(d.getMonth()).to.equal(3)
		}) // }}}

		it('e', func() { // {{{
			const d = new Date().setMonth(MonthField::MARCH)

			expect(d.getMonth()).to.equal(3)
		}) // }}}

		it('s_i', func() { // {{{
			const d = new Date().setMonth('3')

			expect(d.getMonth()).to.equal(3)
		}) // }}}

		it('s_e', func() { // {{{
			const d = new Date().setMonth('march')

			expect(d.getMonth()).to.equal(3)
		}) // }}}
	})

	describe('setDayOfWeek', func() {
		it('i', func() { // {{{
			const d = new Date(2000, 1, 1).setDayOfWeek(3)

			expect(d.getDayOfWeek()).to.equal(3)
		}) // }}}

		it('e', func() { // {{{
			const d = new Date(2000, 1, 1).setDayOfWeek(WeekField::WEDNESDAY)

			expect(d.getDayOfWeek()).to.equal(3)
		}) // }}}

		it('s_i', func() { // {{{
			const d = new Date(2000, 1, 1).setDayOfWeek('3')

			expect(d.getDayOfWeek()).to.equal(3)
		}) // }}}

		it('s_e', func() { // {{{
			const d = new Date(2000, 1, 1).setDayOfWeek('wednesday')

			expect(d.getDayOfWeek()).to.equal(3)
		}) // }}}
	})

	describe('startOf', func() { // {{{
		const r = new Date(o)

		describe('year', func() {
			it('enu', func() { // {{{
				const d = new Date(o).startOf(DateField::YEAR)

				expect(d.getYear()).to.equal(r.getYear())
				expect(d.getMonth()).to.equal(1)
				expect(d.getDay()).to.equal(1)
				expect(d.getHour()).to.equal(0)
				expect(d.getMinute()).to.equal(0)
				expect(d.getSecond()).to.equal(0)
				expect(d.getMillisecond()).to.equal(0)
			}) // }}}

			it('str', func() { // {{{
				const d = new Date(o).startOf('year')

				expect(d.getYear()).to.equal(r.getYear())
				expect(d.getMonth()).to.equal(1)
				expect(d.getDay()).to.equal(1)
				expect(d.getHour()).to.equal(0)
				expect(d.getMinute()).to.equal(0)
				expect(d.getSecond()).to.equal(0)
				expect(d.getMillisecond()).to.equal(0)
			}) // }}}
		})

		describe('month', func() {
			it('enu', func() { // {{{
				const d = new Date(o).startOf(DateField::MONTH)

				expect(d.getYear()).to.equal(r.getYear())
				expect(d.getMonth()).to.equal(r.getMonth())
				expect(d.getDay()).to.equal(1)
				expect(d.getHour()).to.equal(0)
				expect(d.getMinute()).to.equal(0)
				expect(d.getSecond()).to.equal(0)
				expect(d.getMillisecond()).to.equal(0)
			}) // }}}

			it('str', func() { // {{{
				const d = new Date(o).startOf('month')

				expect(d.getYear()).to.equal(r.getYear())
				expect(d.getMonth()).to.equal(r.getMonth())
				expect(d.getDay()).to.equal(1)
				expect(d.getHour()).to.equal(0)
				expect(d.getMinute()).to.equal(0)
				expect(d.getSecond()).to.equal(0)
				expect(d.getMillisecond()).to.equal(0)
			}) // }}}
		})

		describe('day', func() {
			it('enu', func() { // {{{
				const d = new Date(o).startOf(DateField::DAY)

				expect(d.getYear()).to.equal(r.getYear())
				expect(d.getMonth()).to.equal(r.getMonth())
				expect(d.getDay()).to.equal(r.getDay())
				expect(d.getHour()).to.equal(0)
				expect(d.getMinute()).to.equal(0)
				expect(d.getSecond()).to.equal(0)
				expect(d.getMillisecond()).to.equal(0)
			}) // }}}

			it('str', func() { // {{{
				const d = new Date(o).startOf('day')

				expect(d.getYear()).to.equal(r.getYear())
				expect(d.getMonth()).to.equal(r.getMonth())
				expect(d.getDay()).to.equal(r.getDay())
				expect(d.getHour()).to.equal(0)
				expect(d.getMinute()).to.equal(0)
				expect(d.getSecond()).to.equal(0)
				expect(d.getMillisecond()).to.equal(0)
			}) // }}}
		})

		describe('hour', func() {
			it('enu', func() { // {{{
				const d = new Date(o).startOf(DateField::HOUR)

				expect(d.getYear()).to.equal(r.getYear())
				expect(d.getMonth()).to.equal(r.getMonth())
				expect(d.getDay()).to.equal(r.getDay())
				expect(d.getHour()).to.equal(r.getHour())
				expect(d.getMinute()).to.equal(0)
				expect(d.getSecond()).to.equal(0)
				expect(d.getMillisecond()).to.equal(0)
			}) // }}}

			it('str', func() { // {{{
				const d = new Date(o).startOf('hour')

				expect(d.getYear()).to.equal(r.getYear())
				expect(d.getMonth()).to.equal(r.getMonth())
				expect(d.getDay()).to.equal(r.getDay())
				expect(d.getHour()).to.equal(r.getHour())
				expect(d.getMinute()).to.equal(0)
				expect(d.getSecond()).to.equal(0)
				expect(d.getMillisecond()).to.equal(0)
			}) // }}}
		})

		describe('minute', func() {
			it('enu', func() { // {{{
				const d = new Date(o).startOf(DateField::MINUTE)

				expect(d.getYear()).to.equal(r.getYear())
				expect(d.getMonth()).to.equal(r.getMonth())
				expect(d.getDay()).to.equal(r.getDay())
				expect(d.getHour()).to.equal(r.getHour())
				expect(d.getMinute()).to.equal(r.getMinute())
				expect(d.getSecond()).to.equal(0)
				expect(d.getMillisecond()).to.equal(0)
			}) // }}}

			it('str', func() { // {{{
				const d = new Date(o).startOf('minute')

				expect(d.getYear()).to.equal(r.getYear())
				expect(d.getMonth()).to.equal(r.getMonth())
				expect(d.getDay()).to.equal(r.getDay())
				expect(d.getHour()).to.equal(r.getHour())
				expect(d.getMinute()).to.equal(r.getMinute())
				expect(d.getSecond()).to.equal(0)
				expect(d.getMillisecond()).to.equal(0)
			}) // }}}
		})

		describe('second', func() {
			it('enu', func() { // {{{
				const d = new Date(o).startOf(DateField::SECOND)

				expect(d.getYear()).to.equal(r.getYear())
				expect(d.getMonth()).to.equal(r.getMonth())
				expect(d.getDay()).to.equal(r.getDay())
				expect(d.getHour()).to.equal(r.getHour())
				expect(d.getMinute()).to.equal(r.getMinute())
				expect(d.getSecond()).to.equal(r.getSecond())
				expect(d.getMillisecond()).to.equal(0)
			}) // }}}

			it('str', func() { // {{{
				const d = new Date(o).startOf('second')

				expect(d.getYear()).to.equal(r.getYear())
				expect(d.getMonth()).to.equal(r.getMonth())
				expect(d.getDay()).to.equal(r.getDay())
				expect(d.getHour()).to.equal(r.getHour())
				expect(d.getMinute()).to.equal(r.getMinute())
				expect(d.getSecond()).to.equal(r.getSecond())
				expect(d.getMillisecond()).to.equal(0)
			}) // }}}
		})
	}) // }}}
})