<?php 
  session_start();
  include_once('../../Metier/client.php');
  if(!isset($_SESSION['login'])){
    header("Location: http://localhost/Projet_Web_TP-main/");
  }

    if(isset($_GET)){
      DAO::deleteClient($_GET['id']);
    }

    header("Location: http://localhost/Projet_Web_TP-main/Presentation/Client/afficherClients.php");
?>