<?php
$I = new TestGuy($scenario);
$I->wantTo('verify on home page');
$I->amOnPage('/demo/hello/Duy');
$I->see('Hello Duy!');
