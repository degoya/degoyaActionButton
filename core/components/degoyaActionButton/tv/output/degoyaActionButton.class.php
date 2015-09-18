<?php
/*
 * degoyaActionButton custom TV - output setup
 *
 * @var modX $modx
 * @var array $params
 * @var string $value
 *
 */
 if(!class_exists('DegoyaActionButtonOutputRender')) {
	class DegoyaActionButtonOutputRender extends modTemplateVarOutputRender {
	    public function process($value,array $params = array()) {
	        if (empty($value)) return $value;
	        // process value here
	        return $value;
	    }
	}
}
return 'DegoyaActionButtonOutputRender';