<?php
    session_start();
    session_destroy();
    header("Location: http://localhost/gestion_stock/Projet_Web_TP/");
?>