<?php
  session_start();
  if(!isset($_SESSION['login'])){
    header("Location: http://localhost/gestion_stock/Projet_Web_TP/");
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
  header("Location: http://localhost/gestion_stock/Projet_Web_TP/Presentation/Produit/afficherProduits.php");
?>