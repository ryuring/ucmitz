<?php
/* SVN FILE: $Id$ */
/**
 * [ADMIN] ツールメニュー
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
?>

<div class="side-navi">
	<h2>ツールメニュー</h2>
	<ul>
		<li><?php $baser->link('スキーマファイル生成', array('controller' => 'tools', 'action' => 'write_schema')) ?></li>
		<li><?php $baser->link('スキーマファイル読込', array('controller' => 'tools', 'action' => 'load_schema')) ?></li>
	</ul>
</div>
