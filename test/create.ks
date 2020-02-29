#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'		for expect
	'..'
}

describe('create', func() {
	it('today', func() { // {{{
		const r = new Date()

		const d = Date.today()

		expect(d.getYear()).to.equal(r.getYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDay()).to.equal(r.getDay())
		expect(d.getHour()).to.equal(0)
		expect(d.getMinute()).to.equal(0)
		expect(d.getSecond()).to.equal(0)
		expect(d.getMillisecond()).to.equal(0)
	}) // }}}

	it('tomorrow', func() { // {{{
		const r = new Date()
		r.setDay(r.getDay() + 1)

		const d = Date.tomorrow()

		expect(d.getYear()).to.equal(r.getYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDay()).to.equal(r.getDay())
		expect(d.getHour()).to.equal(0)
		expect(d.getMinute()).to.equal(0)
		expect(d.getSecond()).to.equal(0)
		expect(d.getMillisecond()).to.equal(0)
	}) // }}}

	it('yesterday', func() { // {{{
		const r = new Date()
		r.setDay(r.getDay() - 1)

		const d = Date.yesterday()

		expect(d.getYear()).to.equal(r.getYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDay()).to.equal(r.getDay())
		expect(d.getHour()).to.equal(0)
		expect(d.getMinute()).to.equal(0)
		expect(d.getSecond()).to.equal(0)
		expect(d.getMillisecond()).to.equal(0)
	}) // }}}

	it('new 2000-1-1', func() { // {{{
		const d = new Date(2000, 1, 1)

		expect(d.getYear()).to.equal(2000)
		expect(d.getMonth()).to.equal(1)
		expect(d.getDay()).to.equal(1)
		expect(d.getHour()).to.equal(0)
		expect(d.getMinute()).to.equal(0)
		expect(d.getSecond()).to.equal(0)
		expect(d.getMillisecond()).to.equal(0)
	}) // }}}

	it('create 2000-1-1', func() { // {{{
		const d = Date.create(2000, 1, 1)

		expect(d.getYear()).to.equal(2000)
		expect(d.getMonth()).to.equal(1)
		expect(d.getDay()).to.equal(1)
		expect(d.getHour()).to.equal(0)
		expect(d.getMinute()).to.equal(0)
		expect(d.getSecond()).to.equal(0)
		expect(d.getMillisecond()).to.equal(0)
	}) // }}}
})