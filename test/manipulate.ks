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
	it('add year +1', func() { // {{{
		const r = new Date()
		r.setYear(r.getYear() + 1)

		expect(new Date().add('year', 1).getYear()).to.equal(r.getYear())
	}) // }}}

	it('add year -1', func() { // {{{
		const r = new Date()
		r.setYear(r.getYear() - 1)

		expect(new Date().add('year', -1).getYear()).to.equal(r.getYear())
	}) // }}}

	it('add month +1', func() { // {{{
		const r = new Date()
		r.setMonth(r.getMonth() + 1)

		expect(new Date().add('month', 1).getMonth()).to.equal(r.getMonth())
	}) // }}}

	it('add month -1', func() { // {{{
		const r = new Date()
		r.setMonth(r.getMonth() - 1)

		expect(new Date().add('month', -1).getMonth()).to.equal(r.getMonth())
	}) // }}}

	it('add week +1', func() { // {{{
		const r = new Date()
		r.setDay(r.getDay() + 7)

		expect(new Date().add('week', 1).getDay()).to.equal(r.getDay())
	}) // }}}

	it('add week -1', func() { // {{{
		const r = new Date()
		r.setDay(r.getDay() - 7)

		expect(new Date().add('week', -1).getDay()).to.equal(r.getDay())
	}) // }}}

	it('add day +1', func() { // {{{
		const r = new Date()
		r.setDay(r.getDay() + 1)

		expect(new Date().add('day', 1).getDay()).to.equal(r.getDay())
	}) // }}}

	it('add day -1', func() { // {{{
		const r = new Date()
		r.setDay(r.getDay() - 1)

		expect(new Date().add('day', -1).getDay()).to.equal(r.getDay())
	}) // }}}

	it('add hour +1', func() { // {{{
		const r = new Date()
		r.setHours(r.getHours() + 1)

		expect(new Date().add('hour', 1).getHours()).to.equal(r.getHours())
	}) // }}}

	it('add hour -1', func() { // {{{
		const r = new Date()
		r.setHours(r.getHours() - 1)

		expect(new Date().add('hour', -1).getHours()).to.equal(r.getHours())
	}) // }}}

	it('add minute +1', func() { // {{{
		const r = new Date()
		r.setMinutes(r.getMinutes() + 1)

		expect(new Date().add('minute', 1).getMinutes()).to.equal(r.getMinutes())
	}) // }}}

	it('add minute -1', func() { // {{{
		const r = new Date()
		r.setMinutes(r.getMinutes() - 1)

		expect(new Date().add('minute', -1).getMinutes()).to.equal(r.getMinutes())
	}) // }}}

	it('add second +1', func() { // {{{
		const r = new Date()
		r.setSeconds(r.getSeconds() + 1)

		expect(new Date().add('second', 1).getSeconds()).to.equal(r.getSeconds())
	}) // }}}

	it('add second -1', func() { // {{{
		const r = new Date()
		r.setSeconds(r.getSeconds() - 1)

		expect(new Date().add('second', -1).getSeconds()).to.equal(r.getSeconds())
	}) // }}}

	it('add millisecond +1', func() { // {{{
		const r = new Date()
		const d = r.clone()

		r.setMilliseconds(r.getMilliseconds() + 1)

		expect(d.add('millisecond', 1).getMilliseconds()).to.equal(r.getMilliseconds())
	}) // }}}

	it('add millisecond -1', func() { // {{{
		const r = new Date()
		const d = r.clone()

		r.setMilliseconds(r.getMilliseconds() - 1)

		expect(d.add('millisecond', -1).getMilliseconds()).to.equal(r.getMilliseconds())
	}) // }}}

	it('add dictionary', func() { // {{{
		const r = new Date()
		r.setMonth(r.getMonth() + 1)
		r.setDay(r.getDay() - 3)
		r.setHours(r.getHours() + 6)

		const d = new Date().add({
			month: 1,
			day: -3,
			hours: 6
		})

		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDay()).to.equal(r.getDay())
		expect(d.getHours()).to.equal(r.getHours())
	}) // }}}

	it('rewind month', func() { // {{{
		const r = new Date()
		r.setMonth(r.getMonth() - 1)

		const d = new Date().rewind('month', 1)

		expect(d.getMonth()).to.equal(r.getMonth())
	}) // }}}

	it('rewind dictionary', func() { // {{{
		const r = new Date()
		r.setMonth(r.getMonth() - 1)
		r.setDay(r.getDay() + 3)
		r.setHours(r.getHours() - 6)

		const d = new Date().rewind({
			month: 1,
			day: -3,
			hours: 6
		})

		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDay()).to.equal(r.getDay())
		expect(d.getHours()).to.equal(r.getHours())
	}) // }}}

	it('set month', func() { // {{{
		const d = new Date().set('month', 3)

		expect(d.getMonth()).to.equal(3)
	}) // }}}

	it('set dictionary', func() { // {{{
		const d = new Date().set({
			month: 5,
			day: 12,
			hours: 6
		})

		expect(d.getMonth()).to.equal(5)
		expect(d.getDay()).to.equal(12)
		expect(d.getHours()).to.equal(6)
	}) // }}}

	it('midnight', func() { // {{{
		const d = new Date().midnight()

		expect(d.getHours()).to.equal(0)
		expect(d.getMinutes()).to.equal(0)
		expect(d.getSeconds()).to.equal(0)
		expect(d.getMilliseconds()).to.equal(0)
	}) // }}}

	it('noon local', func() { // {{{
		const d = new Date().noon()

		expect(d.getHours()).to.equal(12)
		expect(d.getMinutes()).to.equal(0)
		expect(d.getSeconds()).to.equal(0)
		expect(d.getMilliseconds()).to.equal(0)
	}) // }}}

	it('startOf year', func() { // {{{
		const r = new Date()

		const d = new Date().startOf('year')

		expect(d.getYear()).to.equal(r.getYear())
		expect(d.getMonth()).to.equal(1)
		expect(d.getDay()).to.equal(1)
		expect(d.getHours()).to.equal(0)
		expect(d.getMinutes()).to.equal(0)
		expect(d.getSeconds()).to.equal(0)
		expect(d.getMilliseconds()).to.equal(0)
	}) // }}}

	it('startOf month', func() { // {{{
		const r = new Date()

		const d = new Date().startOf('month')

		expect(d.getYear()).to.equal(r.getYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDay()).to.equal(1)
		expect(d.getHours()).to.equal(0)
		expect(d.getMinutes()).to.equal(0)
		expect(d.getSeconds()).to.equal(0)
		expect(d.getMilliseconds()).to.equal(0)
	}) // }}}

	it('startOf day', func() { // {{{
		const r = new Date()

		const d = new Date().startOf('day')

		expect(d.getYear()).to.equal(r.getYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDay()).to.equal(r.getDay())
		expect(d.getHours()).to.equal(0)
		expect(d.getMinutes()).to.equal(0)
		expect(d.getSeconds()).to.equal(0)
		expect(d.getMilliseconds()).to.equal(0)
	}) // }}}

	it('startOf hour', func() { // {{{
		const r = new Date()

		const d = new Date().startOf('hour')

		expect(d.getYear()).to.equal(r.getYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDay()).to.equal(r.getDay())
		expect(d.getHours()).to.equal(r.getHours())
		expect(d.getMinutes()).to.equal(0)
		expect(d.getSeconds()).to.equal(0)
		expect(d.getMilliseconds()).to.equal(0)
	}) // }}}

	it('startOf minute', func() { // {{{
		const r = new Date()

		const d = new Date().startOf('minute')

		expect(d.getYear()).to.equal(r.getYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDay()).to.equal(r.getDay())
		expect(d.getHours()).to.equal(r.getHours())
		expect(d.getMinutes()).to.equal(r.getMinutes())
		expect(d.getSeconds()).to.equal(0)
		expect(d.getMilliseconds()).to.equal(0)
	}) // }}}

	it('startOf second', func() { // {{{
		const r = new Date()

		const d = new Date().startOf('second')

		expect(d.getYear()).to.equal(r.getYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDay()).to.equal(r.getDay())
		expect(d.getHours()).to.equal(r.getHours())
		expect(d.getMinutes()).to.equal(r.getMinutes())
		expect(d.getSeconds()).to.equal(r.getSeconds())
		expect(d.getMilliseconds()).to.equal(0)
	}) // }}}

	it('endOf year', func() { // {{{
		const r = new Date()

		const d = new Date().endOf('year')

		expect(d.getYear()).to.equal(r.getYear())
		expect(d.getMonth()).to.equal(12)
		expect(d.getDay()).to.equal(31)
		expect(d.getHours()).to.equal(23)
		expect(d.getMinutes()).to.equal(59)
		expect(d.getSeconds()).to.equal(59)
		expect(d.getMilliseconds()).to.equal(999)
	}) // }}}

	it('endOf month', func() { // {{{
		const r = new Date()

		const d = new Date().endOf('month')

		expect(d.getYear()).to.equal(r.getYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDay()).to.equal(r.getDaysInMonth())
		expect(d.getHours()).to.equal(23)
		expect(d.getMinutes()).to.equal(59)
		expect(d.getSeconds()).to.equal(59)
		expect(d.getMilliseconds()).to.equal(999)
	}) // }}}

	it('endOf day', func() { // {{{
		const r = new Date()

		const d = new Date().endOf('day')

		expect(d.getYear()).to.equal(r.getYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDay()).to.equal(r.getDay())
		expect(d.getHours()).to.equal(23)
		expect(d.getMinutes()).to.equal(59)
		expect(d.getSeconds()).to.equal(59)
		expect(d.getMilliseconds()).to.equal(999)
	}) // }}}

	it('endOf hour', func() { // {{{
		const r = new Date()

		const d = new Date().endOf('hour')

		expect(d.getYear()).to.equal(r.getYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDay()).to.equal(r.getDay())
		expect(d.getHours()).to.equal(r.getHours())
		expect(d.getMinutes()).to.equal(59)
		expect(d.getSeconds()).to.equal(59)
		expect(d.getMilliseconds()).to.equal(999)
	}) // }}}

	it('endOf minute', func() { // {{{
		const r = new Date()

		const d = new Date().endOf('minute')

		expect(d.getYear()).to.equal(r.getYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDay()).to.equal(r.getDay())
		expect(d.getHours()).to.equal(r.getHours())
		expect(d.getMinutes()).to.equal(r.getMinutes())
		expect(d.getSeconds()).to.equal(59)
		expect(d.getMilliseconds()).to.equal(999)
	}) // }}}

	it('endOf second', func() { // {{{
		const r = new Date()

		const d = new Date().endOf('second')

		expect(d.getYear()).to.equal(r.getYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDay()).to.equal(r.getDay())
		expect(d.getHours()).to.equal(r.getHours())
		expect(d.getMinutes()).to.equal(r.getMinutes())
		expect(d.getSeconds()).to.equal(r.getSeconds())
		expect(d.getMilliseconds()).to.equal(999)
	}) // }}}

	it('getDayOfYear 2000-1-1', func() { // {{{
		const d = Date.create(2000, 1, 1)

		expect(d.getDayOfYear()).to.equal(1)
	}) // }}}

	it('setDayOfYear', func() { // {{{
		const d = Date.create(2000, 1, 1).setDayOfYear(66)

		expect(d.getMonth()).to.equal(2)
		expect(d.getDayOfMonth()).to.equal(6)
	}) // }}}

	it('future 2000-1-1 saturday', func() { // {{{
		const d = Date.create(2000, 1, 1).future('saturday')

		expect(d.getYear()).to.equal(2000)
		expect(d.getMonth()).to.equal(1)
		expect(d.getDayOfMonth()).to.equal(8)
	}) // }}}

	it('future 2000-1-1 sunday', func() { // {{{
		const d = Date.create(2000, 1, 1).future('sunday')

		expect(d.getYear()).to.equal(2000)
		expect(d.getMonth()).to.equal(1)
		expect(d.getDayOfMonth()).to.equal(2)
	}) // }}}

	it('future 2000-1-3 saturday', func() { // {{{
		const d = Date.create(2000, 1, 3).future('saturday')

		expect(d.getYear()).to.equal(2000)
		expect(d.getMonth()).to.equal(1)
		expect(d.getDayOfMonth()).to.equal(8)
	}) // }}}

	it('future 2000-1-3 sunday', func() { // {{{
		const d = Date.create(2000, 1, 3).future('sunday')

		expect(d.getYear()).to.equal(2000)
		expect(d.getMonth()).to.equal(1)
		expect(d.getDayOfMonth()).to.equal(9)
	}) // }}}

	it('futureOrPresent 2000-1-1', func() { // {{{
		const d = Date.create(2000, 1, 1).futureOrPresent('saturday')

		expect(d.getYear()).to.equal(2000)
		expect(d.getMonth()).to.equal(1)
		expect(d.getDayOfMonth()).to.equal(1)
	}) // }}}

	it('past 2000-1-1 saturday', func() { // {{{
		const d = Date.create(2000, 1, 1).past('saturday')

		expect(d.getYear()).to.equal(1999)
		expect(d.getMonth()).to.equal(12)
		expect(d.getDayOfMonth()).to.equal(25)
	}) // }}}

	it('past 2000-1-3 saturday', func() { // {{{
		const d = Date.create(2000, 1, 3).past('saturday')

		expect(d.getYear()).to.equal(2000)
		expect(d.getMonth()).to.equal(1)
		expect(d.getDayOfMonth()).to.equal(1)
	}) // }}}

	it('past 2000-1-3 sunday', func() { // {{{
		const d = Date.create(2000, 1, 3).past('sunday')

		expect(d.getYear()).to.equal(2000)
		expect(d.getMonth()).to.equal(1)
		expect(d.getDayOfMonth()).to.equal(2)
	}) // }}}

	it('pastOrPresent 2000-1-1', func() { // {{{
		const d = Date.create(2000, 1, 1).pastOrPresent('saturday')

		expect(d.getYear()).to.equal(2000)
		expect(d.getMonth()).to.equal(1)
		expect(d.getDayOfMonth()).to.equal(1)
	}) // }}}

	it('getDayOfMonth 2000-1-1', func() { // {{{
		const d = Date.create(2000, 1, 1)

		expect(d.getDayOfMonth()).to.equal(1)
	}) // }}}

	it('getDaysInMonth 2000-1-1', func() { // {{{
		const d = Date.create(2000, 1, 1)

		expect(d.getDaysInMonth()).to.equal(31)
	}) // }}}

	it('getDaysInYear 2000-1-1', func() { // {{{
		const d = Date.create(2000, 1, 1)

		expect(d.getDaysInYear()).to.equal(366)
	}) // }}}

	it('getDaysInYear 2003-1-1', func() { // {{{
		const d = Date.create(2003, 1, 1)

		expect(d.getDaysInYear()).to.equal(365)
	}) // }}}

	it('getDaysInYear 2002-1-1', func() { // {{{
		const d = Date.create(2002, 1, 1)

		expect(d.getDaysInYear()).to.equal(365)
	}) // }}}

	it('isLeapYear 2000-1-1', func() { // {{{
		const d = Date.create(2000, 1, 1)

		expect(d.isLeapYear()).to.be.true
	}) // }}}

	it('setDayOfMonth', func() { // {{{
		const d = Date.create(2000, 1, 1).setDayOfMonth(15)

		expect(d.getDayOfMonth()).to.equal(15)
	}) // }}}
})