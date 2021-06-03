<?php

$finder = PhpCsFixer\Finder::create()->in(__DIR__);

$config = new PhpCsFixer\Config();

return $config->setRules(array(
        '@PSR12' => true,
        'array_syntax' => array('syntax' => 'long'),
        'blank_line_before_statement' => array('statements' =>
        array('return', 'if', 'for', 'foreach', 'while', 'do')
        ),
        'concat_space' => array("spacing" => 'one')
))->setFinder($finder);
