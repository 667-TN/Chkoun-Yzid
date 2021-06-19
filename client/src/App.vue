<template>
  <div>
    <!-- <div id="nav">
      <router-link to="/">Home</router-link> |
      <router-link to="/about">About</router-link>
    </div> -->
    <b-navbar type="dark" variant="dark">
      <b-navbar-nav>
        <b-nav-item to="/">Home</b-nav-item>
        <b-nav-item to="/Auction">Auction</b-nav-item>
        <b-nav-item to="/SellACar">SellACar</b-nav-item>
        <b-nav-item to="/About">About</b-nav-item>

        <!-- Navbar dropdowns -->

        <b-nav-item-dropdown text="User" right >
          <div v-if="!isLoggedIn">
            <b-dropdown-item to="/Login">Login</b-dropdown-item>
            <b-dropdown-item to="/SignUp">SignUp</b-dropdown-item>
          </div>
          <div v-else>
            <b-dropdown-item @click="logout()">Logout</b-dropdown-item>
          </div>
          <b-dropdown-item to="/WriteToUs">Write to Us</b-dropdown-item>
        </b-nav-item-dropdown>

        <b-form-input v-model="query" placeholder="Search"></b-form-input>
        <b-button>Button</b-button>
      </b-navbar-nav>
    </b-navbar>
    <router-view />
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
      const res = await this.$store.dispatch('VERIFY_AUTH')
      console.log(res)
    }
    catch (error) {
      console.log(error)
    }
  },
}
</script>

<style lang="scss">

</style>
