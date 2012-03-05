<?php
/* SVN FILE: $Id$ */
/**
 * [ADMIN] アクセス制限管理（ポップアップ）
 *
 * PHP versions 4 and 5
 *
 * baserCMS :  Based Website Development Project <http://basercms.net>
 * Copyright 2008 - 2012, baserCMS Users Community <http://sites.google.com/site/baserusers/>
 *
 * @copyright		Copyright 2008 - 2012, baserCMS Users Community
 * @link			http://basercms.net baserCMS Project
 * @package			baser.views
 * @since			baserCMS v 1.7.0
 * @version			$Revision$
 * @modifiedby		$LastChangedBy$
 * @lastmodified	$Date$
 * @license			http://basercms.net/license/index.html
 */
?>
<script type="text/javascript">
$(function(){
		
	$("#BtnMenuPermission").click(function(){
		var y = $(this).position().top;
		var x = $(this).position().left-500;
		
		$("#PermissionDialog").dialog('option', 'position', [x, y]);
		$('#PermissionDialog').dialog('open');
		return false;
	});
/**
 * バリデーション
 */
	$("#PermissionAjaxAddForm").validate();
	$("#PermissionAjaxAddForm").submit(function(){return false});
/**
 * ダイアログを初期化
 */
	$("#PermissionDialog").dialog({
		bgiframe: true,
		autoOpen: false,
		position: [250, 150],
		width: 'auto',
		modal: true,
		open: function(event, ui){
			$("#PermissionName").val($("#CurrentPageName").html());
			$("#PermissionUrl").val($("#CurrentPageUrl").html().replace($("#PermissionAdmin").html(), ''));
			$("#PermissionAjaxAddForm").submit();
		},
		close: function() {
			$("#PermissionName").val('');
			$("#PermissionUrl").val('');
		},
		buttons: {
			'キャンセル': function() {
				$(this).dialog('close');
			},
			'保存': function() {
				
				$("#PermissionAjaxAddForm").submit();
				if($("#PermissionAjaxAddForm").valid()) {
					$("#PermissionAjaxAddForm").ajaxSubmit({
						beforeSend: function() {
							$("#Waiting").show();
						},
						success: function(response, status) {
							if(response) {
								$("#PermissionDialog").dialog('close');
							} else {
								alert('保存に失敗しました。');
							}
						},
						error: function() {
							alert('保存に失敗しました。');
						},
						complete: function(){
							$("#Waiting").hide();
						}
					});
				}
			}
		}

	});
});
</script>


<div id="PermissionDialog" title="アクセス制限登録">
	<?php echo $formEx->create('Permission', array('action' => 'ajax_add', 'url' => array('plugin' => null))) ?>
	<?php echo $formEx->input('Permission.id') ?>
	<dl>
		<dt><?php echo $formEx->label('Permission.user_group_id', 'ユーザーグループ') ?></dt>
		<dd class="col-input">
			<?php echo $formEx->input('Permission.user_group_id', array('type' => 'select', 'options' => $formEx->getControlSource('Permission.user_group_id'))) ?>
		</dd>
		<dt><h4><?php echo $formEx->label('Permission.name', 'ルール名') ?></h4></dt>
		<dd><?php echo $formEx->input('Permission.name', array('type' => 'text', 'size' => 30, 'class' => 'required')) ?></dd>
		<dt><?php echo $formEx->label('Permission.url', 'URL設定') ?></dt>
		<dd><strong id="PermissionAdmin">/<?php echo Configure::read('Routing.admin') ?>/</strong><?php echo $formEx->input('Permission.url', array('type' => 'text', 'size' => 30, 'class' => 'required')) ?></dd>
		<dt><?php echo $formEx->label('Permission.auth', 'アクセス') ?></dt>
		<dd>
			<?php echo $formEx->input('Permission.auth', array(
				'type'		=> 'radio',
				'options'	=> $formEx->getControlSource('Permission.auth'),
				'legend'	=> false,
				'value'		=> 0,
				'separator'	=> '　')) ?>
			<?php echo $formEx->error('Permission.auth') ?>
		</dd>
	</dl>
	<?php echo $formEx->end() ?>
</div>