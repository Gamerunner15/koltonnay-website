<template>
  <div>
    <h1 class="work-title">Work Experience</h1>
    <div class="timeline">
        <!--Job 1-->
      <div class="job-experience">
        <div class="content">
          <div class="headline">
            <h2 class="job-title">Assistant Teacher, <em>Dublin Latchkey</em></h2>
            <h3 class="location">Dublin, OH</h3>
          </div>
          <div class="accomplishments">
            <ul>
              <li>Supervised 40-80 children grades K-5 before and after school and implemented an enhanced reading program featuring graphic novels and comics.</li>
              <li>Led a weekly mock game-show for the children featuring pop culture questions and team-based play.</li>
            </ul>
          </div>
        </div>
      </div>
      <!--Job 2-->
      <div class="job-experience">
        <div class="content">
          <div class="headline">
            <h2 class="job-title">Customer Success Advocate, <em>Bold Penguin</em></h2>
            <h3 class="location">Columbus, OH</h3>
          </div>
          <div class="accomplishments">
            <ul>
              <li>Guided 200+ small business owners in obtaining commercial insurance utilizing in-house software built with Ruby on Rails.</li>
              <li>Utilized government NAICS codes to classify complex businesses into insurable categories.</li>
              <li>Served as team leader to generate morale and facilitate healthy relationships between members of different departments.</li>
            </ul>
          </div>
        </div>
      </div>
      <!--Job 3-->
      <div class="job-experience">
        <div class="content">
          <div class="headline">
            <h2 class="job-title">Mental Health Case Manager, <em>North Community Counseling Center</em></h2>
            <h3 class="location">Columbus, OH</h3>
          </div>
          <div class="accomplishments">
            <ul>
              <li>Partnered with therapists and psychiatrists to provide care for clients both living in poverty and with mental illnesses.</li>
              <li>Managed a workload of over 60 clients on a weekly or biweekly basis to develop positive coping mechanisms, apply for benefits and assistance, and find stable employment.</li>
            </ul>
          </div>
        </div>
      </div>
      <!--Job 4-->
      <div class="job-experience">
        <div class="content">
          <div class="headline">
            <h2 class="job-title">Writing Correspondent, <em>The Times Reporter</em></h2>
            <h3 class="location">Dover, OH</h3>
          </div>
          <div class="accomplishments">
            <ul>
              <li>Researched and wrote stories for multiple platforms, including print and digital.</li>
              <li>Crafted factually correct, concise and engaging news stories within tight deadlines.</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "work-experience",
};
</script>

<style lang="scss">
$dodie-yellow: #fef65b;
$teal: #5affd5;
$midnight-purple: #702670;
$primary-font: "Cairo", sans-serif;
$secondary-font: "Lora", serif;

.work-title {
    margin-left: 40px;
}
.timeline {
  position: relative;
  max-width: 1200px;
  margin-left: 50px;
}

.timeline::after {
  content: "";
  position: absolute;
  width: 6px;
  background-color: $midnight-purple;
  top: 0;
  bottom: 0;
  left: 0%;
  margin-left: -3px;
}

.job-experience {
  padding: 10px 40px;
  margin-bottom: 20px;
  position: relative;
}
.content {
  display: flex;
  flex-direction: column;
  justify-content: center;
  background-color:#fffdd9;
  border: 4px solid $dodie-yellow;
  border-radius: 6px;
  padding-bottom: 10px;
}
//Circles
.job-experience::after {
  content: "";
  position: absolute;
  width: 15px;
  height: 15px;
  right: 1189px;
  background-color: white;
  border: 4px solid $midnight-purple;
  top: 15px;
  border-radius: 50%;
  z-index: 1;
}

//Arrow Points
.job-experience::before {
  content: " ";
  height: 0;
  position: absolute;
  top: 22px;
  width: 0;
  z-index: 1;
  left: 30px;
  border: medium solid $midnight-purple;
  border-width: 10px 10px 10px 0;
  border-color: transparent $dodie-yellow transparent transparent;
}

.headline {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  padding-left: 20px;
  padding-right: 20px;
}

.accomplishments {
  li {
  }
}
</style>