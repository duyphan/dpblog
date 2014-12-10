<?php
$I = new WebGuy($scenario);

$I->wantTo('verify register page succesful');
$I->amOnPage('/register');
$I->see('Registration', 'h1');
$I->fillField('Email', 'dp1206@gmail.com');
$I->fillField('Username', 'duy.phanasnet');
$I->fillField('Password', 'duyphan@123');
$I->fillField('Verification', 'duyphan@123');
$I->click('Register');
$I->see('Logged');

$I->wantTo('verify login page');
$I->amOnPage('/login');
$I->see('Login', 'h1');
$I->fillField('username', 'duy.phanasnet');
$I->fillField('password', 'duyphan@123');
$I->click('LoginSubmit');
$I->amOnPage('/login');
$I->see('Logout'); 
