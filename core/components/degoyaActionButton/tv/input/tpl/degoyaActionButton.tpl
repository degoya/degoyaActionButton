<span onclick="btnAction('{$id}','{$tv->get('value')|escape}')" id="tv-actionbutton-{$tv->id}" class="x-btn x-btn-small x-btn-icon-small-left x-btn-degoyaactionbutton x-btn-noicon" data-value="{$tv->get('value')|escape}" unselectable="on">{$buttonCaption}</span>

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
    function btnAction( resource, snippet) {
        Ext.Msg.confirm( _('degoyaActionButton.msg.confirm.title'),  _('degoyaActionButton.msg.confirm.copy'), function (id, value) {
                            if (id === 'yes') {
        Ext.Ajax.request({
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
                                    fn_WinExt(resultMessage, _('degoyaActionButton.ajax.success.title'));
                                },
                                  failure: function ( result, request ) {
                                   var jsonData = Ext.util.JSON.decode(result.responseText);
                                   var resultMessage = _('degoyaActionButton.ajax.error.msg',{ snippetname: jsonData.snippet,resource: jsonData.resource  })
                                   fn_WinExt(resultMessage, _('degoyaActionButton.ajax.error.title'));
                               }
                       }); 
}});
    }
Ext.onReady(function() {

});
{/literal}
// ]]>
</script>