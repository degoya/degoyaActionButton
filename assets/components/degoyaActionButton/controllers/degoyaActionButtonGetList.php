<?php
/**
 * Controller for Ajax requests.
 */
// Adjust the path appropriately

$docroot = dirname(dirname(dirname(dirname(dirname(__FILE__)))));
include $docroot . '/config.core.php';
if (!defined('MODX_API_MODE')) {
    define('MODX_API_MODE', false);
}
include_once MODX_CORE_PATH . 'model/modx/modx.class.php';
$modx = new modX();
$modx->initialize('mgr');

$c = $modx->newQuery('modSnippet');
$c->sortby('name', 'ASC');

$results = array();
        $collection = $modx->getCollection('modSnippet', $c);
        foreach ($collection as $snippet) {
            $results[] = $snippet->get(array('id', 'name'));
        }

        if (empty($results)) {
            return $modx->failure($modx->lexicon('contentblocks.error.no_snippets'));
        }

print json_encode($results);

