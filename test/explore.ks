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

describe('explore', func() {
	it('getDay 2000-1-1', func() { // {{{
		const d = Date.create(2000, 1, 1)

		expect(d.getDay()).to.equal(1)
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

	it('getDayOfYear 2000-1-1', func() { // {{{
		const d = Date.create(2000, 1, 1)

		expect(d.getDayOfYear()).to.equal(1)
	}) // }}}

	it('isInLeapYear 2000-1-1', func() { // {{{
		const d = Date.create(2000, 1, 1)

		expect(d.isInLeapYear()).to.be.true
	}) // }}}
})