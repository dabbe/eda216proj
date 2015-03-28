<?php
  require_once("mysql_connect_data.inc.php");
  require_once("database.inc.php");
  $db = new Database($host, $userName, $password, $database);
  $db->openConnection();
  $db->producePallet($_GET['amount'], $_GET['cookie']);
  $db->closeConnection();
?>
