<?php 
  session_start();
  if(!isset($_SESSION['login'])){
    header("Location: http://localhost/Projet_Web_TP-main/");
  }
  if(isset($_POST)){
    include_once('../../Metier/produit.php');
    var_dump($_POST);
    if(extract($_POST)){
      $dao = new DAO();
    $c = new Produit($reference,$libelle,$prix,$quantite,$achat,"",$cat);
    $c->update($c);
    $succes=true;
    }
  }
  header("Location: http://localhost/Projet_Web_TP-main/Presentation/Produit/afficherProduits.php");
?>