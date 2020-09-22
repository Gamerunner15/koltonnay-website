<template>
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@400;700&family=Lora:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <router-view/>
</template>

<style lang="scss">
$dodie-yellow: #fef65b;
$teal: #5affd5;
$midnight-purple: #702670;
$primary-font: 'Cairo', sans-serif;
$secondary-font: 'Lora', serif;

* {
  margin:0px;
}
h1, h2 {
  font-family: $primary-font;
}

p {
  font-family: $secondary-font;
}

a {
  text-decoration: none;
}


</style>
