<div id="tv-input-properties-form{$tv}"></div>
{literal}

<script type="text/javascript">
// <![CDATA[
var params = {
{/literal}{foreach from=$params key=k item=v name='p'}
 '{$k}': '{$v|escape:"javascript"}'{if NOT $smarty.foreach.p.last},{/if}
{/foreach}{literal}
};
var oc = {'change':{fn:function(){Ext.getCmp('modx-panel-tv').markDirty();},scope:this}};
MODx.load({
     xtype: 'panel'
    ,layout: 'form'
    ,autoHeight: true
    ,cls: 'form-with-labels'
    ,labelAlign: 'top'
    ,border: false
    ,items: [{
        xtype: 'textfield'
        ,fieldLabel: '{/literal}{$degoyaActionButton.btnCaptionTitle}{literal}'
        ,description: MODx.expandHelp ? '' : '{/literal}{$degoyaActionButton.btnCaptionHelp}{literal}'
        ,name: 'inopt_caption'
        ,id: 'inopt_caption{/literal}{$tv}{literal}'
        ,value: params['caption'] || ''
        ,width: '99%'
        ,listeners: oc
    },{
        xtype: MODx.expandHelp ? 'label' : 'hidden'
        ,forId: 'inopt_caption{/literal}{$tv}{literal}'
        ,html: '{/literal}{$degoyaActionButton.btnCaptionHelp}{literal}'
        ,cls: 'desc-under'
    },{
        xtype: 'combo-boolean'
        ,fieldLabel: '{/literal}{$degoyaActionButton.saveTitle}{literal}'
        ,description: MODx.expandHelp ? '' : '{/literal}{$degoyaActionButton.saveHelp}{literal}'
        ,name: 'inopt_saveResource'
        ,hiddenName: 'inopt_saveResource'
        ,id: 'inopt_saveResource{/literal}{$tv}{literal}'
        ,value: !(params['saveResource'] == 0 || params['saveResource'] == 'false')
        ,anchors: '98%'
        ,width: '99%'
        ,listeners: oc
    }, {
        xtype: MODx.expandHelp ? 'label' : 'hidden',
        forId: 'inopt_saveResource{/literal}{$tv}{literal}',
        html: '{/literal}{$degoyaActionButton.saveHelp}{literal}',
        cls: 'desc-under'
    }]
    ,renderTo: 'tv-input-properties-form{/literal}{$tv}{literal}'
});
// ]]>
</script>
{/literal}