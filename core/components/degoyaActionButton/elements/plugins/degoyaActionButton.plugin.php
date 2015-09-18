<?php
/*
 * Handles plugin events for degoyaActionButton custom TV
 *
 * @package degoyaActionButton
 *
 */
$corePath = $modx->getOption('core_path',null,MODX_CORE_PATH).'components/degoyaActionButton/';
$modx->lexicon->load('degoyaActionButton:default');
switch ($modx->event->name) {
    case 'OnTVInputRenderList':
        $modx->controller->addLexiconTopic('degoyaActionButton:default');
        $modx->event->output($corePath.'tv/input/');
        break;
    case 'OnTVOutputRenderList':
        $modx->event->output($corePath.'tv/output/');
        break;
    case 'OnTVInputPropertiesList':
        $modx->event->output($corePath.'tv/inputoptions/');
        break;
    case 'OnTVOutputRenderPropertiesList':
        $modx->event->output($corePath.'tv/properties/');
        break;
}