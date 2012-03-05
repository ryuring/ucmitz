<?php
/* SVN FILE: $Id$ */
/**
 * [MOBILE] レイアウト
 * 
 * PHP versions 5
 *
 * baserCMS :  Based Website Development Project <http://basercms.net>
 * Copyright 2008 - 2012, baserCMS Users Community <http://sites.google.com/site/baserusers/>
 *
 * @copyright		Copyright 2008 - 2012, baserCMS Users Community
 * @link			http://basercms.net baserCMS Project
 * @package			baser.views
 * @since			baserCMS v 0.1.0
 * @version			$Revision$
 * @modifiedby		$LastChangedBy$
 * @lastmodified	$Date$
 * @license			http://basercms.net/license/index.html
 */
?><cake:nocache><?php $mobile->header() ?></cake:nocache><?php $baser->xmlHeader() ?><?php $baser->docType() ?>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<?php $baser->charset() ?>
<?php $baser->title() ?>
<?php $baser->metaDescription() ?>
<?php $baser->metaKeywords() ?>
</head>
<body bgcolor="#FFFFFF" id="<?php $baser->contentsName() ?>">
<div style="color:#333333;margin:3px">
	<div style="display:-wap-marquee;text-align:center;background-color:#FF6600;"> <span style="color:white;"><?php echo $baser->siteConfig['name'] ?></span> </div>
	<center>
		<span style="color:#FF6600;">Let's baserCMS!</span>
	</center>
	<hr size="2" style="width:100%;height:1px;margin:2px 0;padding:0;color:#FF6600;background:#FF6600;border:2px solid #FF6600;" />
	<?php echo $content_for_layout; ?><br />
	<?php $baser->element('contents_navi') ?><br />
	<hr size="1" style="width:100%;height:1px;margin:2px 0;padding:0;color:#FF6600;background:#FF6600;border:1px solid #FF6600;" />
	<span style="color:#FF6600">◆ </span>
	<?php $baser->link('トップへ','/'.Configure::read('AgentSettings.mobile.alias').'/') ?>
	<hr size="1" style="width:100%;height:1px;margin:2px 0;padding:0;color:#FF6600;background:#FF6600;border:1px solid #FF6600;" />
	<center>
		<?php $baser->img('baser.power.gif', array('alt'=> 'baserCMS : Based Website Development Project', 'border'=> "0")); ?>
		<?php $baser->img('cake.power.gif', array('alt'=> 'CakePHP(tm) : Rapid Development Framework', 'border'=> "0")); ?>
		<font size="1">(C)baserCMS</font>
	</center>
</div>
<?php $baser->element('google_analytics') ?>
</body>
</html>