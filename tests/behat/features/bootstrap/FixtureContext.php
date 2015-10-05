<?php namespace SilverStripe\Shop\Test\Behaviour;

use Behat\Behat\Context\ClosuredContextInterface,
	Behat\Behat\Context\TranslatedContextInterface,
	Behat\Behat\Context\BehatContext,
	Behat\Behat\Context\Step,
	Behat\Behat\Event\StepEvent,
	Behat\Behat\Exception\PendingException,
	Behat\Mink\Driver\Selenium2Driver,
	Behat\Gherkin\Node\PyStringNode,
	Behat\Gherkin\Node\TableNode;

// PHPUnit
//require_once 'PHPUnit/Autoload.php';
//require_once 'PHPUnit/Framework/Assert/Functions.php';

/**
 * Custom fixture steps for shop testing
 */
class FixtureContext extends \SilverStripe\BehatExtension\Context\FixtureContext {
}
