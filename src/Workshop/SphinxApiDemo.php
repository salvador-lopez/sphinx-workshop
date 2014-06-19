<?php

namespace Workshop;

use NilPortugues\Sphinx\SphinxClient;

require_once __DIR__ . '/../../vendor/autoload.php';

$client = new SphinxClient();

$client->setFieldWeights(
    [
        'first_name'       => 100,
        'last_name'        => 20,
        'film_description' => 10,
    ]
);

$client->setServer('192.168.56.99', 9312);
$client->setGroupBy('film_id', SPH_GROUPBY_ATTR, '@weight ASC');
$client->setLimits(0,5);
$client->setMatchMode(SPH_MATCH_EXTENDED);
$results = $client->query('@film_description epic | action', 'events');

print_r($results);