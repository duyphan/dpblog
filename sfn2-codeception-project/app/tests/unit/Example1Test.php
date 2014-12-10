<?php
use Codeception\Util\Stub;
use Acme\UserBundle\Entity\MyUserTest;

class Example1Test extends \Codeception\TestCase\Test
{
   /**
    * @var \CodeGuy
    */
    protected $codeGuy;

    protected function _before()
    {
        $this->myUserTest = new MyUserTest();
    }

    protected function _after()
    {
    }

    // tests
    public function testSetAndGetUsername()
    {        
        $this->myUserTest->setUsername("Duy Phan");
        $this->assertEquals('Duy Phan', $this->myUserTest->getUsername());
    }

    public function testSetAndGetPassword()
    {        
        $this->myUserTest->setPassword("duyphan@123");
        $this->assertEquals('duyphan@123', $this->myUserTest->getPassword());
    }
    
    public function testSetAndGetEmail()
    {        
        $this->myUserTest->setEmail("duy.phan@asnet.com.vn");
        $this->assertEquals('duy.phan@asnet.com.vn', $this->myUserTest->getEmail());
    }

    public function testSetAndGetSex()
    {        
        $this->myUserTest->setSex("Male");
        $this->assertEquals('Male', $this->myUserTest->getSex());
    }      
        
    /*$this->codeGuy->seeInDatabase('MyUserTest', array('username' => 'Duy Phan', 'password' => 'duyphan@123', 'email' => 'duy.phan@asnet.com.vn', 'sex' => 'Male'));*/

}