<?php 
  session_start();
  include_once('../../Metier/produit.php');
  if(!isset($_SESSION['login'])){
    header("Location: http://localhost/Projet_Web_TP-main/");
  }

    if(isset($_GET)){
        Produit::deleteProduit($_GET['id']);
    }

    header("Location: http://localhost/Projet_Web_TP-main/Presentation/Produit/afficherProduits.php");
?>
