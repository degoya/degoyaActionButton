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
        if ($this->tv->get('selectSnippet')!='') {
            $value = $this->tv->get('selectSnippet');
        } else {
            $value = $this->tv->get('default_text');
        }
        $value = $params['selectSnippet'];
        $id = $_REQUEST['id'];
        $this->setPlaceholder('value',$value);
        $this->setPlaceholder('id',$id);
        $this->setPlaceholder('saveResource',$params['saveResource']);
        $this->setPlaceholder('confirm',$params['confirm']);
        $this->setPlaceholder('resultMsg',$params['resultMsg']);
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