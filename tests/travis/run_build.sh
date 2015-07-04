#!/usr/bin/env bash
set -e
if [ -n "$COVERAGE" ]; then
	vendor/bin/phpunit -c ~/builds/ss/shop/phpunit.xml.dist --testsuite Split$COVERAGE --coverage-clover ~/builds/ss/shop/coverage.xml
elif [ -n "$BEHAT_TEST" ]; then
	vendor/bin/behat @shop
else
	vendor/bin/phpunit -c ~/builds/ss/shop/phpunit.xml.dist
fi
