<template>
  <div>
    <label for="first_name" class="grey-text">Full-Name</label>
    <input
      v-model="first_name"
      type="text"
      id="first_name"
      class="form-control"
    />
    <br />
    <label for="last_name" class="grey-text">E-mail</label>
    <input
      v-model="last_name"
      type="text"
      id="last_name"
      class="form-control"
    />
    <br />
    <label for="email" class="grey-text">message</label>
    <input v-model="email" type="email" id="email" class="form-control" />
    <br />
    <b-button variant="success" @click="ToAuction()">Submit</b-button>
  </div>
</template>