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

describe('compare', func() {
	it('isAfter true', func() { // {{{
		expect(Date.create(2000, 1, 1).isAfter(1999, 1, 1)).to.be.true
	}) // }}}

	it('isAfter false', func() { // {{{
		expect(Date.create(2000, 1, 1).isAfter(2000, 2, 1)).to.be.false
	}) // }}}

	it('isBefore true', func() { // {{{
		expect(Date.create(2000, 1, 1).isBefore(2000, 2, 1)).to.be.true
	}) // }}}

	it('isBefore false', func() { // {{{
		expect(Date.create(2000, 1, 1).isBefore(1999, 2, 1)).to.be.false
	}) // }}}

	it('isBetween true', func() { // {{{
		expect(Date.create(2000, 1, 1).isBetween(Date.create(1999, 2, 1), Date.create(2000, 2, 1))).to.be.true
	}) // }}}

	it('isBetween false', func() { // {{{
		expect(Date.create(2000, 1, 1).isBetween(Date.create(2000, 1, 15), Date.create(2000, 2, 1))).to.be.false
	}) // }}}

	describe('difference', func() {
		describe('year', func() {
			it('2003-1-1 enu', func() { // {{{
				expect(Date.create(2000, 1, 1).difference(TimeUnit::YEARS, 2003, 1, 1)).to.equal(2)
			}) // }}}

			it('2003-1-1 str', func() { // {{{
				expect(Date.create(2000, 1, 1).difference('year', 2003, 1, 1)).to.equal(2)
			}) // }}}

			it('2002-12-1 enu', func() { // {{{
				expect(Date.create(2000, 1, 1).difference(TimeUnit::YEARS, 2002, 12, 1)).to.equal(1)
			}) // }}}

			it('2002-12-1 str', func() { // {{{
				expect(Date.create(2000, 1, 1).difference('year', 2002, 12, 1)).to.equal(1)
			}) // }}}
		})

		describe('month', func() {
			it('enu', func() { // {{{
				expect(Date.create(2000, 1, 1).difference(TimeUnit::MONTHS, 2000, 4, 21)).to.equal(2)
			}) // }}}

			it('str', func() { // {{{
				expect(Date.create(2000, 1, 1).difference('month', 2000, 4, 21)).to.equal(2)
			}) // }}}
		})

		describe('day', func() {
			it('enu', func() { // {{{
				expect(Date.create(2000, 1, 1).difference(TimeUnit::DAYS, 2000, 2, 1)).to.equal(31)
			}) // }}}

			it('str', func() { // {{{
				expect(Date.create(2000, 1, 1).difference('day', 2000, 2, 1)).to.equal(31)
			}) // }}}
		})

		describe('hour', func() {
			it('enu', func() { // {{{
				expect(Date.create(2000, 1, 1).difference(TimeUnit::HOURS, 2000, 1, 3)).to.equal(48)
			}) // }}}

			it('str', func() { // {{{
				expect(Date.create(2000, 1, 1).difference('hour', 2000, 1, 3)).to.equal(48)
			}) // }}}
		})

		describe('minute', func() {
			it('enu', func() { // {{{
				expect(Date.create(2000, 1, 1).difference(TimeUnit::MINUTES, 2000, 1, 1, 12, 0)).to.equal(720)
			}) // }}}

			it('str', func() { // {{{
				expect(Date.create(2000, 1, 1).difference('minute', 2000, 1, 1, 12, 0)).to.equal(720)
			}) // }}}
		})

		describe('second', func() {
			it('enu', func() { // {{{
				expect(Date.create(2000, 1, 1).difference(TimeUnit::SECONDS, 2000, 1, 1, 0, 5)).to.equal(300)
			}) // }}}

			it('str', func() { // {{{
				expect(Date.create(2000, 1, 1).difference('second', 2000, 1, 1, 0, 5)).to.equal(300)
			}) // }}}
		})

		describe('millisecond', func() {
			it('enu', func() { // {{{
				expect(Date.create(2000, 1, 1).difference(TimeUnit::MILLISECONDS, 2000, 1, 1, 0, 0, 36)).to.equal(36000)
			}) // }}}

			it('str', func() { // {{{
				expect(Date.create(2000, 1, 1).difference('millisecond', 2000, 1, 1, 0, 0, 36)).to.equal(36000)
			}) // }}}
		})
	})

	it('equals', func() { // {{{
		const r = new Date()

		expect(r.equals(r.clone())).to.be.true
	}) // }}}
})