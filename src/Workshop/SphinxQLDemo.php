<?php

namespace Workshop;

use Foolz\SphinxQL\SphinxQL;
use Foolz\SphinxQL\Connection;

require_once __DIR__ . '/../../vendor/autoload.php';

$conn = new Connection();
$conn->setConnectionParams('192.168.56.99', 9306);

$sql = <<<QUERY
    SELECT * FROM
        events
   WHERE MATCH('epic | action')
   GROUP BY film_id
   ORDER BY WEIGHT() ASC
   LIMIT 0,5
   OPTION field_weights=(first_name=100,last_name=20,film_description=10);
QUERY;

$query = SphinxQL::create($conn)->query($sql);

$result = $query->execute();
print_r($result);





