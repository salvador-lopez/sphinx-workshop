<?php

namespace Workshop;

use Foolz\SphinxQL\SphinxQL;
use Foolz\SphinxQL\Connection;

require_once __DIR__ . '/../../vendor/autoload.php';

$conn = new Connection();
$conn->setConnectionParams('192.168.56.99', 9306);
//$conn->setConnectionParams('127.0.0.1', 9306);

$sql = "SELECT * FROM events where MATCH('penelope')";
$query = SphinxQL::create($conn)->query($sql);

$result = $query->execute();
print_r($result);





