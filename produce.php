<?php
print_r($_GET['amount']);

  require_once("mysql_connect_data.inc.php");
  require_once("database.inc.php");
  $db = new Database($host, $userName, $password, $database);
  $db->openConnection();
?>
<script type='text/javascript'>
	alert('asdf');
</script>";
