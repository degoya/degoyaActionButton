<?php
/*
 * degoyaActionButton custom TV - Input Options
 */  
$corePath = $modx->getOption('degoyaActionButton.core_path', null, $modx->getOption('core_path').'components/degoyaActionButton/');
return $modx->smarty->fetch($corePath.'tv/inputoptions/tpl/degoyaActionButton.tpl');