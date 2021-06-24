<template>
    <user-form :access-token="accessToken"
        @set-message="function(message, isError) {$emit('set-message', message, isError)}"
        @clear-message="$emit('clear-message')" />
</template>

<script>

import UserForm from '../components/UserForm.vue'

export default {

    /**
     * Name
     */
    name: 'UserAdd',

    /**
     * Props
     */
    props: {
        accessToken: String
    },

    /**
     * Components
     */
    components: {
        UserForm
    },

    /**
     * Mounted
     */
    mounted() {
        this.$emit('setTitle', 'ユーザー登録')
        if (!this.accessToken) {
            this.$router.push('/')
        }
    },

}
</script>
