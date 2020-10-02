<template>
  <div>
    <h1 id="about-title">About Kolton</h1>
    <div class="bio">
      <div id="elevator-pitch">
        <p class="padded">
          My background boils down to is diversity in experience with a focus on
          language and communication, which always informs the way I interact
          with others socially as well as in the workplace. I studied English
          and ESL Instruction in college because I was fascinated by how
          language becomes our framework for understanding the world. I’ve
          taught ESL to both children in rural Peru and to migrant children and
          adults here in the States. I wrote documentation and policy drafts at
          the United Nations for an NGO focused on immigration and food justice,
          and I was the lead writer for Feature Profiles at my local newspaper
          for a year. But in the end, it turned out to be the mechanics behind
          language that fascinated me most.
        </p>
        <p>
          When I first moved to Columbus, I worked at a community mental health
          center as a case manager. This was one of the most difficult jobs I’ve
          ever worked, and the experience illustrated to me the degree to which
          inefficiencies in technology and poorly implemented systems have
          profound impacts on the people who depend on them. I first got
          interested in programming when I realized how I could improve those
          systems. I started automating parts of my jobs going forward so I
          could spend more time on the tasks only a human could do. At this
          point, I quickly fell in love with the logic and the creative
          capabilities that are inherent in programming languages. Now that I’m
          moving into a new career with the help of Tech Elevator, I’m looking
          for a position as a junior developer where I can contribute to a team,
          communicate effectively and authentically with coworkers, and grow my
          proficiency in what is a new but promising field of skills for me.
        </p>
      </div>
      <img class="banner-image" src="..\assets\Christmas_Pic_Edited.jpg" />
    </div>
    <div class="photo-row">
      <img src="..\assets\Shan_image_2.jpg" class="feature-photo" />
      <h2 class="caption">My partner, Shannon</h2>
    </div>
    <div class="photo-row">
      <h2 class="caption">Our pets, Dipper (left) and Beau (right)</h2>
      <img src="..\assets\Dipper_and_Beau.jpeg" class="feature-photo" />
    </div>
  </div>
</template>

<script>
export default {
  name: "about-page",
};
</script>

<style lang="scss">
$dodie-yellow: #fef65b;
$teal: #5affd5;
$midnight-purple: #702670;
$primary-font: "Cairo", sans-serif;
$secondary-font: "Lora", serif;
$primary-color: #fef65b;
$secondary-color: rgb(150, 161, 161);
$tertiary-color: #5affd5;
p {
  font-family: $secondary-font;
}
#about-title {
    text-align: center;
}
.bio {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-bottom: 40px;
}
#elevator-pitch {
  margin: 20px 180px 20px 180px;
  padding: 10px 10px 10px 10px;
  border: 5px solid $primary-color;
  border-radius: 6px;
  text-indent: 50px;
  .padded {
      padding-bottom: 10px;
  }
}
.banner-image {
  width: 60%;
  border: 5px solid $primary-color;
  border-radius: 6px;
}
.photo-row {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  margin: 40px 100px 20px 100px;
}

.feature-photo {
  width: 600px;
  border: 4px solid $dodie-yellow;
}

.caption {
  padding: 10px 10px 10px 10px;
  border: 5px solid $primary-color;
  border-radius: 6px;
}
</style>