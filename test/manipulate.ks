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
		r.setFullYear(r.getFullYear() + 1)

		expect(new Date().add('year', 1).getFullYear()).to.equal(r.getFullYear())
	}) // }}}

	it('add year -1', func() { // {{{
		const r = new Date()
		r.setFullYear(r.getFullYear() - 1)

		expect(new Date().add('year', -1).getFullYear()).to.equal(r.getFullYear())
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
		r.setDate(r.getDate() + 7)

		expect(new Date().add('week', 1).getDate()).to.equal(r.getDate())
	}) // }}}

	it('add week -1', func() { // {{{
		const r = new Date()
		r.setDate(r.getDate() - 7)

		expect(new Date().add('week', -1).getDate()).to.equal(r.getDate())
	}) // }}}

	it('add day +1', func() { // {{{
		const r = new Date()
		r.setDate(r.getDate() + 1)

		expect(new Date().add('day', 1).getDate()).to.equal(r.getDate())
	}) // }}}

	it('add day -1', func() { // {{{
		const r = new Date()
		r.setDate(r.getDate() - 1)

		expect(new Date().add('day', -1).getDate()).to.equal(r.getDate())
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
		r.setDate(r.getDate() - 3)
		r.setHours(r.getHours() + 6)

		const d = new Date().add({
			month: 1,
			day: -3,
			hours: 6
		})

		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDate()).to.equal(r.getDate())
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
		r.setDate(r.getDate() + 3)
		r.setHours(r.getHours() - 6)

		const d = new Date().rewind({
			month: 1,
			day: -3,
			hours: 6
		})

		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDate()).to.equal(r.getDate())
		expect(d.getHours()).to.equal(r.getHours())
	}) // }}}

	it('set month', func() { // {{{
		const d = new Date().set('month', 2)

		expect(d.getMonth()).to.equal(2)
	}) // }}}

	it('set dictionary', func() { // {{{
		const d = new Date().set({
			month: 5,
			dm: 12,
			hours: 6
		})

		expect(d.getMonth()).to.equal(5)
		expect(d.getDate()).to.equal(12)
		expect(d.getHours()).to.equal(6)
	}) // }}}

	it('midnight local', func() { // {{{
		const d = new Date().midnight()

		expect(d.getHours()).to.equal(0)
		expect(d.getMinutes()).to.equal(0)
		expect(d.getSeconds()).to.equal(0)
		expect(d.getMilliseconds()).to.equal(0)
	}) // }}}

	it('midnight utc', func() { // {{{
		const d = new Date().midnight(true)

		expect(d.getUTCHours()).to.equal(0)
		expect(d.getUTCMinutes()).to.equal(0)
		expect(d.getUTCSeconds()).to.equal(0)
		expect(d.getUTCMilliseconds()).to.equal(0)
	}) // }}}

	it('noon local', func() { // {{{
		const d = new Date().noon()

		expect(d.getHours()).to.equal(12)
		expect(d.getMinutes()).to.equal(0)
		expect(d.getSeconds()).to.equal(0)
		expect(d.getMilliseconds()).to.equal(0)
	}) // }}}

	it('noon utc', func() { // {{{
		const d = new Date().noon(true)

		expect(d.getUTCHours()).to.equal(12)
		expect(d.getUTCMinutes()).to.equal(0)
		expect(d.getUTCSeconds()).to.equal(0)
		expect(d.getUTCMilliseconds()).to.equal(0)
	}) // }}}

	it('startOf year local', func() { // {{{
		const r = new Date()

		const d = new Date().startOf('year')

		expect(d.getFullYear()).to.equal(r.getFullYear())
		expect(d.getMonth()).to.equal(0)
		expect(d.getDate()).to.equal(1)
		expect(d.getHours()).to.equal(0)
		expect(d.getMinutes()).to.equal(0)
		expect(d.getSeconds()).to.equal(0)
		expect(d.getMilliseconds()).to.equal(0)
	}) // }}}

	it('startOf year utc', func() { // {{{
		const r = new Date()

		const d = new Date().startOf('year', true)

		expect(d.getUTCFullYear()).to.equal(r.getUTCFullYear())
		expect(d.getUTCMonth()).to.equal(0)
		expect(d.getUTCDate()).to.equal(1)
		expect(d.getUTCHours()).to.equal(0)
		expect(d.getUTCMinutes()).to.equal(0)
		expect(d.getUTCSeconds()).to.equal(0)
		expect(d.getUTCMilliseconds()).to.equal(0)
	}) // }}}

	it('startOf month local', func() { // {{{
		const r = new Date()

		const d = new Date().startOf('month')

		expect(d.getFullYear()).to.equal(r.getFullYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDate()).to.equal(1)
		expect(d.getHours()).to.equal(0)
		expect(d.getMinutes()).to.equal(0)
		expect(d.getSeconds()).to.equal(0)
		expect(d.getMilliseconds()).to.equal(0)
	}) // }}}

	it('startOf month utc', func() { // {{{
		const r = new Date()

		const d = new Date().startOf('month', true)

		expect(d.getUTCFullYear()).to.equal(r.getUTCFullYear())
		expect(d.getUTCMonth()).to.equal(r.getUTCMonth())
		expect(d.getUTCDate()).to.equal(1)
		expect(d.getUTCHours()).to.equal(0)
		expect(d.getUTCMinutes()).to.equal(0)
		expect(d.getUTCSeconds()).to.equal(0)
		expect(d.getUTCMilliseconds()).to.equal(0)
	}) // }}}

	it('startOf day local', func() { // {{{
		const r = new Date()

		const d = new Date().startOf('day')

		expect(d.getFullYear()).to.equal(r.getFullYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDate()).to.equal(r.getDate())
		expect(d.getHours()).to.equal(0)
		expect(d.getMinutes()).to.equal(0)
		expect(d.getSeconds()).to.equal(0)
		expect(d.getMilliseconds()).to.equal(0)
	}) // }}}

	it('startOf day utc', func() { // {{{
		const r = new Date()

		const d = new Date().startOf('day', true)

		expect(d.getUTCFullYear()).to.equal(r.getUTCFullYear())
		expect(d.getUTCMonth()).to.equal(r.getUTCMonth())
		expect(d.getUTCDate()).to.equal(r.getUTCDate())
		expect(d.getUTCHours()).to.equal(0)
		expect(d.getUTCMinutes()).to.equal(0)
		expect(d.getUTCSeconds()).to.equal(0)
		expect(d.getUTCMilliseconds()).to.equal(0)
	}) // }}}

	it('startOf hour local', func() { // {{{
		const r = new Date()

		const d = new Date().startOf('hour')

		expect(d.getFullYear()).to.equal(r.getFullYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDate()).to.equal(r.getDate())
		expect(d.getHours()).to.equal(r.getHours())
		expect(d.getMinutes()).to.equal(0)
		expect(d.getSeconds()).to.equal(0)
		expect(d.getMilliseconds()).to.equal(0)
	}) // }}}

	it('startOf hour utc', func() { // {{{
		const r = new Date()

		const d = new Date().startOf('hour', true)

		expect(d.getUTCFullYear()).to.equal(r.getUTCFullYear())
		expect(d.getUTCMonth()).to.equal(r.getUTCMonth())
		expect(d.getUTCDate()).to.equal(r.getUTCDate())
		expect(d.getUTCHours()).to.equal(r.getUTCHours())
		expect(d.getUTCMinutes()).to.equal(0)
		expect(d.getUTCSeconds()).to.equal(0)
		expect(d.getUTCMilliseconds()).to.equal(0)
	}) // }}}

	it('startOf minute local', func() { // {{{
		const r = new Date()

		const d = new Date().startOf('minute')

		expect(d.getFullYear()).to.equal(r.getFullYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDate()).to.equal(r.getDate())
		expect(d.getHours()).to.equal(r.getHours())
		expect(d.getMinutes()).to.equal(r.getMinutes())
		expect(d.getSeconds()).to.equal(0)
		expect(d.getMilliseconds()).to.equal(0)
	}) // }}}

	it('startOf minute utc', func() { // {{{
		const r = new Date()

		const d = new Date().startOf('minute', true)

		expect(d.getUTCFullYear()).to.equal(r.getUTCFullYear())
		expect(d.getUTCMonth()).to.equal(r.getUTCMonth())
		expect(d.getUTCDate()).to.equal(r.getUTCDate())
		expect(d.getUTCHours()).to.equal(r.getUTCHours())
		expect(d.getUTCMinutes()).to.equal(r.getUTCMinutes())
		expect(d.getUTCSeconds()).to.equal(0)
		expect(d.getUTCMilliseconds()).to.equal(0)
	}) // }}}

	it('startOf second local', func() { // {{{
		const r = new Date()

		const d = new Date().startOf('second')

		expect(d.getFullYear()).to.equal(r.getFullYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDate()).to.equal(r.getDate())
		expect(d.getHours()).to.equal(r.getHours())
		expect(d.getMinutes()).to.equal(r.getMinutes())
		expect(d.getSeconds()).to.equal(r.getSeconds())
		expect(d.getMilliseconds()).to.equal(0)
	}) // }}}

	it('startOf second utc', func() { // {{{
		const r = new Date()

		const d = new Date().startOf('second', true)

		expect(d.getUTCFullYear()).to.equal(r.getUTCFullYear())
		expect(d.getUTCMonth()).to.equal(r.getUTCMonth())
		expect(d.getUTCDate()).to.equal(r.getUTCDate())
		expect(d.getUTCHours()).to.equal(r.getUTCHours())
		expect(d.getUTCMinutes()).to.equal(r.getUTCMinutes())
		expect(d.getUTCSeconds()).to.equal(r.getUTCSeconds())
		expect(d.getUTCMilliseconds()).to.equal(0)
	}) // }}}

	it('endOf year local', func() { // {{{
		const r = new Date()

		const d = new Date().endOf('year')

		expect(d.getFullYear()).to.equal(r.getFullYear())
		expect(d.getMonth()).to.equal(11)
		expect(d.getDate()).to.equal(31)
		expect(d.getHours()).to.equal(23)
		expect(d.getMinutes()).to.equal(59)
		expect(d.getSeconds()).to.equal(59)
		expect(d.getMilliseconds()).to.equal(999)
	}) // }}}

	it('endOf year utc', func() { // {{{
		const r = new Date()

		const d = new Date().endOf('year', true)

		expect(d.getUTCFullYear()).to.equal(r.getUTCFullYear())
		expect(d.getUTCMonth()).to.equal(11)
		expect(d.getUTCDate()).to.equal(31)
		expect(d.getUTCHours()).to.equal(23)
		expect(d.getUTCMinutes()).to.equal(59)
		expect(d.getUTCSeconds()).to.equal(59)
		expect(d.getUTCMilliseconds()).to.equal(999)
	}) // }}}

	it('endOf month local', func() { // {{{
		const r = new Date()

		const d = new Date().endOf('month')

		expect(d.getFullYear()).to.equal(r.getFullYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDate()).to.equal(r.getDaysInMonth())
		expect(d.getHours()).to.equal(23)
		expect(d.getMinutes()).to.equal(59)
		expect(d.getSeconds()).to.equal(59)
		expect(d.getMilliseconds()).to.equal(999)
	}) // }}}

	it('endOf month utc', func() { // {{{
		const r = new Date()

		const d = new Date().endOf('month', true)

		expect(d.getUTCFullYear()).to.equal(r.getUTCFullYear())
		expect(d.getUTCMonth()).to.equal(r.getUTCMonth())
		expect(d.getUTCDate()).to.equal(r.getDaysInMonth(true))
		expect(d.getUTCHours()).to.equal(23)
		expect(d.getUTCMinutes()).to.equal(59)
		expect(d.getUTCSeconds()).to.equal(59)
		expect(d.getUTCMilliseconds()).to.equal(999)
	}) // }}}

	it('endOf day local', func() { // {{{
		const r = new Date()

		const d = new Date().endOf('day')

		expect(d.getFullYear()).to.equal(r.getFullYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDate()).to.equal(r.getDate())
		expect(d.getHours()).to.equal(23)
		expect(d.getMinutes()).to.equal(59)
		expect(d.getSeconds()).to.equal(59)
		expect(d.getMilliseconds()).to.equal(999)
	}) // }}}

	it('endOf day utc', func() { // {{{
		const r = new Date()

		const d = new Date().endOf('day', true)

		expect(d.getUTCFullYear()).to.equal(r.getUTCFullYear())
		expect(d.getUTCMonth()).to.equal(r.getUTCMonth())
		expect(d.getUTCDate()).to.equal(r.getUTCDate())
		expect(d.getUTCHours()).to.equal(23)
		expect(d.getUTCMinutes()).to.equal(59)
		expect(d.getUTCSeconds()).to.equal(59)
		expect(d.getUTCMilliseconds()).to.equal(999)
	}) // }}}

	it('endOf hour local', func() { // {{{
		const r = new Date()

		const d = new Date().endOf('hour')

		expect(d.getFullYear()).to.equal(r.getFullYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDate()).to.equal(r.getDate())
		expect(d.getHours()).to.equal(r.getHours())
		expect(d.getMinutes()).to.equal(59)
		expect(d.getSeconds()).to.equal(59)
		expect(d.getMilliseconds()).to.equal(999)
	}) // }}}

	it('endOf hour utc', func() { // {{{
		const r = new Date()

		const d = new Date().endOf('hour', true)

		expect(d.getUTCFullYear()).to.equal(r.getUTCFullYear())
		expect(d.getUTCMonth()).to.equal(r.getUTCMonth())
		expect(d.getUTCDate()).to.equal(r.getUTCDate())
		expect(d.getUTCHours()).to.equal(r.getUTCHours())
		expect(d.getUTCMinutes()).to.equal(59)
		expect(d.getUTCSeconds()).to.equal(59)
		expect(d.getUTCMilliseconds()).to.equal(999)
	}) // }}}

	it('endOf minute local', func() { // {{{
		const r = new Date()

		const d = new Date().endOf('minute')

		expect(d.getFullYear()).to.equal(r.getFullYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDate()).to.equal(r.getDate())
		expect(d.getHours()).to.equal(r.getHours())
		expect(d.getMinutes()).to.equal(r.getMinutes())
		expect(d.getSeconds()).to.equal(59)
		expect(d.getMilliseconds()).to.equal(999)
	}) // }}}

	it('endOf minute utc', func() { // {{{
		const r = new Date()

		const d = new Date().endOf('minute', true)

		expect(d.getUTCFullYear()).to.equal(r.getUTCFullYear())
		expect(d.getUTCMonth()).to.equal(r.getUTCMonth())
		expect(d.getUTCDate()).to.equal(r.getUTCDate())
		expect(d.getUTCHours()).to.equal(r.getUTCHours())
		expect(d.getUTCMinutes()).to.equal(r.getUTCMinutes())
		expect(d.getUTCSeconds()).to.equal(59)
		expect(d.getUTCMilliseconds()).to.equal(999)
	}) // }}}

	it('endOf second local', func() { // {{{
		const r = new Date()

		const d = new Date().endOf('second')

		expect(d.getFullYear()).to.equal(r.getFullYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDate()).to.equal(r.getDate())
		expect(d.getHours()).to.equal(r.getHours())
		expect(d.getMinutes()).to.equal(r.getMinutes())
		expect(d.getSeconds()).to.equal(r.getSeconds())
		expect(d.getMilliseconds()).to.equal(999)
	}) // }}}

	it('endOf second utc', func() { // {{{
		const r = new Date()

		const d = new Date().endOf('second', true)

		expect(d.getUTCFullYear()).to.equal(r.getUTCFullYear())
		expect(d.getUTCMonth()).to.equal(r.getUTCMonth())
		expect(d.getUTCDate()).to.equal(r.getUTCDate())
		expect(d.getUTCHours()).to.equal(r.getUTCHours())
		expect(d.getUTCMinutes()).to.equal(r.getUTCMinutes())
		expect(d.getUTCSeconds()).to.equal(r.getUTCSeconds())
		expect(d.getUTCMilliseconds()).to.equal(999)
	}) // }}}

	it('getDayOfYear 2000-1-1', func() { // {{{
		const d = Date.create(2000, 0, 1)

		expect(d.getDayOfYear()).to.equal(1)
	}) // }}}

	it('getUTCDayOfYear 2000-1-1', func() { // {{{
		const d = Date.create(2000, 0, 1, true)

		expect(d.getUTCDayOfYear()).to.equal(1)
	}) // }}}

	it('setDayOfYear', func() { // {{{
		const d = Date.create(2000, 0, 1).setDayOfYear(66)

		expect(d.getMonth()).to.equal(2)
		expect(d.getDayOfMonth()).to.equal(6)
	}) // }}}

	it('setUTCDayOfYear', func() { // {{{
		const d = Date.create(2000, 0, 1, true).setUTCDayOfYear(66)

		expect(d.getUTCMonth()).to.equal(2)
		expect(d.getUTCDayOfMonth()).to.equal(6)
	}) // }}}

	it('future local 2000-1-1 saturday', func() { // {{{
		const d = Date.create(2000, 0, 1).future('saturday')

		expect(d.getFullYear()).to.equal(2000)
		expect(d.getMonth()).to.equal(0)
		expect(d.getDayOfMonth()).to.equal(8)
	}) // }}}

	it('future local 2000-1-1 sunday', func() { // {{{
		const d = Date.create(2000, 0, 1).future('sunday')

		expect(d.getFullYear()).to.equal(2000)
		expect(d.getMonth()).to.equal(0)
		expect(d.getDayOfMonth()).to.equal(2)
	}) // }}}

	it('future local 2000-1-3 saturday', func() { // {{{
		const d = Date.create(2000, 0, 3).future('saturday')

		expect(d.getFullYear()).to.equal(2000)
		expect(d.getMonth()).to.equal(0)
		expect(d.getDayOfMonth()).to.equal(8)
	}) // }}}

	it('future local 2000-1-3 sunday', func() { // {{{
		const d = Date.create(2000, 0, 3).future('sunday')

		expect(d.getFullYear()).to.equal(2000)
		expect(d.getMonth()).to.equal(0)
		expect(d.getDayOfMonth()).to.equal(9)
	}) // }}}

	it('future utc 2000-1-1', func() { // {{{
		const d = Date.create(2000, 0, 1, true).future('saturday')

		expect(d.getUTCFullYear()).to.equal(2000)
		expect(d.getUTCMonth()).to.equal(0)
		expect(d.getUTCDayOfMonth()).to.equal(8)
	}) // }}}

	it('futureOrPresent local 2000-1-1', func() { // {{{
		const d = Date.create(2000, 0, 1).futureOrPresent('saturday')

		expect(d.getFullYear()).to.equal(2000)
		expect(d.getMonth()).to.equal(0)
		expect(d.getDayOfMonth()).to.equal(1)
	}) // }}}

	it('futureOrPresent utc 2000-1-1', func() { // {{{
		const d = Date.create(2000, 0, 1, true).futureOrPresent('saturday')

		expect(d.getUTCFullYear()).to.equal(2000)
		expect(d.getUTCMonth()).to.equal(0)
		expect(d.getUTCDayOfMonth()).to.equal(1)
	}) // }}}

	it('past local 2000-1-1 saturday', func() { // {{{
		const d = Date.create(2000, 0, 1).past('saturday')

		expect(d.getFullYear()).to.equal(1999)
		expect(d.getMonth()).to.equal(11)
		expect(d.getDayOfMonth()).to.equal(25)
	}) // }}}

	it('past local 2000-1-3 saturday', func() { // {{{
		const d = Date.create(2000, 0, 3).past('saturday')

		expect(d.getFullYear()).to.equal(2000)
		expect(d.getMonth()).to.equal(0)
		expect(d.getDayOfMonth()).to.equal(1)
	}) // }}}

	it('past local 2000-1-3 sunday', func() { // {{{
		const d = Date.create(2000, 0, 3).past('sunday')

		expect(d.getFullYear()).to.equal(2000)
		expect(d.getMonth()).to.equal(0)
		expect(d.getDayOfMonth()).to.equal(2)
	}) // }}}

	it('past utc 2000-1-1', func() { // {{{
		const d = Date.create(2000, 0, 1, true).past('saturday')

		expect(d.getUTCFullYear()).to.equal(1999)
		expect(d.getUTCMonth()).to.equal(11)
		expect(d.getUTCDayOfMonth()).to.equal(25)
	}) // }}}

	it('pastOrPresent local 2000-1-1', func() { // {{{
		const d = Date.create(2000, 0, 1).pastOrPresent('saturday')

		expect(d.getFullYear()).to.equal(2000)
		expect(d.getMonth()).to.equal(0)
		expect(d.getDayOfMonth()).to.equal(1)
	}) // }}}

	it('pastOrPresent utc 2000-1-1', func() { // {{{
		const d = Date.create(2000, 0, 1, true).pastOrPresent('saturday')

		expect(d.getUTCFullYear()).to.equal(2000)
		expect(d.getUTCMonth()).to.equal(0)
		expect(d.getUTCDayOfMonth()).to.equal(1)
	}) // }}}

	it('getDayOfMonth 2000-1-1', func() { // {{{
		const d = Date.create(2000, 0, 1)

		expect(d.getDayOfMonth()).to.equal(1)
	}) // }}}

	it('getUTCDayOfMonth 2000-1-1', func() { // {{{
		const d = Date.create(2000, 0, 1, true)

		expect(d.getUTCDayOfMonth()).to.equal(1)
	}) // }}}

	it('getDaysInMonth 2000-1-1', func() { // {{{
		const d = Date.create(2000, 0, 1)

		expect(d.getDaysInMonth()).to.equal(31)
	}) // }}}

	it('getDaysInYear 2000-1-1', func() { // {{{
		const d = Date.create(2000, 0, 1)

		expect(d.getDaysInYear()).to.equal(366)
	}) // }}}

	it('getDaysInYear 2003-1-1', func() { // {{{
		const d = Date.create(2003, 0, 1)

		expect(d.getDaysInYear()).to.equal(365)
	}) // }}}

	it('getDaysInYear 2002-1-1', func() { // {{{
		const d = Date.create(2002, 0, 1)

		expect(d.getDaysInYear()).to.equal(365)
	}) // }}}

	it('isLeapYear 2000-1-1', func() { // {{{
		const d = Date.create(2000, 0, 1)

		expect(d.isLeapYear()).to.be.true
	}) // }}}

	it('setDayOfMonth', func() { // {{{
		const d = Date.create(2000, 0, 1).setDayOfMonth(15)

		expect(d.getDayOfMonth()).to.equal(15)
	}) // }}}

	it('setUTCDayOfMonth', func() { // {{{
		const d = Date.create(2000, 0, 1, true).setUTCDayOfMonth(15)

		expect(d.getUTCDayOfMonth()).to.equal(15)
	}) // }}}
})