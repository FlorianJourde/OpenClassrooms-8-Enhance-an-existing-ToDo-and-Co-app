<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
//use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class SecurityController extends AbstractController
{
    /**
     * @Route("/login", name="login")
     */
    public function loginAction(Request $request, AuthenticationUtils $authenticationUtils)
    {
//        $authenticationUtils = $this->get('security.authentication_utils');

        $error = $authenticationUtils->getLastAuthenticationError();
//        $lastUsername = $authenticationUtils->getLastUsername();

        return $this->render('security/login.html.twig', [
//            'last_username' => $lastUsername,
            'error'         => $error,
        ]);


//        return $this->render('login/index.html.twig', [
//            'controller_name' => 'LoginController',
//        ]);
    }

    /**
     * @Route("/login_check", name="login_check")
     */
    public function loginCheck(AuthenticationUtils $authenticationUtils)
    {
        // This code is never executed.


        // if ($this->getUser()) {
        //     return $this->redirectToRoute('target_path');
        // }

        // get the login error if there is one
//        $error = $authenticationUtils->getLastAuthenticationError();
        // last username entered by the user
//        $lastUsername = $authenticationUtils->getLastUsername();

//        return $this->render('security/login.html.twig', ['last_username' => $lastUsername, 'error' => $error]);
//        return $this->render('security/login.html.twig', ['error' => $error]);

//        return $this->render('security/login_check.html.twig', [
//            'controller_name' => 'LoginController',
//        ]);

        return $this->redirectToRoute('homepage');
    }

    /**
     * @Route("/logout", name="logout")
     */
    public function logoutCheck()
    {
        // This code is never executed.
    }
}
