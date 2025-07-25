<?php
require_once dirname(__FILE__) . "/../config.php";
require_once PROJECT_ROOT . "/DAO/DAO.php";


class Produit{
    private $reference;
    private $libelle;
    private $prixUni;
    private $quantite;
    private $prixAchat;
    private $image;
    private $cat;
    private $dao;



    function __construct($r,$l,$p,$q,$a,$i,$c){
        $this->reference = $r;
        $this->libelle = $l;
        $this->prix = $p;
        $this->quantite = $q;
        $this->prixAchat = $a;
        $this->image = $i;
        $this->cat = $c;
        $this->dao = new DAO();

    }

    function get($c){
        switch($c){
            case "r" : return $this->reference;
            case "l" : return $this->libelle;
            case "p" : return $this->prix;
            case "q" : return $this->quantite;
            case "a" : return $this->prixAchat;
            case "i" : return $this->image;
            case "c" : return $this->cat;
        }
    }

    function save(){
        $this->dao->ajouterProduit($this);
    }

    static function afficher(){
        $dao = new DAO();
        $cl=$dao->afficherProduits();
        return $cl;
    }

    function update($cli){
        $this->dao->updateProduit($cli);
    }

    static function deleteProduit($cli){
        $dao = new DAO();
        $dao->deleteProduit($cli);
    }

}

?>