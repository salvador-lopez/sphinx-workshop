<?php

namespace Workshop\Exercises;

use Foolz\SphinxQL\SphinxQL;
use Foolz\SphinxQL\Connection;

require_once __DIR__ . '/../../../vendor/autoload.php';

$conn = new Connection();
$conn->setConnectionParams('192.168.56.99', 9306);

//Exercise 1:
$sql = <<<QUERY
    SELECT * FROM
        addresses
   WHERE MATCH('(1074 -manor) | (valencia place)')
   ORDER BY country_name DESC, city_name ASC
QUERY;

$query = SphinxQL::create($conn)->query($sql);

$result = $query->execute();
print_r($result);

//Exercise 2:
$latitude = (float) 35;
$longitude = (float) 40;

$sql = <<<QUERY
    SELECT
        *, GEODIST($latitude, $longitude, latitude, longitude) AS geodistance
    FROM
        addresses
    WHERE
        address_id NOT IN (1,2,3,4,5,6,7,8,9)
    ORDER BY
        geodistance ASC
    LIMIT 0,5
QUERY;

$query = SphinxQL::create($conn)->query($sql);

$result = $query->execute();
print_r($result);