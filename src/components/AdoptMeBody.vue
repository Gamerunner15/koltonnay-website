<template>
  <div class="adoptme">
    <div id="banner">
      <div id="banner-text">
        <h1>This is your new family!</h1>
        <a id="adopt-now" class="box-button" href="/adopt/"><h3>ADOPT NOW</h3></a>
      </div>
    </div>
    <div class="body-row">
      <div id="volunteers">
        <h1 class="subsection-title" id="volunteer-title">VOLUNTEERS</h1>
        <img id="girl" src="../assets/girl.png" />
        <p id="text-one">Amazing people, making the difference every single day. Join us now and be part of a community that is changing the world.</p>
        <a id="join-us" class="box-button" href="#"><h3>JOIN US</h3></a>
      </div>
      <div id="testimonial">
        <h1 class="subsection-title" id="testimonial-title">TESTIMONIAL OF THE MONTH</h1>
        <div class="video">
          <iframe class="responsive-iframe" width="560" height="315" v-bind:src="tesimonialOfTheMonth" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>
      </div>
    </div>
    <div class="body-row-2">
      <adopt-me-tabbed-articles id="tabs" />
      <div id="friend">
        <img src="..\assets\cute-puppy-small.jpg" />
      </div>
    </div>
  </div>
</template>

<script>
import AdoptMeTabbedArticles from '@/components/AdoptMeTabbedArticles'
import testimonialService from '@/services/TestimonialService.js'

export default {
  name: 'adopt-me-body',
  components: {
    AdoptMeTabbedArticles
  },
  data () {
    return {
      tesimonialOfTheMonth: 'https://www.youtube.com/embed/jLGYZAur3y4'
    }
  },
  created () {
    this.tesimonialOfTheMonth = testimonialService.getTestimonial()
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

#banner {
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
  background-image: url("../assets/dogs.jpg");
  background-size: cover;
  background-position: center;
  width: 100%;
  height: 200px;
}
#banner-text {
  background-color: rgba(0, 0, 0, 0.5);
  color: white;
  display: flex;
  flex-direction: column;
  padding-top: 5px;
  padding-left: 20px;
  padding-bottom: 10px;
  .box-button {
    color: white;
  }
}
.box-button {
  text-align: center;
  text-decoration: none;
  border-style: solid;
  padding: 3px;
  max-width: 100px;
}

.body-row {
  margin-top: 20px;
  margin-bottom: 20px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.body-row-2 {
  margin-top: 20px;
  margin-bottom: 20px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

#volunteers {
  flex: 1;
  display: flex;
  flex-direction: column;
  margin-right: 10px;
  margin-left: 10px;
  padding-bottom: 15px;
  box-shadow: 5px 15px 25px rgba(0, 0, 0, 0.25);
  .subsection-title {
    background-color: $color-blue;
  }
  img {
    width: 100%;
  }
  p {
    padding-bottom: 10px;
  }
  .box-button {
    margin-left: 20px;
  }
}
.subsection-title {
  color: white;
  text-align: center;
  padding: 5px;
}
#text-one {
  text-align: left;
  padding-left: 5px;
  padding-top: 2px;
  padding-bottom: 5px;
}

#testimonial {
  flex: 2;
  margin-top: 20px;
  box-shadow: 5px 15px 25px rgba(0, 0, 0, 0.25);
  max-width: 800px;
  .subsection-title {
    background-color: $color-red;
    padding-left: 20px;
    padding-right: 20px;
  }
}
.video iframe {
    width:100%;
}
.video {
    position: relative;
    width:100%;
    overflow: hidden;
    padding-top: 56.25%;
}
.responsive-iframe {
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  width: 100%;
  height: 100%;
}
#friend {
  display: none;
}

//Large Screens
@media screen and (min-width: 900px) {
  .body-row-2 {
  margin-top: 150px;
  margin-bottom: 20px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
  #banner {
    height: 500px;
  }
  #banner-text {
    padding-left: 40px;
    padding-bottom: 40px;
  }
  .box-button {
    margin-top: 10px;
    padding: 5px;
    width: 150px;
  }
  .body-row {
    width: 100%;
    height: 450px;
    flex-direction: row;
    justify-content: space-between;
    align-items: flex-start;
    margin-bottom: 100px;
    margin-top: 40px;
  }
  .body-row-2 {
    height: 100%;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 100px;
    margin-left: 100px;
    margin-right: 100px;
    box-shadow: 5px 15px 25px rgba(0, 0, 0, 0.25);
  }
  #volunteers {
    margin-right: 40px;
    margin-left: 100px;
    flex-grow: 1;
    width: 33%;
  }
  #text-one {
    display: inline-block;
    padding-left: 10px;
    padding-top: 10px;
  }
  #testimonial {
    margin-top: 0px;
    margin-right: 100px;
    width: 66%;
    img {
      max-height: 500px;
      object-fit: cover;
      object-position: 0px, 30%;
    }
  }
  #tabs {
    padding-left: 30px;
  }
  #friend {
    padding-right: 30px;
    display: inline-block;
    img {
      width: 100%;
      filter: grayscale(100%);
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
