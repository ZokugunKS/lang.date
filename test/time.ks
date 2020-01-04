#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'		for expect
	'..'
}

describe('time', func() {
	it('isTime', func() { // {{{
		const d = new Date()

		expect(Date.isTime(d)).to.be.true
	}) // }}}

	it('getTime', func() { // {{{
		const d = new Date()

		expect(Date.getTime(d)).to.equal(d.getEpochTime())
	}) // }}}

	it('2008-03-30T01:59:59', func() { // {{{
		const d = new Date(2008, 3, 30, 1, 59, 59)

		expect(d.getTime()).to.equal(1206842399000)
	}) // }}}

	it('2008-03-30T02:59:59', func() { // {{{
		const d = new Date(2008, 3, 30, 2, 59, 59)

		expect(d.getTime()).to.equal(1206845999000)
	}) // }}}

	it('2008-03-30T03:59:59', func() { // {{{
		const d = new Date(2008, 3, 30, 3, 59, 59)

		expect(d.getTime()).to.equal(1206849599000)
	}) // }}}
})