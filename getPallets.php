<?php
  require_once("mysql_connect_data.inc.php");
  require_once("database.inc.php");
  $db = new Database($host, $userName, $password, $database);
  $db->openConnection();
  $pallets = $db->getPallets($_GET['pname']);
  $data = array();
  foreach($pallets as $row){
		array_push($data, array(
			'cookie' => $row['cookie'], 
      'date_delivered' => $row['date_delivered'],
      'date_produced' => $row['date_produced'],
			'customer_name' => $row['customer_name'],
      'blocked' => $row['blocked'] == 0 ? "No" : "Yes"));
  }
  echo json_encode($data);
  $db->closeConnection();
?>