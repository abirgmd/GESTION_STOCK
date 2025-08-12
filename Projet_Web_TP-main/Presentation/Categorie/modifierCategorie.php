<?php 
  session_start();
  include_once('../../Metier/client.php');
  if(!isset($_SESSION['login'])){
    header("Location: http://localhost/Projet_Web_TP-main/");
  }
  if(isset($_POST)){
    
    if(extract($_POST)){
    $c = new Client($nom, $adresse, $telephone, $email);
    $c->setId($id);
    $dao = new DAO();
    $dao->updateClient($c);
    $succes=true;
    unset($_POST);
    }
    unset($_POST);
 }

 
?>