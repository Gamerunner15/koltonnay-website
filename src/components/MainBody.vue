<template>
  <div id="full-body">
    <div class="grid-container">
      <div class="top-left">
        <a href="https://LinkedIn.com/in/koltonnay" target="_blank"
          ><i class="fa fa-linkedin-square hoverable"></i
        ></a>
      </div>
      <div class="middle-left">
        <a href="https://Github.com/Gamerunner15" target="_blank"
          ><i class="fa fa-github hoverable"></i
        ></a>
      </div>
      <div class="bottom-left">
        <a href="..\assets\Resume.pdf" download
          ><i class="fa fa-file hoverable"></i
        ></a>
      </div>
      <div class="image-div">
        <img class="main-image" src="..\assets\MainPicture.jpg" />
      </div>
      <div class="top-right">
        <a href="https://twitter.com/Gamerunner15" target="_blank"
          ><i class="fa fa-twitter hoverable"></i
        ></a>
      </div>
      <div class="middle-right">
        <a href="https://www.instagram.com/gamerunner15/" target="_blank"
          ><i class="fa fa-instagram hoverable"></i
        ></a>
      </div>
      <div class="bottom-right">
        <a href="#/about"><i class="fa fa-info-circle hoverable"></i></a>
      </div>
    </div>
    <div class="mobile-image-div">
      <img class="mobile-main-image" src="..\assets\MainPicture.jpg" />
    </div>
    <div class="mobile-grid-container">
      <div class="top-left">
        <a href="https://LinkedIn.com/in/koltonnay" target="_blank"
          ><i class="fa fa-linkedin-square hoverable"></i
        ></a>
      </div>
      <div class="middle-left">
        <a href="https://Github.com/Gamerunner15" target="_blank"
          ><i class="fa fa-github hoverable"></i
        ></a>
      </div>
      <div class="bottom-left">
        <a href="..\assets\Resume.pdf" download
          ><i class="fa fa-file hoverable"></i
        ></a>
      </div>
      <div class="top-right">
        <a href="https://twitter.com/Gamerunner15" target="_blank"
          ><i class="fa fa-twitter hoverable"></i
        ></a>
      </div>
      <div class="middle-right">
        <a href="https://www.instagram.com/gamerunner15/" target="_blank"
          ><i class="fa fa-instagram hoverable"></i
        ></a>
      </div>
      <div class="bottom-right">
        <a href="#/about"><i class="fa fa-info-circle hoverable"></i></a>
      </div>
    </div>
    
  </div>
</template>

<script>
export default {
  name: "main-body",
};
</script>

<style lang="scss">
$dodie-yellow: #fef65b;
$midnight-purple: #702670;
$primary-font: "Cairo", sans-serif;
$secondary-font: "Lora", serif;
$primary-color: #fef65b;
$secondary-color: rgb(150, 161, 161);
$tertiary-color: #519483;

.grid-container {
  width: 90%;
  display: grid;
  margin-top: 50px;
  margin-bottom: 50px;
  margin-left: 5%;
  margin-right: 5%;
  grid-template-columns: 10% 10% 53.5% 10% 10%;
  grid-template-rows: 33% 33% 33%;
  align-items: center;
  justify-items: center;
  grid-column-gap: 20px;
  i {
    font-size: 120px;
    background-color: $primary-color;
    border: 25px solid $primary-color;
    border-radius: 50px;
  }
}

.image-div {
  grid-row: 1 / span 3;
  grid-column: 3 / 4;
}
.main-image {
  border-radius: 50%;
  border: 3px solid $primary-color;
  box-shadow: 5px 15px 25px rgba(0, 0, 0, 0.25);
  max-width: 100%;
  height: auto;
}

.top-left {
  grid-row: 1 / 2;
  grid-column: 1 / 2;
}

.middle-left {
  grid-row: 2 / 3;
  grid-column: 2 / 3;
}

.bottom-left {
  grid-row: 3 / span 1;
  grid-column: 1 / 2;
}

.top-right {
  grid-row: 1 / 2;
  grid-column: 5 / span 1;
}

.middle-right {
  grid-row: 2 / 3;
  grid-column: 4 / 5;
}

.bottom-right {
  grid-row: 3 / span 1;
  grid-column: 5 / span 1;
}


@media screen and (max-width: 1000px) and (min-width: 426px) {
  .main-image {
  border-radius: 50%;
  border: 3px solid $primary-color;
  box-shadow: 5px 15px 25px rgba(0, 0, 0, 0.25);
  max-width: 80%;
  height: auto;
}
.grid-container {
  width: 90%;
  display: grid;
  margin-top: 50px;
  margin-bottom: 50px;
  margin-left: 5%;
  margin-right: 5%;
  grid-template-columns: 10% 10% 53.5% 10% 10%;
  grid-template-rows: 33% 33% 33%;
  align-items: center;
  justify-items: center;
  grid-column-gap: 10px;
  i {
    font-size: 80px;
    background-color: $primary-color;
    border: 20px solid $primary-color;
    border-radius: 50px;
  }
}
.image-div {
    display: flex;
    flex-direction: row;
    justify-content: center;
  }
}



@media screen and (max-width: 700px) {
  .grid-container {
    display: none;
  }
  .image-div {
    display: none;
  }
  .mobile-image-div {
    margin-top: 20px;
    display: flex;
    flex-direction: row;
    justify-content: center;
  }
  .mobile-main-image {
    border-radius: 50%;
    border: 3px solid $primary-color;
    box-shadow: 5px 15px 25px rgba(0, 0, 0, 0.25);
    width: 60%;
    height: auto;
  }
  .mobile-grid-container {
    width: 90%;
    margin-right: 0px;
    margin-left: 20px;
    margin-top: -30px;
    margin-bottom: 40px;
    display: grid;
    grid-template-columns: 25% 25% 25% 25%;
    grid-template-rows: 33% 33% 33%;
    align-items: center;
    justify-items: center;
    grid-column-gap: 0px;
    grid-row-gap: 0px;
    i {
      font-size: 45px;
      background-color: $primary-color;
      border: 15px solid $primary-color;
      border-radius: 50px;
    }
    .top-left {
      grid-row: 1;
      grid-column: 1;
    }

    .middle-left {
      grid-row: 2;
      grid-column: 2;
      padding-right: 30px;
    }

    .bottom-left {
      grid-row: 3;
      grid-column: 1;
    }

    .top-right {
      grid-row: 1;
      grid-column: 4;
    }

    .middle-right {
      grid-row: 2;
      grid-column: 3;
      padding-left: 30px;
    }

    .bottom-right {
      grid-row: 3;
      grid-column: 4;
    }
  }
}
@media screen and (min-width: 701px) {
  .mobile-grid-container {
    display: none;
  }
  .mobile-main-image {
    display: none;
  }
}
</style>