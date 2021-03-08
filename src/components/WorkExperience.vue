<template>
  <div>
    <h1 id="work-title">Professional Experience</h1>
    <div class="timeline">
      <!--Job 0-->
      <div class="job-experience">
        <div class="circle"><i class="fa fa-circle"></i></div>
        <div class="content">
          <div class="headline">
            <div class="title-employer">
              <h2 class="job-title">Software Engineer @</h2>
              <h2><em>Revel IT (Cardinal Health)</em></h2>
            </div>
            <h3 class="location">Dublin, OH</h3>
          </div>
          <div class="accomplishments">
            <ul>
              <li>
                Contribute regularly to an Agile team of developers by pulling cards, making Pull Requests, and fixing bugs.
              </li>
              <li>
                Collaborate with UI, UX, and BAs to develop the best possible product that meets the business owner’s needs.
              </li>
            </ul>
          </div>
        </div>
      </div>
      <!-- Tech Elevator Experience-->
      <div class="job-experience">
        <div class="circle"><i class="fa fa-circle"></i></div>
        <div class="content">
          <div class="headline">
            <div class="title-employer">
              <h2 class="job-title">Java Student @</h2>
              <h2><em>Tech Elevator</em></h2>
            </div>
            <h3 class="location">Columbus, OH</h3>
          </div>
          <div class="accomplishments">
            <ul>
              <li>
                Developed a command-line catering application that reads from
                and writes to a file to keep track of product inventory and log
                transactions. Utilized in-memory data structures to track the
                customer cart and balance.
              </li>
              <li>
                Produced client-side and server-side money transfer applications
                utilizing pair programming, postgreSQL, Spring Boot, and RESTful
                Web Services. Built on top of a security framework for login
                hashing, token authentication, and tiered permissions.
              </li>
              <li>
                Co-developed a tech education chatbot with functionality to
                dynamically respond to user input related to curriculum help and
                career advice. Built a PostgreSQL database to store triggered
                responses, a front-end website in Vue.js connected to a Java
                server through RESTful Web Services, and an authenticated admin
                page dedicated to displaying usage statistics in a graphical
                format and allowing limited database manipulation.
              </li>
            </ul>
          </div>
        </div>
      </div>
      <!--Job 1-->
      <div class="job-experience">
        <div class="circle"><i class="fa fa-circle"></i></div>
        <div class="content">
          <div class="headline">
            <div class="title-employer">
              <h2 class="job-title">Assistant Teacher @</h2>
              <h2><em>Dublin Latchkey</em></h2>
            </div>
            <h3 class="location">Dublin, OH</h3>
          </div>
          <div class="accomplishments">
            <ul>
              <li>
                Supervised 40-80 children grades K-5 before and after school and
                implemented an enhanced reading program featuring graphic novels
                and comics.
              </li>
              <li>
                Led a weekly mock game-show for the children featuring pop
                culture questions and team-based play.
              </li>
            </ul>
          </div>
        </div>
      </div>
      <!--Job 2-->
      <div class="job-experience">
        <div class="circle"><i class="fa fa-circle"></i></div>
        <div class="content">
          <div class="headline">
            <div class="title-employer">
              <h2 class="job-title">Customer Success Advocate @</h2>
              <h2><em>Bold Penguin</em></h2>
            </div>
            <h3 class="location">Columbus, OH</h3>
          </div>
          <div class="accomplishments">
            <ul>
              <li>
                Guided 200+ small business owners in obtaining commercial
                insurance utilizing in-house software built with Ruby on Rails.
              </li>
              <li>
                Utilized government NAICS codes to classify complex businesses
                into insurable categories.
              </li>
              <li>
                Served as team leader to generate morale and facilitate healthy
                relationships between members of different departments.
              </li>
            </ul>
          </div>
        </div>
      </div>
      <!--Job 3-->
      <div class="job-experience">
        <div class="circle"><i class="fa fa-circle"></i></div>
        <div class="content">
          <div class="headline">
            <div class="title-employer">
              <h2 class="job-title">Mental Health Case Manager @</h2>
              <h2><em>North Community Counseling Center</em></h2>
            </div>
            <h3 class="location">Columbus, OH</h3>
          </div>
          <div class="accomplishments">
            <ul>
              <li>
                Partnered with therapists and psychiatrists to provide care for
                clients both living in poverty and with mental illnesses.
              </li>
              <li>
                Managed a workload of over 60 clients on a weekly or biweekly
                basis to develop positive coping mechanisms, apply for benefits
                and assistance, and find stable employment.
              </li>
            </ul>
          </div>
        </div>
      </div>
      <!--Job 4-->
      <div class="job-experience">
        <div class="circle"><i class="fa fa-circle"></i></div>
        <div class="content">
          <div class="headline">
            <div class="title-employer">
              <h2 class="job-title">Writing Correspondent @</h2>
              <h2><em>The Times Reporter</em></h2>
            </div>
            <h3 class="location">Dover, OH</h3>
          </div>
          <div class="accomplishments">
            <ul>
              <li>
                Researched and wrote stories for multiple platforms, including
                print and digital.
              </li>
              <li>
                Crafted factually correct, concise and engaging news stories
                within tight deadlines.
              </li>
            </ul>
          </div>
        </div>
      </div>
      <!--Job 5-->
      <div class="job-experience">
        <div class="circle"><i class="fa fa-circle"></i></div>
        <div class="content">
          <div class="headline">
            <div class="title-employer">
              <h2 class="job-title">Program Assistant @</h2>
              <h2>
                <em>Mennonite Central Committee United Nations Office</em>
              </h2>
            </div>
            <h3 class="location">New York, NY</h3>
          </div>
          <div class="accomplishments">
            <ul>
              <li>
                Facilitated UN events for MCC and the NGO Working Group on Food
                and Hunger.
              </li>
              <li>
                Acted as liaison to the North Korean Ambassadors in efforts to
                build a better relationship and promote sustainable agriculture.
              </li>
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
$primary-color: #fef65b;
$secondary-color: gray;
$tertiary-color: #5affd5;

#work-title {
  text-align: center;
}
.timeline {
  position: relative;
  max-width: 1200px;
  margin-left: 200px;
}

.timeline::after {
  content: "";
  position: absolute;
  width: 6px;
  background-color: $secondary-color;
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
  background-color: #fffdd9;
  border: 4px solid $dodie-yellow;
  border-radius: 6px;
  padding-bottom: 10px;
}
.circle {
  font-size: 30px;
  color: $secondary-color;
  float: left;
  margin-left: -52.5px;
}
//Circles
// .job-experience::after {
//   content: "";
//   position: absolute;
//   width: 15px;
//   height: 15px;
//   right: 1189px;
//   background-color: white;
//   border: 4px solid $secondary-color;
//   top: 15px;
//   border-radius: 50%;
//   z-index: 1;
// }

//Arrow Points
// .job-experience::before {
//   content: " ";
//   height: 0;
//   position: absolute;
//   top: 22px;
//   width: 0;
//   z-index: 1;
//   left: 30px;
//   border: medium solid $midnight-purple;
//   border-width: 10px 10px 10px 0;
//   border-color: transparent $dodie-yellow transparent transparent;
// }

.headline {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  padding-left: 20px;
  padding-right: 20px;
}

.title-employer {
  display: flex;
  flex-direction: row;
  justify-content: space-evenly;
  align-items: center;
  h2 {
    padding-right: 5px;
  }
}

.accomplishments {
  li {
  }
}

@media screen and (max-width: 425px) {
  .timeline {
    position: relative;
    margin-left: 20px;
  }
  .job-experience {
    padding: 10px 20px;
    margin-bottom: 20px;
    position: relative;
  }
  .timeline::after {
    content: "";
    position: absolute;
    width: 6px;
    background-color: $secondary-color;
    top: 0;
    bottom: 0;
    left: 0%;
    margin-left: 0px;
  }
  .circle {
    font-size: 25px;
    color: $secondary-color;
    float: left;
    margin-left: -28px;
    margin-top: -10px;
  }
  .headline {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding-left: 5px;
    padding-right: 5px;
    text-align: center;
    h2 {
      font-size: 20px;
    }
    h3 {
      padding-bottom: 5px;
      font-size: 15px;
    }
  }
  .title-employer {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    h2:first-of-type {
      margin-bottom: -5px;
    }
    h2:last-of-type {
      font-size: 15px;
    }
  }
}
</style>