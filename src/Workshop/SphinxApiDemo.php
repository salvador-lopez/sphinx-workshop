<?php
namespace Workshop;

require_once __DIR__ . '/../../vendor/autoload.php';

$client = new \NilPortugues\Sphinx\SphinxClient();

$client->setServer('localhost', 9312);
$client->setLimits(0,2);
$results = $client->query('penelope', 'events');
print_r($results);
