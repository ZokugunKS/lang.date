#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'		for expect
	'..'
}

describe('compare', func() {
	it('isAfter true', func() { // {{{
		expect(Date.create(2000, 0, 1).isAfter(1999, 1, 1)).to.be.true
	}) // }}}

	it('isAfter false', func() { // {{{
		expect(Date.create(2000, 0, 1).isAfter(2000, 1, 1)).to.be.false
	}) // }}}

	it('isBefore true', func() { // {{{
		expect(Date.create(2000, 0, 1).isBefore(2000, 1, 1)).to.be.true
	}) // }}}

	it('isBefore false', func() { // {{{
		expect(Date.create(2000, 0, 1).isBefore(1999, 1, 1)).to.be.false
	}) // }}}

	it('isBetween true', func() { // {{{
		expect(Date.create(2000, 0, 1).isBetween(Date.create(1999, 1, 1), Date.create(2000, 1, 1))).to.be.true
	}) // }}}

	it('isBetween false', func() { // {{{
		expect(Date.create(2000, 0, 1).isBetween(Date.create(2000, 0, 15), Date.create(2000, 1, 1))).to.be.false
	}) // }}}

	it('difference year 2003-1-1', func() { // {{{
		expect(Date.create(2000, 0, 1).difference('year', 2003, 0, 1)).to.equal(2)
	}) // }}}

	it('difference year 2002-12-1', func() { // {{{
		expect(Date.create(2000, 0, 1).difference('year', 2002, 11, 1)).to.equal(1)
	}) // }}}

	it('difference month', func() { // {{{
		expect(Date.create(2000, 0, 1).difference('month', 2000, 3, 21)).to.equal(2)
	}) // }}}

	it('difference day', func() { // {{{
		expect(Date.create(2000, 0, 1).difference('day', 2000, 1, 1)).to.equal(31)
	}) // }}}

	it('difference hour', func() { // {{{
		expect(Date.create(2000, 0, 1).difference('hour', 2000, 0, 3)).to.equal(48)
	}) // }}}

	it('difference minute', func() { // {{{
		expect(Date.create(2000, 0, 1).difference('minute', 2000, 0, 1, 12, 0)).to.equal(720)
	}) // }}}

	it('difference second', func() { // {{{
		expect(Date.create(2000, 0, 1).difference('second', 2000, 0, 1, 0, 5)).to.equal(300)
	}) // }}}

	it('difference millisecond', func() { // {{{
		expect(Date.create(2000, 0, 1).difference('millisecond', 2000, 0, 1, 0, 0, 36)).to.equal(36000)
	}) // }}}

	it('equals', func() { // {{{
		const r = new Date()

		expect(r.equals(r.clone())).to.be.true
	}) // }}}
})
