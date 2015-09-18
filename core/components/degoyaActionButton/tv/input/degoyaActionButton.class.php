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
        if ($this->tv->get('value')!='') {
            $value = $this->tv->get('value');
        } else {
            $value = $this->tv->get('default_text');
        }
        
        
        $id = $_REQUEST['id'];
        $this->setPlaceholder('value',$value);
        $this->setPlaceholder('id',$id);
        $this->modx->lexicon->load('degoyaActionButton');
        $captionLexicon = $this->modx->lexicon('degoyaActionButton.btn.caption',array('snippetname' => $value));
        $caption = !empty($params['caption']) ? $params['caption'] : $captionLexicon;
        $this->setPlaceholder('buttonCaption',$caption);

    }
    public function getTemplate() {
    	$this->modx->lexicon->load('degoyaActionButton');
        return $this->modx->getOption('core_path',null,MODX_CORE_PATH).'components/degoyaActionButton/tv/input/tpl/degoyaActionButton.tpl';
    }
}
return 'DegoyaActionButtonInputRender';