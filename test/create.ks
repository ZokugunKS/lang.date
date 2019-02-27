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
	it('today local', func() { // {{{
		const r = new Date()

		const d = Date.today()

		expect(d.getFullYear()).to.equal(r.getFullYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDate()).to.equal(r.getDate())
		expect(d.getHours()).to.equal(0)
		expect(d.getMinutes()).to.equal(0)
		expect(d.getSeconds()).to.equal(0)
		expect(d.getMilliseconds()).to.equal(0)
	}) // }}}

	it('today utc', func() { // {{{
		const r = new Date()

		const d = Date.today(true)

		expect(d.getUTCFullYear()).to.equal(r.getUTCFullYear())
		expect(d.getUTCMonth()).to.equal(r.getUTCMonth())
		expect(d.getUTCDate()).to.equal(r.getUTCDate())
		expect(d.getUTCHours()).to.equal(0)
		expect(d.getUTCMinutes()).to.equal(0)
		expect(d.getUTCSeconds()).to.equal(0)
		expect(d.getUTCMilliseconds()).to.equal(0)
	}) // }}}

	it('tomorrow local', func() { // {{{
		const r = new Date()
		r.setDate(r.getDate() + 1)

		const d = Date.tomorrow()

		expect(d.getFullYear()).to.equal(r.getFullYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDate()).to.equal(r.getDate())
		expect(d.getHours()).to.equal(0)
		expect(d.getMinutes()).to.equal(0)
		expect(d.getSeconds()).to.equal(0)
		expect(d.getMilliseconds()).to.equal(0)
	}) // }}}

	it('tomorrow utc', func() { // {{{
		const r = new Date()
		r.setDate(r.getDate() + 1)

		const d = Date.tomorrow(true)

		expect(d.getUTCFullYear()).to.equal(r.getUTCFullYear())
		expect(d.getUTCMonth()).to.equal(r.getUTCMonth())
		expect(d.getUTCDate()).to.equal(r.getUTCDate())
		expect(d.getUTCHours()).to.equal(0)
		expect(d.getUTCMinutes()).to.equal(0)
		expect(d.getUTCSeconds()).to.equal(0)
		expect(d.getUTCMilliseconds()).to.equal(0)
	}) // }}}

	it('yesterday local', func() { // {{{
		const r = new Date()
		r.setDate(r.getDate() - 1)

		const d = Date.yesterday()

		expect(d.getFullYear()).to.equal(r.getFullYear())
		expect(d.getMonth()).to.equal(r.getMonth())
		expect(d.getDate()).to.equal(r.getDate())
		expect(d.getHours()).to.equal(0)
		expect(d.getMinutes()).to.equal(0)
		expect(d.getSeconds()).to.equal(0)
		expect(d.getMilliseconds()).to.equal(0)
	}) // }}}

	it('yesterday utc', func() { // {{{
		const r = new Date()
		r.setDate(r.getDate() - 1)

		const d = Date.yesterday(true)

		expect(d.getUTCFullYear()).to.equal(r.getUTCFullYear())
		expect(d.getUTCMonth()).to.equal(r.getUTCMonth())
		expect(d.getUTCDate()).to.equal(r.getUTCDate())
		expect(d.getUTCHours()).to.equal(0)
		expect(d.getUTCMinutes()).to.equal(0)
		expect(d.getUTCSeconds()).to.equal(0)
		expect(d.getUTCMilliseconds()).to.equal(0)
	}) // }}}

	it('new 2000-1-1', func() { // {{{
		const d = new Date(2000, 0, 1)

		expect(d.getFullYear()).to.equal(2000)
		expect(d.getMonth()).to.equal(0)
		expect(d.getDate()).to.equal(1)
		expect(d.getHours()).to.equal(0)
		expect(d.getMinutes()).to.equal(0)
		expect(d.getSeconds()).to.equal(0)
		expect(d.getMilliseconds()).to.equal(0)
	}) // }}}

	it('create local 2000-1-1', func() { // {{{
		const d = Date.create(2000, 0, 1)

		expect(d.getFullYear()).to.equal(2000)
		expect(d.getMonth()).to.equal(0)
		expect(d.getDate()).to.equal(1)
		expect(d.getHours()).to.equal(0)
		expect(d.getMinutes()).to.equal(0)
		expect(d.getSeconds()).to.equal(0)
		expect(d.getMilliseconds()).to.equal(0)
	}) // }}}

	it('create utc 2000-1-1', func() { // {{{
		const d = Date.create(2000, 0, 1, true)

		expect(d.getUTCFullYear()).to.equal(2000)
		expect(d.getUTCMonth()).to.equal(0)
		expect(d.getUTCDate()).to.equal(1)
		expect(d.getUTCHours()).to.equal(0)
		expect(d.getUTCMinutes()).to.equal(0)
		expect(d.getUTCSeconds()).to.equal(0)
		expect(d.getUTCMilliseconds()).to.equal(0)
	}) // }}}

	it('clone', func() { // {{{
		const r = new Date()
		const d = r.clone()

		expect(r).to.not.equal(d)
		expect(r.getTime()).to.equal(d.getTime())
	}) // }}}
})