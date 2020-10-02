<template>
  <div class="adoptme">
    <div id="container">
      <div class="tabs">
        <button
          v-on:click="openTab(1)"
          v-bind:class="{'active':(activeTab == 1)}"
        ><h2>PROGRAMS</h2></button>
        <button
          v-on:click="openTab(2)"
          v-bind:class="{'active':(activeTab == 2)}"
        ><h2>ASSOCIATED COMPANIES</h2></button>
      </div>
      <div id="programs" v-if="activeTab == 1" class="tabcontent">
        <div class="article">
          <img src="..\assets\friend-in-trouble.png" />
          <div class="articletext">
            <h2>Behavior Program</h2>
            <p>Evaluation of each dog using specialists who determine the best training that will help you friend be a better family member.</p>
            <a class="box-button" href="#">
              <h3>READ MORE</h3>
            </a>
          </div>
        </div>
        <div class="article">
          <img src="..\assets\family.png" />
          <div class="articletext">
            <h2>My Next Family</h2>
            <p>Are you looking for a new family member? Then, this program is for you. Don’t buy, adopt here, and let’s give a home to this amazing friends.</p>
            <a class="box-button" href="#">
              <h3>READ MORE</h3>
            </a>
          </div>
        </div>
      </div>
      <div id="associated-companies" v-if="activeTab == 2" class="tabcontent">
        <div class="article">
          <img src="..\assets\base22.jpg" />
          <div class="articletext">
            <h2>Base22</h2>
            <p>Evaluation of each dog using specialists who determine the best training that will help you friend be a better family member.</p>
            <a class="box-button" href="https://base22.com/" target="_blank"><h3>LEARN MORE</h3></a>
          </div>
        </div>
        <div class="article">
          <img src="..\assets\techelevator.jpg" />
          <div class="articletext">
            <h2>Tech Elevator</h2>
            <p>This webpage brought to you in part by Tech Elevator, the country's newest premier coding bootcamp!</p>
            <a class="box-button" href="https://www.techelevator.com/" target="_blank">
              <h3>LEARN MORE</h3>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'adopt-me-tabbed-articles',
  data () {
    return {
      activeTab: 1
    }
  },
  methods: {
    openTab (number) {
      this.activeTab = number
    }
  }
}
</script>

<style lang="scss">
$color-red: #ef3e42;
$color-blue: #332982;
$color-gray: #777;
$adopt-me-font-primary: "Open Sans Condensed", sans-serif;
$adopt-me-font-secondary: "Lora", serif;
$adopt-me-font-tertiary: "Open Sans", sans-serif;
$font-weight-h1: 300;
$font-weight-h2: bold;
$font-weight-h3: bold;
.adoptme {
  h1 {
    color: white;
    font-size: 30px;
    font-family: $adopt-me-font-primary;
    font-weight: $font-weight-h1;
  }
  h2 {
    font-size: 20px;
    font-family: $adopt-me-font-primary;
    font-weight: $font-weight-h2;
  }
  h3 {
    font-size: 12px;
    font-family: $adopt-me-font-tertiary;
    font-weight: $font-weight-h3;
  }
  p {
    font-family: $adopt-me-font-secondary;
  }
}

#programs {
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
}

.article {
  text-align: left;
  display: flex;
  flex-direction: row;
  padding-bottom: 20px;
  img {
    width: 150px;
    height: 150px;
    object-fit: cover;
  }
  .articletext {
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
    padding-left: 10px;
    max-width: 500px;
    p {
      padding-bottom: 5px;
    }
    .box-button {
      color: $color-red;
      text-align: center;
      text-decoration: none;
      border-style: solid;
      padding: 3px;
      max-width: 100px;
    }
  }
}

.tabs {
  display: flex;
  flex-direction: row;
  justify-content: center;
  overflow: hidden;
  padding-top: 10px;
  padding-bottom: 10px;
  .active {
    color: $color-blue;
    border-bottom: solid 10px $color-blue;
  }
  button {
    margin-right: 20px;
    background-color: inherit;
    border: none;
    outline: none;
    cursor: pointer;
    transition: 0.3s;
  }
}

.tabcontent {
  padding-left: 10px;
  padding-right: 10px;
  animation: fadeEffect 1s;
}

@keyframes fadeEffect {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}
@media screen and (max-width: 400px) {
  .article {
    padding-bottom: 20px;
    img {
      width: 100px;
      height: 100px;
      object-fit: cover;
    }
    .articletext {
      padding-left: 10px;
      width: 100%;
      max-width: 500px;
      h2 {
        padding-bottom: 5px;
      }
    }
  }
}

@media screen and (min-width: 900px) {
  .adoptme {
    h1 {
      color: white;
      font-size: 40px;
      font-family: $adopt-me-font-primary;
      font-weight: $font-weight-h1;
    }
    h2 {
      font-size: 30px;
      font-family: $adopt-me-font-primary;
      font-weight: $font-weight-h2;
    }
    h3 {
      font-size: 15px;
      font-family: $adopt-me-font-tertiary;
      font-weight: $font-weight-h3;
    }
    p {
      font-family: $adopt-me-font-secondary;
    }
  }
}
</style>
