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

        <b-nav-item-dropdown text="User" right>
          <b-dropdown-item to="/SignIn">signIn</b-dropdown-item>
          <b-dropdown-item to="/SignUp">SignUp</b-dropdown-item>
          <b-dropdown-item to="/WriteToUs">Write to Us</b-dropdown-item>
        </b-nav-item-dropdown>
        <b-form-input v-model="text" placeholder="Search"></b-form-input>
        <b-button>Button</b-button>
      </b-navbar-nav>
    </b-navbar>
    <router-view />
  </div>
</template>

<style lang="scss">

</style>
