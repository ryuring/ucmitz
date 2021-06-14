<template>

    <div id="Page" class="bca-app">

        <header id="Header" class="bca-header">

            <div id="ToolBar" class="bca-toolbar">
                <div id="ToolbarInner" class="clearfix bca-toolbar__body">

                    <div class="bca-toolbar__logo">
                        <a href="/" class="bca-toolbar__logo-link">
                            <img src="/bc_admin_third/img/admin/logo_icon.svg" alt="" width="24" height="21"
                                 class="bca-toolbar__logo-symbol"/>
                            <span class="bca-toolbar__logo-text">baserCMS</span>
                        </a>
                    </div>

                    <div id="ToolMenu" class="bca-toolbar__tools">
                        <div class="bca-toolbar__tools-mode">
                        </div>
                    </div>O

                    <div id="UserMenu" class="bca-toolbar__users">
                        <ul class="clearfix" v-show="loginId">
                            <li>
                                <a href="javascript:void(0)" class="title">
                                    {{ loginName }}
                                    <img src="/bc_admin_third/img/admin/btn_dropdown.png" width="8" height="11"
                                         class="bc-btn" alt=""/>
                                </a>
                                <ul>
                                    <li>
                                        <router-link :to="{ path: 'user_edit' }">アカウント設定</router-link>
                                    </li>
                                    <li><a href="javascript:void(0)" @click="logout()">ログアウト</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
        </header>

        <div id="Wrap" class="bca-container">

            <main id="Contents" class="bca-main">

                <article id="ContentsBody" class="contents-body bca-main__body">

                    <div class="bca-main__header">
                        <h1 class="bca-main__header-title">{{ pageTitle }}</h1>
                    </div>

                    <div id="BcMessageBox">
                        <div id="BcSystemMessage" class="notice-message"></div>
                    </div>

                    <div class="bca-main__contents clearfix">
                        <router-view
                            v-if="mount"
                            :accessToken="accessToken"
                            @setLogin="setLogin"
                            @removeToken="removeToken"
                            @setTitle="setTitle"
                        >
                        </router-view>
                    </div>

                    <!-- / bca-main__body --></article>
                <!-- / .bca-main --></main>
            <!-- / #Wrap --></div>

        <div id="Footer" class="bca-footer" data-loggedin="">
            <div class="bca-footer__inner--full">
                <div class="bca-footer__main">
                    <div class="bca-footer__baser-version">baserCMS</div>
                    <ul class="bca-footer__banner">
                        <li class="bca-footer__banner__item"></li>
                        <li class="bca-footer__banner__item"></li>
                    </ul>
                </div>
                <div class="bca-footer__sub">
                    <div class="bca-footer__copyright">Copyright &copy; baserCMS Users Community All rights reserved.
                    </div>
                </div>
            </div>
        </div>

        <!-- / #Page --></div>

</template>

<script>
import axios from "axios";

export default {

    /**
     * Name
     */
    name: 'App',

    /**
     * Data
     * @returns {{loginId: null, pageTitle: string, loginName: null, accessToken: null, mount: boolean}}
     */
    data: function () {
        return {
            accessToken: null,
            mount: false,
            pageTitle: '　',
            loginId: null,
            loginName: null
        }
    },

    /**
     * Mounted
     */
    mounted() {
        if (this.accessToken || this.$route.path === '/') {
            this.mount = true
        }
        if (!localStorage.refreshToken) {
            if (this.$route.path !== '/') {
                this.$router.push('/');
            }
        } else {
            this.getToken(localStorage.refreshToken).then(() => {
                this.mount = true
                this.setUser(this.accessToken)
            });
        }
    },

    /**
     * Methods
     */
    methods: {

        /**
         * Set Title
         * @param title
         */
        setTitle: function(title) {
            this.pageTitle = title;
        },

        /**
         * Set Login
         * @param accessToken
         * @param refreshToken
         */
        setLogin: function (accessToken, refreshToken) {
            this.setToken(accessToken, refreshToken);
            this.setUser(accessToken);
        },

        /**
         * Set User
         * @param accessToken
         */
        setUser: function(accessToken) {
            axios.get('/baser/api/baser-core/users/view/1.json', {
                headers: {"Authorization": accessToken},
                data: {}
            }).then(function (response) {
                if (response.data.user) {
                    this.loginId = response.data.user.id;
                    this.loginName = response.data.user.name;
                }
            }.bind(this))
        },

        /**
         * Set Token
         * @param accessToken
         * @param refreshToken
         */
        setToken: function (accessToken, refreshToken) {
            this.accessToken = accessToken;
            localStorage.refreshToken = refreshToken;
        },

        /**
         * Get Token
         * @param refreshToken
         * @returns {Promise<void>}
         */
        getToken: async function (refreshToken) {
            await axios.get('/baser/api/baser-core/users/refresh_token.json', {
                headers: {"Authorization": refreshToken},
                data: {}
            }).then(function (response) {
                if (response.data) {
                    this.setToken(response.data.access_token, response.data.refresh_token);
                } else {
                    this.$router.push('/')
                }
            }.bind(this))
            .catch(function (error) {
                if (error.response.status === 401) {
                    localStorage.refreshToken = '';
                }
            });
        },

        /**
         * Remove Token
         */
        removeToken: function () {
            localStorage.refreshToken = null;
            this.accessToken = null;
        },

        /**
         * Logout
         */
        logout: function () {
            this.$emit('removeToken');
            this.$router.push('/');
        }

    }
}
</script>

<style>

</style>
