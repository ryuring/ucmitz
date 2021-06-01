<?php
namespace BcSample\View;
use Cake\View\View;

class AppView extends View
{
    public function initialize(): void
    {
        parent::initialize();
        $this->loadHelper('BaserCore.BcAdminForm', ['templates' => 'BaserCore.bc_form']);
        $this->loadHelper('BaserCore.BcBaser');
        $this->loadHelper('BaserCore.BcAuth');
        $this->loadHelper('BaserCore.BcAdmin');
        $this->loadHelper('BaserCore.BcUserManage');
        if (!$this->get('title')) {
            $this->set('title', 'Undefined');
        }
    }
}
