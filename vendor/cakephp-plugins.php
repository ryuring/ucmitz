<?php
$baseDir = dirname(dirname(__FILE__));

return [
    'plugins' => [
        'Authentication' => $baseDir . '/vendor/cakephp/authentication/',
        'Bake' => $baseDir . '/vendor/cakephp/bake/',
        'Cake/TwigView' => $baseDir . '/vendor/cakephp/twig-view/',
        'DebugKit' => $baseDir . '/vendor/cakephp/debug_kit/',
        'Migrations' => $baseDir . '/vendor/cakephp/migrations/',
        'baser-core' => $baseDir . '/plugins/baser-core/',
        'bc-admin-third' => $baseDir . '/plugins/bc-admin-third/',
        'bc-blog' => $baseDir . '/plugins/bc-blog/',
    ],
];
