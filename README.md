[@zokugun/lang.date](https://github.com/ZokugunKS/lang.date)
============================================================

[![kaoscript](https://img.shields.io/badge/language-kaoscript-orange.svg)](https://github.com/kaoscript/kaoscript)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](./LICENSE)
[![NPM Version](https://img.shields.io/npm/v/@zokugun/lang.date.svg?colorB=green)](https://www.npmjs.com/package/@zokugun/lang.date)
[![Dependency Status](https://badges.depfu.com/badges/4fa5496a8c66276c41c9683037d6a12e/overview.svg)](https://depfu.com/github/ZokugunKS/lang.date)
[![Build Status](https://travis-ci.org/ZokugunKS/lang.date.svg?branch=master)](https://travis-ci.org/ZokugunKS/lang.date)
[![CircleCI](https://circleci.com/gh/ZokugunKS/lang.date/tree/master.svg?style=shield)](https://circleci.com/gh/ZokugunKS/lang.date/tree/master)
[![Coverage Status](https://img.shields.io/coveralls/ZokugunKS/lang.date/master.svg)](https://coveralls.io/github/ZokugunKS/lang.date)

Extends the built-in Date class to work only on the UTC timezone.

The weeks are defined by the [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#Week_dates).

Getting Started
---------------

### In Node.js

With [node](http://nodejs.org) previously installed:

	npm install @zokugun/lang.date

Use it with `kaoscript`:

```kaoscript
import '@zokugun/lang.date'

const d = Date.tomorrow()
```

Functions
---------

- create()
- getTime()
- isTime()
- today()
- tomorrow()
- yesterday()

Methods
-------

- add()
- clone()
- difference()
- endOf()
- equals()
- format()
- future()
- futureOrPresent()
- getEpochTime()
- getDayOfMonth()
- getDayOfWeek()
- getDayOfYear()
- getDaysInMonth()
- getDaysInYear()
- getWeek()
- getWeeksInYear()
- getYearOfWeek()
- isAfter()
- isBefore()
- isBetween()
- isLeapYear()
- midnight()
- noon()
- past()
- pastOrPresent()
- rewind()
- set()
- setDayOfMonth()
- setDayOfWeek()
- setDayOfYear()
- setWeek()
- startOf()

License
-------

[MIT](http://www.opensource.org/licenses/mit-license.php) &copy; Baptiste Augrain