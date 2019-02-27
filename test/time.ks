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

		expect(Date.getTime(d)).to.equal(d.getTime())
	}) // }}}
})