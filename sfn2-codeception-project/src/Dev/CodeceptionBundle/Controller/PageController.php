<?php

namespace Dev\CodeceptionBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

// Import new namespaces
use Dev\CodeceptionBundle\Entity\User;
use Dev\CodeceptionBundle\Form\UserType;

class PageController extends Controller
{
	public function indexAction()
    {
        
    }

    public function loginAction()
    {
    	$user = new User();
	    $form = $this->createForm(new UserType(), $user);

	    $request = $this->getRequest();
	    if ($request->getMethod() == 'POST') {

	        $form->bind($request);

	        if ($form->isValid()) {
	        	return $this->redirect($this->generateUrl('codeception_user')); 	
		    }
	    } 

	    return $this->render('CodeceptionBundle:Page:login.html.twig', array(
	        'form' => $form->createView()
	    ));       
    }

    public function userAction()
    {
        return $this->render('CodeceptionBundle:Page:user.html.twig');
    }
}
