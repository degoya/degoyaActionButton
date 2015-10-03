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
    ,items: [
    {
        xtype: 'modx-combo'
        ,id: 'inopt_selectSnippet{/literal}{$tv}{literal}'
        ,fieldLabel: '{/literal}{$degoyaActionButton.snippetTitle}{literal}'
        ,description: MODx.expandHelp ? '' : '{/literal}{$degoyaActionButton.snippetHelp}{literal}'
        ,name: 'inopt_selectSnippet'
        ,hiddenName: 'inopt_selectSnippet'
        ,emptyText: '{/literal}{$degoyaActionButton.snippetEmptyText}{literal}'+' ...'
        ,anchors: '98%'
        ,width: '99%'
        ,listWidth: 250
        ,value: params['selectSnippet'] || ''
        ,displayField: 'name'
        ,valueField: 'name'
        ,store: new Ext.data.JsonStore({
            url : '../assets/components/degoyaActionButton/controllers/degoyaActionButtonGetList.php'
            ,baseParams: {
                action : 'get/snippets'
            }
            ,fields: ['id','name']
            ,root: ''
            ,listeners: oc
        })
    },{
        xtype: MODx.expandHelp ? 'label' : 'hidden'
        ,forId: 'inopt_caption{/literal}{$tv}{literal}'
        ,html: '{/literal}{$degoyaActionButton.snippetHelp}{literal}'
        ,cls: 'desc-under'
    },
    {
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
        ,value: params['saveResource'] || 'false'
        ,anchors: '98%'
        ,width: '99%'
        ,listeners: oc
    }, {
        xtype: MODx.expandHelp ? 'label' : 'hidden',
        forId: 'inopt_saveResource{/literal}{$tv}{literal}',
        html: '{/literal}{$degoyaActionButton.saveHelp}{literal}',
        cls: 'desc-under'
    },{
        xtype: 'combo-boolean'
        ,fieldLabel: '{/literal}{$degoyaActionButton.confirmTitle}{literal}'
        ,description: MODx.expandHelp ? '' : '{/literal}{$degoyaActionButton.confirmHelp}{literal}'
        ,name: 'inopt_confirm'
        ,hiddenName: 'inopt_confirm'
        ,id: 'inopt_confirm{/literal}{$tv}{literal}'
        ,value: !(params['confirm'] == 0 || params['confirm'] == 'false')
        ,anchors: '98%'
        ,width: '99%'
        ,listeners: oc
    }, {
        xtype: MODx.expandHelp ? 'label' : 'hidden',
        forId: 'inopt_confirm{/literal}{$tv}{literal}',
        html: '{/literal}{$degoyaActionButton.confirmHelp}{literal}',
        cls: 'desc-under'
    },
    {
        xtype: 'combo-boolean'
        ,fieldLabel: '{/literal}{$degoyaActionButton.resultMsgTitle}{literal}'
        ,description: MODx.expandHelp ? '' : '{/literal}{$degoyaActionButton.resultMsgHelp}{literal}'
        ,name: 'inopt_resultMsg'
        ,hiddenName: 'inopt_resultMsg'
        ,id: 'inopt_resultMsg{/literal}{$tv}{literal}'
        ,value: !(params['resultMsg'] == 0 || params['resultMsg'] == 'false')
        ,anchors: '98%'
        ,width: '99%'
        ,listeners: oc
    }, {
        xtype: MODx.expandHelp ? 'label' : 'hidden',
        forId: 'inopt_resultMsg{/literal}{$tv}{literal}',
        html: '{/literal}{$degoyaActionButton.resultMsgHelp}{literal}',
        cls: 'desc-under'
    },

    ]
    ,renderTo: 'tv-input-properties-form{/literal}{$tv}{literal}'
});
// ]]>
</script>
{/literal}