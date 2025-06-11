<?php
  session_start();
  include_once('../../Metier/fournisseur.php');
  if(!isset($_SESSION['login'])){
    header("Location: http://localhost/gestion_stock/Projet_Web_TP/");
  }

    if(isset($_GET)){
      Fournisseur::delete($_GET['id']);
    }

    header("Location: http://localhost/gestion_stock/Projet_Web_TP/Presentation/Fournisseur/afficherFournisseurs.php");
?>