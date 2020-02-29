test:
ifeq ($(g),)
	node_modules/.bin/mocha --colors --check-leaks --require kaoscript/register --reporter list "test/*.ks"
else
	node_modules/.bin/mocha --colors --check-leaks --require kaoscript/register --reporter list -g "$(g)" "test/*.ks"
endif

coverage:
ifeq ($(g),)
	./node_modules/@zokugun/istanbul.cover/src/cli.js
else
	./node_modules/@zokugun/istanbul.cover/src/cli.js "$(g)"
endif

clean:
	node_modules/.bin/kaoscript --clean

.PHONY: test coverage