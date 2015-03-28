<?php
  require_once("mysql_connect_data.inc.php");
  require_once("database.inc.php");
  $db = new Database($host, $userName, $password, $database);
  $db->openConnection();
  $pallets = $db->getPalletsByDate($_GET['first'], $_GET['second'], $_GET['cookie']);
  foreach($pallets as $row){
    $db->blockPallet($row['pallet_id'])   
  }
		
  $db->closeConnection();
?>