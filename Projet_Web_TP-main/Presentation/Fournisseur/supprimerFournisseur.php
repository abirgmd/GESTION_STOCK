<?php 
  session_start();
  include_once('../../Metier/fournisseur.php');
  if(!isset($_SESSION['login'])){
    header("Location: http://localhost/Projet_Web_TP-main/");
  }

    if(isset($_GET)){
      Fournisseur::delete($_GET['id']);
    }

    header("Location: http://localhost/Projet_Web_TP-main/Presentation/Fournisseur/afficherFournisseurs.php");
?>