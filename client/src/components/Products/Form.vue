<template>

</template>

<script>
export default {
  props: ["action", "product"],
  computed: {
    title() {
      return this.action == "create" ? "Create new product" : "Update product";
    },
  },
  methods: {
    submit: function(evt) {
      evt.preventDefault();
      this.$emit("submit", this.product);
    },
    updateShow(evt) {
      if (evt.target == this.$refs.modal) {
        this.$emit("show");
      }
    },
  },
};
</script>

<style lang="scss" scoped>
.modal {
  //display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0, 0, 0); /* Fallback color */
  background-color: rgba(0, 0, 0, 0.2); /* Black w/ opacity */
}
.card {
  position: relative;
  z-index: 2;
  margin: auto;
  background-color: white;
  max-width: 800px;
  padding: 30px 20px;
  border-radius: 5px;
  box-shadow: 0px 4px 8px 0 rgba(0, 0, 0, 0.3);
  transition: 0.3s;
  &:hover {
    box-shadow: 0px 8px 8px 0 rgba(0, 0, 0, 0.3);
  }
}
.card .title {
  margin-bottom: 30px;
  text-align: center;
  font-size: 24px;
  font-weight: bold;
}
.card input {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  transition: 0.3s;
  &:focus {
    outline: none !important;
    border: 1px solid blue;
    box-shadow: 0 0 1px blue;
  }
}
.card .close {
  font-size: 1.5rem;
  cursor: pointer;
  position: absolute;
  top: 0;
  right: 0;
  margin: 5px 10px;
  padding: 5px;
  color: gainsboro;
  &:hover {
    color: grey;
  }
}
</style>
