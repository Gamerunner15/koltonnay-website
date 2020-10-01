<template>
    <div class='body'>
        <div class='lander'>
            <div class='lander-element land-demo'>
                <img class='vertical-img bordered-img' src="../assets/Final_Mobile_Demo.gif" />
            </div>
            <div class='lander-element center-grow'>
                <p class='lander-title'>Introducing Foxchat!<br />Your newest chatbot for quick user interactions.</p>
                <div class='sign-up'>
                    <div>
                        <input type="text" class="email-input" v-model="userEmail"
                            required placeholder="Enter your business email"/>
                        <button class="signup-button" v-on:click.prevent >Submit</button>
                    </div>
                    <div>
                        Sign up for our API today!
                    </div>
                </div>
                <div class='social'>
                    Find us on social media
                    <img class='icon' src="../assets/facebook.png" />
                    <img class='icon' src="../assets/insta.png" />
                    <img class='icon' src="../assets/linkedin.png" />
                </div>
            </div>
            <div class='lander-element try-demo'>
                <p class='big-text'>Try our Demo!</p>
                <img class='arrow' src="../assets/Arrow.png" />
            </div>
        </div>
        <div class='body-row'>
            <div class='body-element elm-left'>
                <img class='horizontal-img bordered-img' src="../assets/demo_response.png" />
            </div>
            <div class='body-element elm-right'>
                <div class='feature'>
                <p class='big-text'>Intuitively ask questions!</p>
                <p>Searching for information has never been easier. Simply ask Foxchat what you need and it will inteligently provide answers.</p>
                </div>
            </div>
        </div>
        <div class='body-row'>
            <div class='body-element elm-left'>
                <div class='feature'>
                <p class='big-text'>Dive into a topic!</p>
                <p>Need more information? Foxchat can give granular responses of specific information as well as provide links to outside sources.</p>
                </div>
            </div>
            <div class='body-element elm-right'>
                <img class='vertical-img bordered-img' src="../assets/demo_gran.png" />
            </div>
        </div>
        <div class='body-row'>
            <div class='body-element elm-left'>
                <img class='vertical-img bordered-img' src="../assets/demo_job_search.png" />
            </div>
            <div class='body-element elm-right'>
                <div class='feature'>
                <p class='big-text'>Looking for a job?</p>
                <p>Foxchat can get job postings for any job, anywhere and give you direct links to job postings.</p>
                </div>
            </div>
        </div>
        <div class='body-row'>
            <div class='body-element elm-left'>
                <div class='feature'>
                <p class='big-text'>Got data?</p>
                <p>Foxchat provides system administrators with data on how users use their chatbot and what questions they are asking.</p>
                </div>
            </div>
            <div class='body-element elm-right'>
                <img class='horizontal-img bordered-img' src="../assets/demo_data.png" />
            </div>
        </div>
        <div class='body-row'>
            <div class='body-element elm-left'>
                <img class='horizontal-img bordered-img' src="../assets/demo_tools.png" />
            </div>
            <div class='body-element elm-right'>
                <div class='feature'>
                <p class='big-text'>Control your chatbot!</p>
                <p>Administrators need no technical experience in order to control their chatbot. You can edit responses using our easy to use admin tools!</p>
                </div>
            </div>
        </div>
        <div class='body-row'>
            <div class='body-element'>
            </div>
            <div class='body-element'>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'fox-chat-landing'
}
</script>

<style lang="scss">

* {
    p {
        font-family: Avenir, Helvetica, Arial, sans-serif;
    }
}

.body {
    color: var(--main-color);
    padding: 40px 0;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.body p{
    margin: 0;
}

.body-row {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
    padding-bottom: 40px;
}

.body-element {
    width: 40vw;
}

.elm-right {
    display: flex;
    justify-content: flex-start;
}

.elm-right p {
    text-align: left;
    max-width: 80%;
}

.elm-left {
    display: flex;
    justify-content: flex-end;
}

.elm-left p {
    text-align: right;
    max-width: 80%;
    margin-left: auto;
}

.social {
    margin-top: 40px;
}

.feature{
    text-align: center;
    font-size: 17px;
}

.lander {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
    padding-bottom: 120px;
    justify-content: space-between;
}
.lander-element {
    width: 30%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
}

.center-grow {
    align-self: flex-end;
    flex: 1;
}

.sign-up {
    margin-top: 140px;
}

.bordered-img {
    box-shadow: 5px 15px 25px rgba(0,0,0,.25);
    border: 2px solid var(--main-color);
    border-radius: 12px;
    margin: 0 50px;
}

.vertical-img {
    max-height: 450px;
}

.horizontal-img {
    max-width: 40vw;
}

.lander-title {
    font-size: 50px;
    text-align: center;
}

.big-text {
    font-size: 40px;
    text-align: center;
}

.icon {
    width: 25px;
    margin: 0 3px;
    cursor: pointer;
}

.try-demo {
    padding-top: 300px;
    align-self: flex-end;
}
.arrow {
    max-width: 50%;
}

/* Button Styling */
.signup-button {
    padding: 12px 10px;
    color:var(--secondary-color);
    background-color: var(--main-color);
    border-radius: 3px;
    border: none;
    margin-top: 10px;
    font-size: 16px;
    border: 1px solid var(--main-color);
}
.signup-button:hover {
    color:var(--main-color);
    background-color: var(--secondary-color);
}

.signup-button:active {
    background-color:var(--main-color);
    color: var(--secondary-color);
}

/* Email Input Styling */
.email-input {
    width: 300px;
    padding: 12px 0;
    margin-right: 8px;
    margin-top: 10px;
    margin-bottom: 10px;
    border-radius: 3px;
    border: 1px solid var(--main-color);
    background-color: var(--secondary-color);
    font-size: 16px;
}

.email-input::placeholder {
    padding-left: 10px;
}

@media screen and (max-width: 1000px) {
    .lander {
    display: flex;
    align-items: center;
    padding-bottom: 120px;
    justify-content: center;
    }
    .lander-element {
        max-width: 80vw;
        width: 80vw;
    }

    .sign-up {
        margin-top: 20px;
    }
    .email-input {
        width:50vw;
    }
    .social {
        display: none;
    }
    .lander-title{
        font-size: 8vw;
    }
    .try-demo {
        padding-top: 10vh;
        padding-bottom: 120px;
    }
    .land-demo {
        order:3;
    }

}
</style>