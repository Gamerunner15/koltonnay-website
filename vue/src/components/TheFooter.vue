<template>
  <div>
      <div class="purple-line">
      </div>
      <footer>
      </footer>
  </div>
</template>

<script>
export default {
    name: "the-footer"

}
</script>

<style lang="scss">
$dodie-yellow: #fef65b;
$teal: #5affd5;
$midnight-purple: #702670;
$primary-font: 'Cairo', sans-serif;
$secondary-font: 'Lora', serif;

footer {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    height: 100px;
    background-color: $dodie-yellow;
    color:$midnight-purple;
}

.purple-line {
  height: 25px;
  background-color: $midnight-purple;
}
</style>