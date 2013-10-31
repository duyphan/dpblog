<?php
$I = new WebGuy($scenario);
$I->wantTo('verify login page');
$I->amOnPage('/login');
$I->see('Login', 'h1');
$I->fillField('username', 'duyphan113');
$I->fillField('password', 'duyphan');
$I->click('Login');
$I->seeInCurrentUrl('/user'); 
