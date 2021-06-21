<template>
  <div>
      <h3>Sign In</h3>
      <div class="form-group">
        <label>Email address</label>
        <input v-model="email" type="email" class="form-control form-control-lg" />
      </div>
      <div class="form-group">
        <label>Password</label>
        <input v-model="password" type="password" class="form-control form-control-lg" />
      </div>
      <button @click="login()" type="submit" class="btn btn-dark btn-lg btn-block">
        Sign In
      </button>
      <p class="forgot-password text-right mt-2 mb-4">
        <router-link to="/forgot-password">Forgot password ?</router-link>
      </p>
  </div>
</template>


<script>
export default {
  data() {
    return {
      email: "",
      password: ""
    }
  },
  methods: {
    async login() {
      const res = await this.$store.dispatch("LOGIN", {
        email: this.email,
        password: this.password
      })
      this.ToAuction()
      console.log(res)
    },
    ToAuction() {
      this.$router.push({ name: "Auction" });
    },
  },
}
</script>