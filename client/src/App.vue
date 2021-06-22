<template>
  <div id="material-kit">
    <div :class="{ 'nav-open': NavbarStore.showNavbar }">
      <router-view name="header" />
      <div>
        <router-view />
      </div>
      <router-view name="footer" />
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      query: ""
    }
  },
  computed: {
    isLoggedIn() {
      return this.$store.getters.isLoggedIn 
    }
  },
  methods: {
    async logout() {
      await this.$store.dispatch("LOGOUT")
    }
  },
  async beforeMount() {
    try {
      const res = await this.$store.dispatch("VERIFY_AUTH")
      console.log(res)
    }
    catch (error) {
      console.log(error)
    }
  },
}
</script>
