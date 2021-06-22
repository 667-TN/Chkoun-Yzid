<template> 
<div>
 <div>
     
  <b-card
    :title="car.car_name"
    :img-src="car.url"
    img-alt="Image"
    img-top
    tag="article"
    style="max-width: 20rem;"
    class="mb-2"
  >
    <b-card-text>
    {{car.description}}
    </b-card-text>
      <b-card-text>
    {{car.car_price}}
    </b-card-text>
     <b-card-text>
    {{car.location}} , GEARBOX: {{car.transimission}} 
    </b-card-text>

  </b-card>
  </div>
 </div>
 
</template>



<script>

export default {
  props: ["car"]
}
</script>

