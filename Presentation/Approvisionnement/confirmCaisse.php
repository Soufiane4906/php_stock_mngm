<?php
require("../../Metier/approvisionnement.php");
require("../../Metier/ligneAppro.php");
  session_start();
  if(!isset($_SESSION['login'])){
    header("Location: http://localhost/gestion_stock/Projet_Web_TP/");
  }

  // var_dump($_POST);
  extract($_POST);


  $cmd= new Approvis(null,$da,$client);
  $cmd->save();

  $idapp = DAO::getApprovisId($da,$client);

  foreach($cart as $c){
    $newQnt = ($c[3])+($c[2]);
    $ligne = new LigneAppro($idapp,$c[0],$c[1],$c[2],null,$newQnt);
    $ligne->save();
  }



  // header("Location: http://localhost/gestion_stock/Projet_Web_TP/Presentation/Commande/pdf.php?ref=$idcmd");
  header("Location: http://localhost/gestion_stock/Projet_Web_TP/Presentation/Approvisionnement/caisse.php?ref=$idapp");
?>
