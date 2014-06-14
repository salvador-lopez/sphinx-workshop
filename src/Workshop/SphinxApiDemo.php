<?php
namespace Workshop;

use NilPortugues\Sphinx\SphinxClient;

require_once __DIR__ . '/../../vendor/autoload.php';

$client = new SphinxClient();

$client->setServer('localhost', 9312);
$client->setLimits(0,1);
$results = $client->query('penelope', 'events');
print_r($results);
