<?php
/*
 * degoyaTag custom TV - Input Options
 */  
$corePath = $modx->getOption('degoyaTag.core_path', null, $modx->getOption('core_path').'components/degoyaTag/');
return $modx->smarty->fetch($corePath.'tv/inputoptions/tpl/degoyaTag.tpl');