<template>
  <div>
      <div class="color-line">
      </div>
      <footer>
        <p>Website built by Kolton Nay. Deployed through Heroku.</p>
        <p>Technical Projects built in conjunction with many contributors. See my <a class="hoverable" href="https://Github.com/Gamerunner15" target="_blank">Github</a> for more details.</p>
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
$primary-color: #fef65b;
$secondary-color: rgb(150, 161, 161);
$tertiary-color: #519483;

footer {
    display: flex;
    flex-direction: row;
    justify-content: space-evenly;
    align-items: center;
    height: 100px;
    background-color: $dodie-yellow;
    color: $secondary-color;
    a {
      color: $secondary-color;
      font-family: Lora;
    }
}

.color-line {
  height: 25px;
  background-color: $secondary-color;
}
</style>