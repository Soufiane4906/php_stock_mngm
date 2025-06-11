<?php
  session_start();
  include_once('../../Metier/categorie.php');
  if(!isset($_SESSION['login'])){
    header("Location: http://localhost/gestion_stock/Projet_Web_TP/");
  }


        Categorie::delete($_GET['id']);


    header("Location: http://localhost/gestion_stock/Projet_Web_TP/Presentation/Categorie/afficherCategories.php");
?>