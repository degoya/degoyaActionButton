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
$resource = $_POST['resource'];
$snippet = $_POST['snippet'];
if ($modx->runSnippet($snippet,array('resourceid' => $resource))=='success') {
	print '{"result":"success","msg":"1","resource":"'.$resource.'","snippet":"'.$snippet.'"}';
} else {
	print '{"result":"error","msg":"0","resource":"'.$resource.'","snippet":"'.$snippet.'"}';
}

