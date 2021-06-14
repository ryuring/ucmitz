<template>
    <div>
        <p>ユーザー一覧</p>
        <div>{{ users }}</div>
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
            users: null,
        }
    },

    /**
     * Mounted
     */
    mounted() {
        this.$emit('setTitle', 'ユーザー一覧')
        if(this.accessToken) {
            this.getUsers();
        } else {
            this.$router.push('/')
        }
    },

    /**
     * Methods
     */
    methods: {

        /**
         * Get Users
         */
        getUsers: function() {
            axios.get('/baser/api/baser-core/users/index.json', {
                headers: {"Authorization": this.accessToken},
                data: {}
            }).then(function (response) {
                if (response.data) {
                    this.users = response.data.users;
                } else {
                    this.$router.push('/')
                }
            }.bind(this));
        }
    }
}
</script>

