<?php
  session_start();
  include_once('../../Metier/client.php');
  if(!isset($_SESSION['login'])){
    header("Location: http://localhost/gestion_stock/Projet_Web_TP/");
  }

    if(isset($_GET)){
      DAO::deleteClient($_GET['id']);
    }

    header("Location: http://localhost/gestion_stock/Projet_Web_TP/Presentation/Client/afficherClients.php");
?>