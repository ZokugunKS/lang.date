#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'		for expect
	'..'
}

describe('week', func() {
	describe('get', func() {
		describe('local', func() {
			it('2000-1-1', func() { // {{{
				const d = new Date(2000, 0, 1)

				expect(d.getWeek()).to.equal(0)
			}) // }}}

			it('2003-1-1', func() { // {{{
				const d = new Date(2003, 0, 1)

				expect(d.getWeek()).to.equal(1)
			}) // }}}

			it('2005-1-1', func() { // {{{
				const d = new Date(2005, 0, 1)

				expect(d.getWeek()).to.equal(0)
			}) // }}}

			it('2000-6-15', func() { // {{{
				const d = new Date(2000, 5, 15)

				expect(d.getWeek()).to.equal(24)
			}) // }}}

			it('2003-6-15', func() { // {{{
				const d = new Date(2003, 5, 15)

				expect(d.getWeek()).to.equal(24)
			}) // }}}

			it('2005-6-15', func() { // {{{
				const d = new Date(2005, 5, 15)

				expect(d.getWeek()).to.equal(24)
			}) // }}}

			it('2000-12-24', func() { // {{{
				const d = new Date(2000, 11, 24)

				expect(d.getWeek()).to.equal(51)
			}) // }}}

			it('2000-12-31', func() { // {{{
				const d = new Date(2000, 11, 31)

				expect(d.getWeek()).to.equal(52)
			}) // }}}

			it('2003-12-31', func() { // {{{
				const d = new Date(2003, 11, 31)

				expect(d.getWeek()).to.equal(0)
			}) // }}}

			it('2005-12-31', func() { // {{{
				const d = new Date(2005, 11, 31)

				expect(d.getWeek()).to.equal(52)
			}) // }}}
		})

		describe('UTC', func() {
			it('2000-1-1', func() { // {{{
				const d = Date.create(2000, 0, 1, true)

				expect(d.getUTCWeek()).to.equal(0)
			}) // }}}

			it('2003-1-1', func() { // {{{
				const d = Date.create(2003, 0, 1, true)

				expect(d.getUTCWeek()).to.equal(1)
			}) // }}}

			it('2000-12-31', func() { // {{{
				const d = Date.create(2000, 11, 31, true)

				expect(d.getUTCWeek()).to.equal(52)
			}) // }}}

			it('2003-12-31', func() { // {{{
				const d = Date.create(2003, 11, 31, true)

				expect(d.getUTCWeek()).to.equal(0)
			}) // }}}
		})
	})

	describe('set', func() {
		describe('local', func() {
			it('2000-1-1', func() { // {{{
				const d = new Date(2000, 0, 1).setWeek(1)

				expect(d.getFullYear()).to.equal(2000)
				expect(d.getMonth()).to.equal(0)
				expect(d.getDayOfMonth()).to.equal(8)
			}) // }}}

			it('2000-12-31', func() { // {{{
				const d = new Date(2000, 11, 31).setWeek(50)

				expect(d.getFullYear()).to.equal(2000)
				expect(d.getMonth()).to.equal(11)
				expect(d.getDayOfMonth()).to.equal(17)
			}) // }}}
		})

		describe('UTC', func() {
			it('2000-1-1', func() { // {{{
				const d = Date.create(2000, 0, 1, true).setUTCWeek(1)

				expect(d.getUTCFullYear()).to.equal(2000)
				expect(d.getUTCMonth()).to.equal(0)
				expect(d.getUTCDayOfMonth()).to.equal(8)
			}) // }}}

			it('2000-12-31', func() { // {{{
				const d = Date.create(2000, 11, 31, true).setUTCWeek(50)

				expect(d.getUTCFullYear()).to.equal(2000)
				expect(d.getUTCMonth()).to.equal(11)
				expect(d.getUTCDayOfMonth()).to.equal(17)
			}) // }}}
		})
	})

	/* describe('dayOfWeek', func() {
		describe('get', func() {
			it('local', func() { // {{{
				const d = new Date(2000, 0, 20, 3, 45, 6, 789)

				expect(d.getDayOfWeek()).to.equal(4)
				expect(d.format('D')).to.equal('Thursday, January 20, 2000')
			}) // }}}

			it('UTC', func() { // {{{
				const d = Date.create(2000, 0, 20, 3, 45, 6, 789, true)

				expect(d.getUTCDayOfWeek()).to.equal(4)
				expect(d.format('D', true)).to.equal('Thursday, January 20, 2000')
			}) // }}}
		})

		describe('set', func() {
			describe('local', func() {
				it('2010-01-16 0-4', func() { // {{{
					const d = new Date(2000, 0, 16, 3, 45, 6, 789).setDayOfWeek(4)

					expect(d.format('D')).to.equal('Thursday, January 13, 2000')
				}) // }}}

				it('2010-01-20 4-6', func() { // {{{
					const d = new Date(2000, 0, 20, 3, 45, 6, 789).setDayOfWeek(6)

					expect(d.format('D')).to.equal('Saturday, January 22, 2000')
				}) // }}}

				it('2010-01-22 6-4', func() { // {{{
					const d = new Date(2000, 0, 22, 3, 45, 6, 789).setDayOfWeek(4)

					expect(d.format('D')).to.equal('Thursday, January 20, 2000')
				}) // }}}

				it('2010-01-20 4-0', func() { // {{{
					const d = new Date(2000, 0, 20, 3, 45, 6, 789).setDayOfWeek(0)

					expect(d.format('D')).to.equal('Sunday, January 23, 2000')
				}) // }}}
			})

			describe('UTC', func() {
				it('2010-01-16 0-4', func() { // {{{
					const d = Date.create(2000, 0, 16, 3, 45, 6, 789, true).setDayOfWeek(4)

					expect(d.format('D', true)).to.equal('Thursday, January 13, 2000')
				}) // }}}

				it('2010-01-20 4-6', func() { // {{{
					const d = Date.create(2000, 0, 20, 3, 45, 6, 789, true).setDayOfWeek(6)

					expect(d.format('D', true)).to.equal('Saturday, January 22, 2000')
				}) // }}}

				it('2010-01-22 6-4', func() { // {{{
					const d = Date.create(2000, 0, 22, 3, 45, 6, 789, true).setDayOfWeek(4)

					expect(d.format('D', true)).to.equal('Thursday, January 20, 2000')
				}) // }}}

				it('2010-01-20 4-0', func() { // {{{
					const d = Date.create(2000, 0, 20, 3, 45, 6, 789, true).setUTCDayOfWeek(0)

					expect(d.format('D', true)).to.equal('Sunday, January 23, 2000')
				}) // }}}
			})
		})
	}) */

	describe('getWeeksInYear', func() {
		describe('local', func() {
			it('2000-1-1', func() { // {{{
				const d = new Date(2000, 0, 1)

				expect(d.getWeeksInYear()).to.equal(52)
			}) // }}}

			it('2003-1-1', func() { // {{{
				const d = new Date(2003, 0, 1)

				expect(d.getWeeksInYear()).to.equal(52)
			}) // }}}

			it('2004-1-1', func() { // {{{
				const d = new Date(2004, 0, 1)

				expect(d.getWeeksInYear()).to.equal(53)
			}) // }}}
		})

		describe('UTC', func() {
			it('2000-1-1', func() { // {{{
				const d = Date.create(2000, 0, 1, true)

				expect(d.getWeeksInYear(true)).to.equal(52)
			}) // }}}

			it('2003-1-1', func() { // {{{
				const d = Date.create(2003, 0, 1, true)

				expect(d.getWeeksInYear(true)).to.equal(52)
			}) // }}}

			it('2004-1-1', func() { // {{{
				const d = Date.create(2004, 0, 1, true)

				expect(d.getWeeksInYear(true)).to.equal(53)
			}) // }}}
		})
	})

	describe('getYearOfWeek', func() {
		describe('local', func() {
			it('2000-1-1', func() { // {{{
				const d = new Date(2000, 0, 1)

				expect(d.getYearOfWeek()).to.equal(1999)
			}) // }}}

			it('2003-1-1', func() { // {{{
				const d = new Date(2003, 0, 1)

				expect(d.getYearOfWeek()).to.equal(2003)
			}) // }}}

			it('2005-1-1', func() { // {{{
				const d = new Date(2005, 0, 1)

				expect(d.getYearOfWeek()).to.equal(2004)
			}) // }}}

			it('2000-12-31', func() { // {{{
				const d = new Date(2000, 11, 31)

				expect(d.getYearOfWeek()).to.equal(2000)
			}) // }}}

			it('2003-12-31', func() { // {{{
				const d = new Date(2003, 11, 31)

				expect(d.getYearOfWeek()).to.equal(2004)
			}) // }}}

			it('2005-12-31', func() { // {{{
				const d = new Date(2005, 11, 31)

				expect(d.getYearOfWeek()).to.equal(2005)
			}) // }}}
		})

		describe('UTC', func() {
			it('2000-1-1', func() { // {{{
				const d = Date.create(2000, 0, 1, true)

				expect(d.getUTCYearOfWeek()).to.equal(1999)
			}) // }}}

			it('2003-1-1', func() { // {{{
				const d = Date.create(2003, 0, 1, true)

				expect(d.getUTCYearOfWeek()).to.equal(2003)
			}) // }}}

			it('2005-1-1', func() { // {{{
				const d = Date.create(2005, 0, 1, true)

				expect(d.getUTCYearOfWeek()).to.equal(2004)
			}) // }}}

			it('2000-12-31', func() { // {{{
				const d = Date.create(2000, 11, 31, true)

				expect(d.getUTCYearOfWeek()).to.equal(2000)
			}) // }}}

			it('2003-12-31', func() { // {{{
				const d = Date.create(2003, 11, 31, true)

				expect(d.getUTCYearOfWeek()).to.equal(2004)
			}) // }}}

			it('2005-12-31', func() { // {{{
				const d = Date.create(2005, 11, 31, true)

				expect(d.getUTCYearOfWeek()).to.equal(2005)
			}) // }}}
		})
	})

	/* describe('endOf', func() {
		describe('local', func() {
			it('2000-1-1', func() { // {{{
				const r = new Date(2000, 0, 1)
				const d = r.clone().endOf('week')

				expect(d.format('D')).to.equal('Sunday, January 02, 2000')
			}) // }}}

			it('2000-6-20', func() { // {{{
				const r = new Date(2000, 5, 20)
				const d = r.clone().endOf('week')

				expect(d.format('D')).to.equal('Sunday, June 25, 2000')
			}) // }}}

			it('2000-12-31', func() { // {{{
				const r = new Date(2000, 11, 31)
				const d = r.clone().endOf('week')

				expect(d.format('D')).to.equal('Sunday, December 31, 2000')
			}) // }}}
		})

		describe('UTC', func() {
			it('2000-1-1', func() { // {{{
				const r = Date.create(2000, 0, 1, true)
				const d = r.clone().endOf('week', true)

				expect(d.format('D', true)).to.equal('Sunday, January 02, 2000')
			}) // }}}

			it('2000-6-20', func() { // {{{
				const r = Date.create(2000, 5, 20, true)
				const d = r.clone().endOf('week', true)

				expect(d.format('D', true)).to.equal('Sunday, June 25, 2000')
			}) // }}}

			it('2000-12-31', func() { // {{{
				const r = Date.create(2000, 11, 31, true)
				const d = r.clone().endOf('week', true)

				expect(d.format('D', true)).to.equal('Sunday, December 31, 2000')
			}) // }}}
		})
	}) */

	/* describe('startOf', func() {
		describe('local', func() {
			it('2000-1-1', func() { // {{{
				const r = new Date(2000, 0, 1)
				const d = r.clone().startOf('week')

				expect(d.format('D')).to.equal('Monday, December 27, 1999')
			}) // }}}

			it('2000-6-20', func() { // {{{
				const r = new Date(2000, 5, 20)
				const d = r.clone().startOf('week')

				expect(d.format('D')).to.equal('Monday, June 19, 2000')
			}) // }}}

			it('2000-12-31', func() { // {{{
				const r = new Date(2000, 11, 31)
				const d = r.clone().startOf('week')

				expect(d.format('D')).to.equal('Monday, December 25, 2000')
			}) // }}}
		})

		describe('UTC', func() {
			it('2000-1-1', func() { // {{{
				const r = Date.create(2000, 0, 1, true)
				const d = r.clone().startOf('week', true)

				expect(d.format('D', true)).to.equal('Monday, December 27, 1999')
			}) // }}}

			it('2000-6-20', func() { // {{{
				const r = Date.create(2000, 5, 20, true)
				const d = r.clone().startOf('week', true)

				expect(d.format('D', true)).to.equal('Monday, June 19, 2000')
			}) // }}}

			it('2000-12-31', func() { // {{{
				const r = Date.create(2000, 11, 31, true)
				const d = r.clone().startOf('week', true)

				expect(d.format('D', true)).to.equal('Monday, December 25, 2000')
			}) // }}}
		})
	}) */
})