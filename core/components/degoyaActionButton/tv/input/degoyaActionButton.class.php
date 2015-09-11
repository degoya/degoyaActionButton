<?php
/*
 * DegoyaActionButtton custom TV - input setup
 *
 * @var modX $this->modx
 * @var modTemplateVar $this
 * 
 */
class DegoyaActionButtonInputRender extends modTemplateVarInputRender {
    public function process($value,array $params = array()) {
        $default = $this->tv->get('default_text');
        $id = $_REQUEST['id'];
        $this->setPlaceholder('default',$default);
        $this->setPlaceholder('id',$id);
    }
    public function getTemplate() {
        return $this->modx->getOption('core_path',null,MODX_CORE_PATH).'components/degoyaActionButton/tv/input/tpl/degoyaActionButton.tpl';
    }
}
return 'DegoyaActionButtonInputRender';