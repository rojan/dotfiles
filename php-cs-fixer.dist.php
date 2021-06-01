<?php

$finder = PhpCsFixer\Finder::create()->in(__DIR__);

$config = new PhpCsFixer\Config();
return $config->setRules([
        '@PSR12' => true,
        'array_syntax' => ['syntax' => 'long'],
        'blank_line_before_statement' => ['statements' =>
        ['return', 'if', 'for', 'foreach', 'while', 'do']
        ]
])->setFinder($finder);
