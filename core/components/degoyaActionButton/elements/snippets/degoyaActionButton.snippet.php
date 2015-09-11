<?php 
// $resourceid holds the id of the resource where the snippet has been fired
$modx->log(modX::LOG_LEVEL_ERROR,'called from resource '.$resourceid);

// snippet always need to return success to the ajax to be successful
return 'success';