<?php
$I = new ApiGuy($scenario);
$I->wantTo('create a user via API');
$I->amHttpAuthenticated('service_user','123456');
$I->haveHttpHeader('Content-Type','application/x-www-form-urlencoded');
$I->sendPOST('users', array('name' => 'davert', 'email' => 'davert@codeception.com'));
$I->seeResponseCodeIs(200);
$I->seeResponseIsJson();
$I->seeResponseContains('{ result: ok}');
?>