#![bin]

extern {
	describe:	func
	it:			func
	console
}

import {
	'chai'		for expect
	'..'
}

describe('week', func() {
	describe('get', func() {
		const cases = [
			[1, 1, 1, 0, 1, 0]
			[6, 15, 25, 24, 24, 24]
			[12, 3, 49, 48, 49, 48]
			[12, 24, 52, 51, 52, 51]
			[12, 31, 53, 52, 0, 52]
		]

		for const case in cases {
			for const year, i in [1992, 2000, 2003, 2005] {
				it(`\(year)-\(case[0])-\(case[1])`, () => {
					const d = new Date(year, case[0], case[1])

					expect(d.getWeek()).to.equal(case[i + 2])
				})
			}
		}
	})

	describe('set', func() {
		it('2000-1-1', func() { // {{{
			const d = new Date(2000, 1, 1).setWeek(1)

			expect(d.getYear()).to.equal(2000)
			expect(d.getMonth()).to.equal(1)
			expect(d.getDayOfMonth()).to.equal(8)
		}) // }}}

		it('2000-12-31', func() { // {{{
			const d = new Date(2000, 12, 31).setWeek(50)

			expect(d.getYear()).to.equal(2000)
			expect(d.getMonth()).to.equal(12)
			expect(d.getDayOfMonth()).to.equal(17)
		}) // }}}
	})

	describe('dayOfWeek', func() {
		it('get', func() { // {{{
			const d = new Date(2000, 1, 20, 3, 45, 6, 789)

			expect(d.getDayOfWeek()).to.equal(4)
		}) // }}}

		describe('set', func() {
			it('2010-01-17 1-4', func() { // {{{
				const d = new Date(2000, 1, 17, 3, 45, 6, 789).setDayOfWeek(4)

				expect(d.getYear()).to.equal(2000)
				expect(d.getMonth()).to.equal(1)
				expect(d.getDayOfMonth()).to.equal(20)
				expect(d.getDayOfWeek()).to.equal(4)
			}) // }}}

			it('2010-01-20 4-6', func() { // {{{
				const d = new Date(2000, 1, 20, 3, 45, 6, 789).setDayOfWeek(6)

				expect(d.getDayOfWeek()).to.equal(6)
			}) // }}}

			it('2010-01-22 6-4', func() { // {{{
				const d = new Date(2000, 1, 22, 3, 45, 6, 789).setDayOfWeek(4)

				expect(d.getDayOfWeek()).to.equal(4)
			}) // }}}

			it('2010-01-20 4-1', func() { // {{{
				const d = new Date(2000, 1, 20, 3, 45, 6, 789).setDayOfWeek(1)

				expect(d.getDayOfWeek()).to.equal(1)
			}) // }}}
		})
	})

	describe('getWeeksInYear', func() {
		it('2000-1-1', func() { // {{{
			const d = new Date(2000, 1, 1)

			expect(d.getWeeksInYear()).to.equal(52)
		}) // }}}

		it('2003-1-1', func() { // {{{
			const d = new Date(2003, 1, 1)

			expect(d.getWeeksInYear()).to.equal(52)
		}) // }}}

		it('2004-1-1', func() { // {{{
			const d = new Date(2004, 1, 1)

			expect(d.getWeeksInYear()).to.equal(53)
		}) // }}}
	})

	describe('getYearOfWeek', func() {
		it('2000-1-1', func() { // {{{
			const d = new Date(2000, 1, 1)

			expect(d.getYearOfWeek()).to.equal(1999)
		}) // }}}

		it('2003-1-1', func() { // {{{
			const d = new Date(2003, 1, 1)

			expect(d.getYearOfWeek()).to.equal(2003)
		}) // }}}

		it('2005-1-1', func() { // {{{
			const d = new Date(2005, 1, 1)

			expect(d.getYearOfWeek()).to.equal(2004)
		}) // }}}

		it('2000-12-31', func() { // {{{
			const d = new Date(2000, 12, 31)

			expect(d.getYearOfWeek()).to.equal(2000)
		}) // }}}

		it('2003-12-31', func() { // {{{
			const d = new Date(2003, 12, 31)

			expect(d.getYearOfWeek()).to.equal(2004)
		}) // }}}

		it('2005-12-31', func() { // {{{
			const d = new Date(2005, 12, 31)

			expect(d.getYearOfWeek()).to.equal(2005)
		}) // }}}
	})

	describe('endOf', func() {
		it('2000-1-1', func() { // {{{
			const r = new Date(2000, 1, 1)
			const d = r.clone().endOf('week')

			expect(d.getYear()).to.equal(2000)
			expect(d.getMonth()).to.equal(1)
			expect(d.getDay()).to.equal(2)
		}) // }}}

		it('2000-6-20', func() { // {{{
			const r = new Date(2000, 6, 20)
			const d = r.clone().endOf('week')

			expect(d.getYear()).to.equal(2000)
			expect(d.getMonth()).to.equal(6)
			expect(d.getDay()).to.equal(25)
		}) // }}}

		it('2000-12-31', func() { // {{{
			const r = new Date(2000, 12, 31)
			const d = r.clone().endOf('week')

			expect(d.getYear()).to.equal(2000)
			expect(d.getMonth()).to.equal(12)
			expect(d.getDay()).to.equal(31)
		}) // }}}
	})

	describe('startOf', func() {
		it('2000-1-1', func() { // {{{
			const r = new Date(2000, 1, 1)
			const d = r.clone().startOf('week')

			expect(d.getYear()).to.equal(1999)
			expect(d.getMonth()).to.equal(12)
			expect(d.getDay()).to.equal(27)
		}) // }}}

		it('2000-6-20', func() { // {{{
			const r = new Date(2000, 6, 20)
			const d = r.clone().startOf('week')

			expect(d.getYear()).to.equal(2000)
			expect(d.getMonth()).to.equal(6)
			expect(d.getDay()).to.equal(19)
		}) // }}}

		it('2000-12-31', func() { // {{{
			const r = new Date(2000, 12, 31)
			const d = r.clone().startOf('week')

			expect(d.getYear()).to.equal(2000)
			expect(d.getMonth()).to.equal(12)
			expect(d.getDay()).to.equal(25)
		}) // }}}
	})
})