<span onclick="btnAction('{$id}','{$value}','{$saveResource}','{$confirm}','{$resultMsg}')" id="tv-actionbutton-{$tv->id}" class="x-btn x-btn-small x-btn-icon-small-left x-btn-degoyaactionbutton x-btn-noicon" data-value="{$value}" unselectable="on">{$buttonCaption}</span>

<script type="text/javascript">
// <![CDATA[
{literal}
    function fn_WinExt( message, title ){
      Ext.Msg.show({
        title: title,
        msg: message ,
        buttons: Ext.MessageBox.OK,
        icon: Ext.MessageBox.INFO
      });
    }

    function doAction (resource, snippet, saveresource, resultMsg) {

          if (saveresource == 1) {
            var p = Ext.getCmp('modx-panel-resource');
            p.baseParams.action = 'resource/update';
            if (ContentBlocks.getData()){
              p.baseParams['contentblocks'] = ContentBlocks.getData();
            }
            //this.getForm().getValues()
            //console.log('btnEvent:',p);
            p.getForm().submit();
          }

          Ext.Ajax.request( {
              url : '../assets/components/degoyaActionButton/controllers/degoyaActionButtonController.php',
              method: 'POST',
              params :{resource:resource,snippet:snippet},
              success: function ( result, request ) {
                var jsonData = Ext.util.JSON.decode(result.responseText);
                if (jsonData.msg=='1') {
                  var resultMessage = _('degoyaActionButton.ajax.success.msg',{ snippetname: jsonData.snippet,resource: jsonData.resource  })
                } else {
                  var resultMessage = _('degoyaActionButton.ajax.error.msg.snippet',{ snippetname: jsonData.snippet,resource: jsonData.resource  })
                }
                if (resultMsg == 1) {
                  fn_WinExt(resultMessage, _('degoyaActionButton.ajax.success.title'));
                }
            },
              failure: function ( result, request ) {
               var jsonData = Ext.util.JSON.decode(result.responseText);
               var resultMessage = _('degoyaActionButton.ajax.error.msg',{ snippetname: jsonData.snippet,resource: jsonData.resource  })
               if (resultMsg == 1) {
                fn_WinExt(resultMessage, _('degoyaActionButton.ajax.error.title'));
               }
            }
          });
    }

    function btnAction( resource, snippet, saveresource, confirm, resultMsg) {
      if (confirm == 1) {
        Ext.Msg.confirm( _('degoyaActionButton.msg.confirm.title'),  _('degoyaActionButton.msg.confirm.copy'), function (id, value) {
          if (id === 'yes') {
           doAction (resource, snippet, saveresource, resultMsg);
          }
        });
      } else {
        doAction (resource, snippet, saveresource, resultMsg);
      }
    }
Ext.onReady(function() {

});
{/literal}
// ]]>
</script>