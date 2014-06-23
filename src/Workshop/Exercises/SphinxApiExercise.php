<?php

namespace Workshop\Exercises;

use NilPortugues\Sphinx\SphinxClient;

require_once __DIR__ . '/../../../vendor/autoload.php';

$client = new SphinxClient();

$client->setServer('192.168.56.99', 9312);

//Exercise 1
$client->setSortMode(SPH_SORT_EXTENDED, 'country_name DESC, city_name ASC');
$client->setMatchMode(SPH_MATCH_EXTENDED);
$results = $client->query('(1074 -manor) | (valencia place)', 'addresses');

print_r($results);

$client->resetFilters();
$client->resetGroupBy();

//Exercise 2
$client->setFilter('address_id', [1, 2, 3, 4, 5, 6, 7, 8, 9], true);
$client->setLimits(0, 5);
$client->setGeoAnchor('latitude', 'longitude', (float) 35, (float) 40);
$client->setSortMode(SPH_SORT_EXTENDED, '@geodist ASC');
$results = $client->query('', 'addresses');

print_r($results);
