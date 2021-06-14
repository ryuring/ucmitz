<template>
    <div class="section">
        <table id="FormTable" class="form-table bca-form-table">
            <tbody>
            <tr>
                <th class="col-head bca-form-table__label"><label for="id">No</label></th>
                <td class="col-input bca-form-table__input">
                    1 <input type="hidden" name="id" class="bca-hidden__input" id="id" value="1"></td>
            </tr>
            <tr>
                <th class="col-head bca-form-table__label"><label for="name">アカウント名</label> &nbsp;<span
                    class="bca-label" data-bca-label-type="required">必須</span></th>
                <td class="col-input bca-form-table__input">
                    <span class="bca-textbox">
                        <input type="text" name="name" size="20" maxlength="255"
                               autofocus="autofocus" class="bca-textbox__input"
                               required="required" id="name" v-model="user.name"></span>
                </td>
            </tr>
            <tr>
                <th class="col-head bca-form-table__label"><label for="real-name-1">名前</label> &nbsp;<span
                    class="bca-label" data-bca-label-type="required">必須</span></th>
                <td class="col-input bca-form-table__input">
                    <small>[姓 ]</small> <span class="bca-textbox">
                        <input type="text" name="real_name_1" size="12"
                               maxlength="255" class="bca-textbox__input"
                               required="required"
                               id="real-name-1" v-model="user.real_name_1"></span>
                    <small>[名 ]</small> <span class="bca-textbox">
                        <input type="text" name="real_name_2" size="12"
                               maxlength="255" class="bca-textbox__input"
                               id="real-name-2" v-model="user.real_name_2"></span>
                </td>
            </tr>
            <tr>
                <th class="col-head bca-form-table__label"><label for="nickname">ニックネーム</label></th>
                <td class="col-input bca-form-table__input">
                    <span class="bca-textbox">
                        <input type="text" name="nickname" size="40" maxlength="255"
                               class="bca-textbox__input" id="nickname" v-model="user.nickname"></span>
                </td>
            </tr>
            <tr>
                <th class="col-head bca-form-table__label"><label>グループ</label> &nbsp;<span
                    class="bca-label" data-bca-label-type="required">必須</span></th>
                <td class="col-input bca-form-table__input">
                    <span class="bca-checkbox-group">
                        <span class="bca-checkbox">
                            <input type="checkbox" name="user_groups[_ids][]" value="1" id="user-groups-ids-1"
                                   class="bca-checkbox__input" v-model="userGroups">
                            <label class="bca-checkbox__label" for="user-groups-ids-1">システム管理</label>
                        </span>
                        <span class="bca-checkbox">
                            <input type="checkbox" name="user_groups[_ids][]" value="2" id="user-groups-ids-2"
                                   class="bca-checkbox__input" v-model="userGroups">
                            <label class="bca-checkbox__label" for="user-groups-ids-2">サイト運営</label>
                        </span>
                    </span>
                </td>
            </tr>
            <tr>
                <th class="col-head bca-form-table__label"><label for="email">Eメール</label> &nbsp;<span class="bca-label"
                                                                                                       data-bca-label-type="required">必須</span>
                </th>
                <td class="col-input bca-form-table__input">
                    <input type="text" name="dummy-email" style="top:-100px;left:-100px;position:fixed;">
                    <span class="bca-textbox">
                        <input type="text" name="email" size="40" maxlength="255"
                               class="bca-textbox__input" required="required"
                               id="email"
                               v-model="user.email">
                    </span>
                </td>
            </tr>
            <tr>
                <th class="col-head bca-form-table__label">
                    <label for="password-1">パスワード</label></th>
                <td class="col-input bca-form-table__input">
                    <small>
                        [パスワードは変更する場合のみ入力してください]</small><br>
                    <input type="password" name="dummy-pass" autocomplete="off"
                           style="top:-100px;left:-100px;position:fixed;">
                    <span class="bca-textbox">
                        <input type="password" name="password_1" size="20" maxlength="255"
                               autocomplete="off" class="bca-textbox__input"
                               id="password-1">
                    </span>
                    <span class="bca-textbox">
                        <input type="password" name="password_2" size="20" maxlength="255" autocomplete="off"
                               class="bca-textbox__input" id="password-2">
                    </span>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</template>

<script>

import axios from 'axios';

export default {

    /**
     * Name
     */
    name: 'Login',

    /**
     * Props
     */
    props: {
        accessToken: String
    },

    /**
     * Data
     * @returns {{users: null}}
     */
    data: function () {
        return {
            user: [],
            userGroups: []
        }
    },

    mounted() {
        this.$emit('setTitle', 'ユーザー編集')
        if (this.accessToken) {
            axios.get('/baser/api/baser-core/users/view/1.json', {
                headers: {"Authorization": this.accessToken},
                data: {}
            }).then(function (response) {
                if (response.data.user) {
                    this.user = response.data.user;
                    this.userGroups = [];
                    this.user.user_groups.forEach(function(v, i){
                        this.userGroups = v.id
                    }.bind(this));
                }
            }.bind(this))
        } else {
            this.$router.push('/')
        }
    }
}
</script>
