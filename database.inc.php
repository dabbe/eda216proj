<?php
/*
 * Class Database: interface to the movie database from PHP.
 *
 * You must:
 *
 * 1) Change the function userExists so the SQL query is appropriate for your tables.
 * 2) Write more functions.
 *
 */
class Database {
	private $host;
	private $userName;
	private $password;
	private $database;
	private $conn;
	
	/**
	 * Constructs a database object for the specified user.
	 */
	public function __construct($host, $userName, $password, $database) {
		$this->host = $host;
		$this->userName = $userName;
		$this->password = $password;
		$this->database = $database;
	}
	
	/** 
	 * Opens a connection to the database, using the earlier specified user
	 * name and password.
	 *
	 * @return true if the connection succeeded, false if the connection 
	 * couldn't be opened or the supplied user name and password were not 
	 * recognized.
	 */
	public function openConnection() {
		try {
			$this->conn = new PDO("mysql:host=$this->host;dbname=$this->database", 
					$this->userName,  $this->password);
			$this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		} catch (PDOException $e) {
			$error = "Connection error: " . $e->getMessage();
			print $error . "<p>";
			unset($this->conn);
			return false;
		}
		return true;
	}
	
	/**
	 * Closes the connection to the database.
	 */
	public function closeConnection() {
		$this->conn = null;
		unset($this->conn);
	}

	/**
	 * Checks if the connection to the database has been established.
	 *
	 * @return true if the connection has been established
	 */
	public function isConnected() {
		return isset($this->conn);
	}
	
	/**
	 * Execute a database query (select).
	 *
	 * @param $query The query string (SQL), with ? placeholders for parameters
	 * @param $param Array with parameters 
	 * @return The result set
	 */
	private function executeQuery($query, $param = null) {
		try {
			$stmt = $this->conn->prepare($query);
			$stmt->execute($param);
			$result = $stmt->fetchAll();
		} catch (PDOException $e) {
			$error = "*** Internal error: " . $e->getMessage() . "<p>" . $query;
			die($error);
		}
		return $result;
	}
	
	/**
	 * Execute a database update (insert/delete/update).
	 *
	 * @param $query The query string (SQL), with ? placeholders for parameters
	 * @param $param Array with parameters 
	 * @return The number of affected rows
	 */
	private function executeUpdate($query, $param = null) {
		try {
			$stmt = $this->conn->prepare($query);
			$result = $stmt->execute($param);
		} catch (PDOException $e) {
			$error = "*** Internal error: " . $e->getMessage() . "<p>" . $query;
			die($error);
		}
		return $result;
	}


	public function getPallet($i){
		$sql = "select cookie, date_produced, customer_name, date_delivered, blocked
				from produced_pallets a 
					left join 
					delivered_pallets b 
				on a.pallet_id = b.pallet_id 
				where a.pallet_id = ?";
		return $this->executeQuery($sql, array($i));
	}

	public function blockPalletsByDate($first, $second, $cookie){
		$sql = "update produced_pallets
				set blocked = (blocked + 1) % 2
				where date_produced between ? and ? and cookie = ?";
		$this->executeUpdate($sql, array($first, $second, $cookie));
	}

	public function getPallets($i){
		$sql = "select cookie, date_produced, customer_name, date_delivered, blocked
				from produced_pallets a 
					left join 
					delivered_pallets b 
				on a.pallet_id = b.pallet_id 
				where a.cookie = ?";
		return $this->executeQuery($sql, array($i));
	}

	public function getPalletsByDate($a, $b, $c){
				$sql = "select cookie, date_produced, customer_name, date_delivered, blocked, a.pallet_id
				from produced_pallets a 
					left join 
					delivered_pallets b 
				on a.pallet_id = b.pallet_id 
				where date_produced between ? and ? and cookie = ?";
		return $this->executeQuery($sql, array($a, $b, $c));
	}

	public function producePallet($j, $k){
		for ($i=0; $i < $j; $i++) { 
			$sql = "insert into produced_pallets (cookie, date_produced, blocked)
					values (?, CURDATE(), 0)";
			$this->executeUpdate($sql, array($k));
		}
		$sql = "select material, amount
				from ingredients
				where cookie = ?";
		$ingredients = $this->executeQuery($sql, array($k));
		foreach ($ingredients as $row) {
			$sql = "update raw_materials
				set quantity = quantity - ? * ?  
				where name = ?";
			$this->executeUpdate($sql, array($j, $row['amount'], $row['material']));
		}
	}

	public function blockIngredient(){

	}
}
?>
