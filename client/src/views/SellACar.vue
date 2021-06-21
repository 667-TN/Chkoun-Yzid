<template>
  <div>
    <label for="first_name" class="grey-text">title</label>
    <input
      v-model="first_name"
      type="text"
      id="first_name"
      class="form-control"
    />
    <br />
    <label for="last_name" class="grey-text">location</label>
    <input
      v-model="last_name"
      type="text"
      id="last_name"
      class="form-control"
    />
    <br />
    <label for="email" class="grey-text">make</label>
    <input v-model="email" type="email" id="email" class="form-control" />
    <br />
    <label for="password" class="grey-text">model</label>
    <input
      v-model="password"
      type="password"
      id="password"
      class="form-control"
    />
    <br />
    <label for="email" class="grey-text">Vin</label>
    <input v-model="email" type="email" id="email" class="form-control" />
    <br />
    <label for="email" class="grey-text">mileage</label>
    <input v-model="email" type="email" id="email" class="form-control" />
    <br />
    <label for="email" class="grey-text">transimission</label>
    <input v-model="email" type="email" id="email" class="form-control" />
    <br />
    <label for="email" class="grey-text">description</label>
    <input v-model="email" type="email" id="email" class="form-control" />
    <div class="text-center mt-4">
      <button class="btn btn-unique">submit</button>
    </div>
    <form action="/action_page.php">
      <input type="file" id="myFile" name="filename" />
      <input type="submit" />
    </form>
  </div>
</template>