<template>
  
</template>

<script>
import Form from "./Form";
import Table from "./Table";
import api from "@/apis/product";
export default {
  components: {
    Form,
    Table,
  },
  data() {
    return {
      show: false,
      products: [],
      productDefault: {
        name: null,
        price: null,
        description: null,
      },
      product: {},
      action: "create",
    };
  },
  async created() {
    await this.updateProducts();
  },
  methods: {
    async submit(product) {
      try {
        switch (this.action) {
          case "create":
            await api.create(product);
            break;
          case "update":
            await api.update(product._id, product);
            break;
          case "delete":
            await api.delete(product._id);
            break;
        }
        await this.updateProducts();
        this.show = false;
      } catch (err) {
        console.log({ err });
      }
    },
    async updateProducts() {
      try {
        let response = await api.read();
        this.products = response.data;
      } catch (err) {
        console.log({ err });
      }
    },
    async updateProduct(action, product) {
      this.action = action;
      this.product = product;
      this.show = !this.show;
    },
  },
};
</script>

<style lang="scss" scoped>
.products {
  margin: auto;
  max-width: 1000px;
}
.products > button {
  margin-top: 20px;
  margin-bottom: 20px;
  font-size: 18px;
}
</style>
