<template>
  <div>
    <p class="h4 text-center mb-4">Sign up</p>
    <label for="first_name" class="grey-text">First Name</label>
    <input
      v-model="first_name"
      type="text"
      id="first_name"
      class="form-control"
    />
    <br />
    <label for="last_name" class="grey-text">Last Name</label>
    <input
      v-model="last_name"
      type="text"
      id="last_name"
      class="form-control"
    />
    <br />
    <label for="email" class="grey-text">Email</label>
    <input v-model="email" type="email" id="email" class="form-control" />
    <br />
    <label for="password" class="grey-text">Password</label>
    <input
      v-model="password"
      type="password"
      id="password"
      class="form-control"
    />
    <div class="text-center mt-4">
      <button class="btn btn-unique" @click="signup()">Register</button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      first_name: "",
      last_name: "",
      email: "",
      password: "",
      front_id_img: "hardcoded",
      back_id_img: "hardcoded",
    };
  },
  methods: {
    async signup() {
      console.log(this.$store)
      await this.$store.dispatch("SIGNUP", {
        first_name: this.first_name,
        last_name: this.last_name,
        email: this.email,
        password: this.password,
        front_id_img: this.front_id_img,
        back_id_img: this.back_id_img,
      });
    },
  },
};
</script>