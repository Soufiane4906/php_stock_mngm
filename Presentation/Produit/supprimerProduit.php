<?php
  session_start();
  include_once('../../Metier/produit.php');
  if(!isset($_SESSION['login'])){
    header("Location: http://localhost/gestion_stock/Projet_Web_TP/");
  }

    if(isset($_GET)){
        Produit::deleteProduit($_GET['id']);
    }

    header("Location: http://localhost/gestion_stock/Projet_Web_TP/Presentation/Produit/afficherProduits.php");
?>
