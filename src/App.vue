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
$primary-color: #fef65b;
$secondary-color: rgb(150, 161, 161);
$tertiary-color: #31d1a9;
//FoxChat Styles
:root{
  --main-color: #095781;
  --secondary-color: #ffffff;
  --border-color: #00000027;
  --recieved-bubble-color: #0D81BF;
  --sent-bubble-color: #0CB07C;
  --chatbot-text-input-color: #495057;
  --close-button-color: rgb(236, 72, 43);
  --hover-color: #62c2e6;
  --background-color: #fafafa;
}

* {
  margin:0px;
}
h1, h2 {
  font-family: $primary-font;
}

p, li {
  font-family: $secondary-font;
  font-weight: 500;
}

a {
  text-decoration: none;
}
.no-scroll {
    position: sticky;
    top: 0;
}
.scroll{
    overflow:auto;
    background-color: var(--background-color);
}
</style>
