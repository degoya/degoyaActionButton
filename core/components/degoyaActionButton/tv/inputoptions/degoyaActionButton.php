<?php
/*
 * degoyaActionButton custom TV - Input Options
 */
$corePath = $modx->getOption('degoyaActionButton.core_path', null, $modx->getOption('core_path').'components/degoyaActionButton/');
$lang = $modx->lexicon->fetch('degoyaActionButton.', true);
$modx->controller->setPlaceholder('degoyaActionButton', $lang);
return $modx->smarty->fetch($corePath.'tv/inputoptions/tpl/degoyaActionButton.tpl');