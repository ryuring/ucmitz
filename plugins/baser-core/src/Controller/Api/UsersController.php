<?php
/**
 * baserCMS :  Based Website Development Project <https://basercms.net>
 * Copyright (c) baserCMS User Community <https://basercms.net/community/>
 *
 * @copyright     Copyright (c) baserCMS User Community
 * @link          https://basercms.net baserCMS Project
 * @since         5.0.0
 * @license       http://basercms.net/license/index.html MIT License
 */

namespace BaserCore\Controller\Api;

use BaserCore\Service\UsersServiceInterface;
use Cake\Core\Configure;
use Cake\Core\Exception\Exception;
use Firebase\JWT\JWT;
use BaserCore\Annotation\UnitTest;
use BaserCore\Annotation\NoTodo;
use BaserCore\Annotation\Checked;

/**
 * Class UsersController
 *
 * https://localhost/baser/api/baser-core/users/action_name.json で呼び出す
 *
 * @package BaserCore\Controller\Api
 */
class UsersController extends BcApiController
{

    /**
     * ログイン
     */
    public function login()
    {
        $result = $this->Authentication->getResult();
        if ($result->isValid()) {
            $user = $result->getData();
            $payload = [
                'iss' => Configure::read('Jwt.iss'),
                'sub' => $user->id,
                'exp' => time() + Configure::read('Jwt.expire'),
            ];
            $json = [
                'token' => JWT::encode($payload, file_get_contents(Configure::read('Jwt.privateKeyPath')), Configure::read('Jwt.algorithm')),
            ];
        } else {
            $this->response = $this->response->withStatus(401);
            $json = [];
        }
        $this->set(compact('json'));
        $this->viewBuilder()->setOption('serialize', 'json');
    }

    /**
     * リフレッシュトークン取得
     */
    public function refresh_token()
    {
        $result = $this->Authentication->getResult();
        $user = $result->getData();
        $payload = [
            'iss' => Configure::read('Jwt.iss'),
            'sub' => $user->id,
            'exp' => time() + Configure::read('Jwt.expire'),
        ];
        $json = [
            'token' => JWT::encode($payload, file_get_contents(Configure::read('Jwt.privateKeyPath')), Configure::read('Jwt.algorithm')),
        ];
        $this->set(compact('json'));
        $this->viewBuilder()->setOption('serialize', 'json');
    }

    /**
     * ユーザー情報一覧取得
     * @param UsersServiceInterface $users
     * @checked
     * @noTodo
     * @unitTest
     */
    public function index(UsersServiceInterface $users)
    {
        $this->set([
            'users' => $this->paginate($users->getIndex($this->request->getQueryParams()))
        ]);
        $this->viewBuilder()->setOption('serialize', ['users']);
    }

    /**
     * ユーザー情報取得
     * @param UsersServiceInterface $users
     * @param $id
     * @checked
     * @noTodo
     * @unitTest
     */
    public function view(UsersServiceInterface $users, $id)
    {
        $this->set([
            'user' => $users->get($id)
        ]);
        $this->viewBuilder()->setOption('serialize', ['user']);
    }

    /**
     * ユーザー情報登録
     * @param UsersServiceInterface $users
     * @checked
     * @noTodo
     * @unitTest
     */
    public function add(UsersServiceInterface $users)
    {
        $this->request->allowMethod(['post', 'delete']);
        if ($user = $users->create($this->request->getData())) {
            $message = __d('baser', 'ユーザー「{0}」を追加しました。', $user->name);
        } else {
            $message = __d('baser', '入力エラーです。内容を修正してください。');
        }
        $this->set([
            'message' => $message,
            'user' => $user
        ]);
        $this->viewBuilder()->setOption('serialize', ['message', 'user']);
    }

    /**
     * ユーザー情報編集
     * @param UsersServiceInterface $users
     * @param $id
     * @checked
     * @noTodo
     * @unitTest
     */
    public function edit(UsersServiceInterface $users, $id)
    {
        $this->request->allowMethod(['post', 'put']);
        $user = $users->get($id);
        if ($user = $users->update($user, $this->request->getData())) {
            $message = __d('baser', 'ユーザー「{0}」を更新しました。', $user->name);
        } else {
            $message = __d('baser', '入力エラーです。内容を修正してください。');
        }
        $this->set([
            'message' => $message,
            'user' => $user
        ]);
        $this->viewBuilder()->setOption('serialize', ['user', 'message']);
    }

    /**
     * ユーザー情報削除
     * @param UsersServiceInterface $users
     * @param $id
     * @checked
     * @noTodo
     * @unitTest
     */
    public function delete(UsersServiceInterface $users, $id)
    {
        $this->request->allowMethod(['post', 'delete']);
        $user = $users->get($id);
        try {
            if ($users->delete($id)) {
                $message = __d('baser', 'ユーザー: {0} を削除しました。', $user->name);
            }
        } catch (Exception $e) {
            $message = __d('baser', 'データベース処理中にエラーが発生しました。') . $e->getMessage();
        }
        $this->set([
            'message' => $message,
            'user' => $user
        ]);
        $this->viewBuilder()->setOption('serialize', ['user', 'message']);
    }

}
