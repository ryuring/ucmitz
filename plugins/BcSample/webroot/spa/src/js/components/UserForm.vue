<template>
<section id="UserForm">

    <table id="FormTable" class="form-table bca-form-table">
        <tbody>
        <tr>
            <th class="col-head bca-form-table__label"><label for="id">No</label></th>
            <td class="col-input bca-form-table__input">
                {{user.id}}
            </td>
        </tr>
        <tr>
            <th class="col-head bca-form-table__label">
                <label for="name">アカウント名</label> &nbsp;
                <span class="bca-label" data-bca-label-type="required">必須</span>
            </th>
            <td class="col-input bca-form-table__input">
                <span class="bca-textbox">
                    <input type="text"
                        name="name"
                        size="20"
                        maxlength="255"
                        autofocus="autofocus"
                        class="bca-textbox__input"
                        required="required"
                        id="name" v-model="user.name">
                </span>
                <div class="error-wrap" v-if="errors.name">
                    <ul><li class="error-message" v-for="(message) in errors.name">{{message}}</li></ul>
                </div>
            </td>
        </tr>
        <tr>
            <th class="col-head bca-form-table__label">
                <label for="real-name-1">名前</label> &nbsp;
                <span class="bca-label" data-bca-label-type="required">必須</span>
            </th>
            <td class="col-input bca-form-table__input">
                <small>[姓]</small>
                <span class="bca-textbox">
                    <input type="text"
                        name="real_name_1"
                        size="12"
                        maxlength="255"
                        class="bca-textbox__input"
                       required="required"
                       id="real-name-1"
                       v-model="user.real_name_1">
                </span>
                <small>[名]</small>
                <span class="bca-textbox">
                    <input type="text"
                        name="real_name_2"
                        size="12"
                        maxlength="255"
                        class="bca-textbox__input"
                        id="real-name-2"
                        v-model="user.real_name_2">
                </span>
                <div class="error-wrap" v-if="errors.real_name_1">
                    <ul><li class="error-message" v-for="(message) in errors.real_name_1">{{message}}</li></ul>
                </div>
            </td>
        </tr>
        <tr>
            <th class="col-head bca-form-table__label">
                <label for="nickname">ニックネーム</label>
            </th>
            <td class="col-input bca-form-table__input">
                <span class="bca-textbox">
                    <input type="text"
                        name="nickname"
                        size="40"
                        maxlength="255"
                        class="bca-textbox__input"
                        id="nickname"
                        v-model="user.nickname">
                </span>
            </td>
        </tr>
        <tr>
            <th class="col-head bca-form-table__label">
                <label>グループ</label> &nbsp;
                <span class="bca-label" data-bca-label-type="required">必須</span>
            </th>
            <td class="col-input bca-form-table__input">
                <span class="bca-checkbox-group">
                    <input type="hidden" name="user_groups[_ids]" value=""/>
                    <span v-for="(title, id) in this.userGroups" class="bca-checkbox">
                        <input type="checkbox"
                            name="user_groups[_ids][]"
                            :value="id"
                            :id="'user-groups-ids-' + id"
                            class="bca-checkbox__input"
                            v-model="user.user_groups">
                        <label class="bca-checkbox__label" :for="'user-groups-ids-' + id">
                            {{ title }}
                        </label>
                    </span>
                </span>
                <div class="error-wrap" v-if="errors.user_groups">
                    <ul><li class="error-message" v-for="(message) in errors.user_groups">{{message}}</li></ul>
                </div>
            </td>
        </tr>
        <tr>
            <th class="col-head bca-form-table__label">
                <label for="email">Eメール</label> &nbsp;
                <span class="bca-label" data-bca-label-type="required">必須</span>
            </th>
            <td class="col-input bca-form-table__input">
                <input type="text" name="dummy-email" style="top:-100px;left:-100px;position:fixed;">
                <span class="bca-textbox">
                    <input type="text"
                        name="email"
                        size="40"
                        maxlength="255"
                        class="bca-textbox__input"
                        required="required"
                        id="email"
                        v-model="user.email">
                </span>
                <div class="error-wrap" v-if="errors.email">
                    <ul><li class="error-message" v-for="(message) in errors.email">{{message}}</li></ul>
                </div>
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
                    <input type="password"
                        name="password_1"
                        size="20"
                        maxlength="255"
                        autocomplete="off"
                        class="bca-textbox__input"
                        id="password-1"
                        v-model="user.password_1">
                </span>
                <span class="bca-textbox">
                    <input type="password"
                        name="password_2"
                        size="20"
                        maxlength="255"
                        autocomplete="off"
                        class="bca-textbox__input"
                        id="password-2"
                        v-model="user.password_2">
                </span>
                <div class="error-wrap" v-if="errors.password">
                    <ul><li class="error-message" v-for="(message) in errors.password">{{message}}</li></ul>
                </div>
            </td>
        </tr>
        </tbody>
    </table>

    <div class="submit section bca-actions">
        <div class="bca-actions__main">
            <button class="button bca-btn bca-actions__item"
                data-bca-btn-type="save"
                data-bca-btn-size="lg"
                data-bca-btn-width="lg"
                id="BtnSave"
                type="submit"
                @click="save(userId)">
                保存
            </button>
        </div>
    </div>

</section>
</template>

<script>

import axios from 'axios';

export default {

    /**
     * Name
     */
    name: 'UserForm',

    /**
     * Props
     */
    props: {
        userId : String,
        accessToken: String
    },

    /**
     * Data
     * @returns {{users: null}}
     */
    data: function () {
        return {
            user: [],
            userGroups: [],
            errors: []
        }
    },

    /**
     * Mounted
     */
    mounted() {
        if (this.accessToken) {
            axios.get('/baser/api/baser-core/user_groups/list.json', {
                headers: {"Authorization": this.accessToken}
            }).then(function (response) {
                if (response.data.userGroups) {
                    this.userGroups = response.data.userGroups;
                }
            }.bind(this))
        }
        this.load(this.userId)
    },

    methods: {
        load: function(id) {
            if(id) {
                axios.get('/baser/api/baser-core/users/view/' + id + '.json', {
                    headers: {"Authorization": this.accessToken}
                }).then(function (response) {
                    if (response.data.user) {
                        this.user = response.data.user;
                        let userGroups = [];
                        this.user.user_groups.forEach(function (userGroup) {
                            userGroups.push(userGroup.id)
                        }.bind(this));
                        this.user.user_groups = userGroups;
                    }
                }.bind(this))
            } else {
                this.user = {
                    name: '',
                    real_name_1: '',
                    real_name_2: '',
                    nickname: '',
                    user_groups: [1],
                    email: '',
                    password_1: '',
                    password_2: '',
                };
            }
        },

        /**
         * Save
         */
        save: function (id) {
            this.$emit('clear-message')
            this.errors = []
            let endPoint = '/baser/api/baser-core/users/'
            let user = {
                name: this.user.name,
                real_name_1: this.user.name,
                real_name_2: this.user.real_name_2,
                nickname: this.user.nickname,
                user_groups: {_ids: this.user.user_groups},
                email: this.user.email,
                password_1: this.user.password_1,
                password_2: this.user.password_2,
            };
            if(id) {
                endPoint += 'edit/' + id + '.json'
                user.id = id
            } else {
                endPoint += 'add.json';
            }
            axios.post(endPoint, user, {
                headers: {"Authorization": this.accessToken}
            }).then(function (response) {
                if (response.data) {
                    this.$emit('set-message', response.data.message, false)
                    if(!id) {
                        this.$router.push('/user_edit/' + response.data.user.id)
                    }
                }
            }.bind(this))
            .catch(function (error) {
                if(error.response.status === 400) {
                    this.$emit('set-message', error.response.data.message, true)
                    this.errors = error.response.data.errors
                }
            }.bind(this))
        }

    }

}
</script>
