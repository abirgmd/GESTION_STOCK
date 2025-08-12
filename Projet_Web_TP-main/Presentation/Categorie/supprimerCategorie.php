<?php 
  session_start();
  include_once('../../Metier/categorie.php');
  if(!isset($_SESSION['login'])){
    header("Location: http://localhost/Projet_Web_TP-main/");
  }


        Categorie::delete($_GET['id']);
  

    header("Location: http://localhost/Projet_Web_TP-main/Presentation/Categorie/afficherCategories.php");
?>