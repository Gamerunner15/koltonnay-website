<template>

        <div>
            <div id='open-bubble'>
                <div id='open' v-on:click="toggleChat()" v-if='!this.showChat'>
                    <div class='center-in-div'><p><i class="fa fa-comments"></i></p></div>
                </div>
            </div>
        <div class="chatbot" v-if='this.showChat'>
            <div class='chat-header'>
                <div id='chatboi'>Foxchat</div>
                <div id='close' v-on:click="toggleChat()">
                    <div id='close-x'><p><i class="fa fa-times"></i></p></div>
                </div>
            </div>
            <div id='chatbox'>
               <div 
                v-for='(chatBubble, index) in chatHistory' 
                v-bind:key="index"
                class="message-group">
                    <img v-if="!chatBubble.sent" class="sent-avatar" src='../assets/foxtrot_chat.png' />
                    <div class='chatbubble' v-bind:class='chatBubble.sent ? "sent" : "recieved"'>
                        <p v-if="!chatBubble.sent" v-html="chatBubble.message"></p>
                        <p v-if="chatBubble.sent">{{chatBubble.message}}</p>
                        <div v-if="chatBubble.bubbles" class='bubble-box'>
                            <div v-for='(bubble, index) in chatBubble.bubbles' v-bind:key="index">
                                <div v-if='bubble.subTopicBubble' type="button" class='bubble'
                                v-on:click ="subTopic(bubble.value)">
                                    {{bubble.message}}
                                </div>
                                <div v-if='bubble.linkBubble'>
                                    <a v-bind:href='bubble.value' target="_blank">
                                        <div type="button" class='bubble'>
                                            {{bubble.message}}
                                        </div>
                                    </a>
                                </div>
                                <div v-if='bubble.departmentBubble' type="button" class='bubble'
                                v-on:click ="sendBubbleDepartment(bubble.value)">
                                    {{bubble.message}}
                                </div>
                                <div v-if='bubble.topicBubble' type="button" class='bubble'
                                v-on:click ="sendBubbleTopic(bubble.value)">
                                    {{bubble.message}}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            <div>
                <input type="text" class="text-box" v-model="message" v-on:keyup.enter="submitText()"
                placeholder="type here to chat ... "/>
            </div>
        </div>
        </div>
</template>

<script>
 
import conversationService from '../services/ConversationService.js'


export default {
    name: 'fox-chat-bot',
    data() {
        return {
            showChat: false,
            newUser: true,
            message: "",
            chatHistory: [],
            conversation: {
                name: "",
                topics: [],
                department: "",
                message: "",
                questionAnswered: false,
                bubbles: [],
            },
            jobSearch: null,
        }
    },
    created() {
        let welcome = "Hello! I'm the Foxchat digital assistant. To get started, may I ask your name?"
        setTimeout(() => {this.chatHistory.push({message: welcome, sent: false})}, 700);
    },
    methods: {
        pushRecievedMessageToChat() {
            this.chatHistory.push({message: this.conversation.message, sent: false, bubbles: this.conversation.bubbles});
        },
        subTopic(value) {
            this.chatHistory.push({message: value, sent: false});
        },
        submitText() {
            //Add Message to chatHistory
            this.chatHistory.push({message: this.message, sent: true});
            
            this.conversation.message = this.message;
            //Send message to Server
            this.sendIt();
            //Reset message
            this.message = "";
        },
        toggleChat() {
            this.showChat = !this.showChat;
            this.newUser = false;
        },
        sendBubbleDepartment(value) {
            this.conversation.department = value;
            this.conversation.message = "";
            this.message = "";
            this.sendIt();
        },
        sendBubbleTopic(value) {
            this.conversation.topics = [value];
            this.conversation.message = "";
            this.message = "";
            this.sendIt();
        },
        sendIt() {
            this.conversation.bubbles = [];
            if(this.parseForJobSearch()) conversationService.sendIt(this.conversation).then(response =>{
                if(response.status === 202) {
                    this.conversation = response.data;
                    this.pushRecievedMessageToChat();
                }
            });
        },
        sendJobSearch() {
            this.conversation.message = "";
            this.conversation.bubbles = [];
            conversationService.sendJobSearch(this.jobSearch).then(response =>{
                if(response.status === 202) {
                    let oldName = this.conversation.name;
                    this.conversation = response.data;
                    this.conversation.name = oldName;
                    this.pushRecievedMessageToChat();
                    this.jobSearch = null;
                }
            });
        },
        parseForJobSearch() {
            let messageToParse = this.message.toLowerCase();
            if(messageToParse.includes('job search')) {
                this.conversation.message = "What is the title of the job you are searching for?";
                this.jobSearch = {jobTitle: null, jobLocation: null}
                this.pushRecievedMessageToChat();
                return false;
            } else if(this.jobSearch) {
                if(!this.jobSearch.jobTitle) {
                    this.jobSearch.jobTitle = this.message;
                    this.conversation.message = "What is the location of the job you are searching for?";
                    this.pushRecievedMessageToChat();
                    return false;
                } else {
                    this.jobSearch.jobLocation = this.conversation.message;
                    this.sendJobSearch();
                    return false;
                }
            }
            return true;
        }
    }
}
</script>

<style>
.center-in-div {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    align-content: center;
    justify-content: center;
}

.chat-logo {
    width: 70%;
    height: auto;
    padding-left: 1rem;
}
/* Open Chatbot Button */
#open {
    width: 100px;
    height: 100px;
    margin-top: 10px;
    cursor: pointer;
    font-family: Avenir, Helvetica, Arial, sans-serif;
    text-align: center;
    color:var(--secondary-color);

    border-radius: 5em;
    
    background-color: var(--main-color);
    box-shadow: 0 4px 16px rgba(0,0,0,.25);
        
    transition-property: all;
    transition-duration: .6s;
}

#open p {
    font-size: 60px;
    margin: auto;

}
#open-bubble {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;

    margin-bottom: 30px;
    margin-right: 30px;

    position:fixed;
    bottom:0;
    right:0;
    animation: wiggle 2.5s;
    animation-iteration-count: 10;
}
#awayBubble {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    text-align: center;
    color:var(--secondary-color);
    width: 130px;
    height: 65px;
    border-radius: 1em;
    border: none;
    background-color: var(--main-color);
    box-shadow: 0 4px 16px rgba(0,0,0,.25);

    animation: wiggle 2.5s;
    animation-iteration-count: 6;
}

@keyframes wiggle {
    0% { transform: rotate(0deg); }
   80% { transform: rotate(0deg); }
   85% { transform: rotate(5deg); }
   95% { transform: rotate(-5deg); }
  100% { transform: rotate(0deg); }
}

#awayBubble p {
    padding: 0;
}

/* Whole Chatbot Styling */

.chatbot {
    
    position:fixed;
    bottom:0;
    right:0;
    
    display:flex;
    flex-direction: column-reverse;

    width: 50%;
    max-width: 550px;
    height: 80%;
    margin-bottom: 20px;
    margin-right: 20px;

    line-height: 1.5;
    
    border: 1px solid var(--border-color);
    border-top-left-radius: .5em;
    border-top-right-radius: .5em;
    
    background: var(--secondary-color);

    box-shadow: 0 4px 16px rgba(0,0,0,.25);

}

/* Header Styling */
.chat-header {
    width: 100%;
    height: 30px;
    background-color: var(--secondary-color);
    border-bottom: 1px solid var(--border-color);
    border-top-left-radius: .5em;
    border-top-right-radius: .5em;
    order:3;
    box-sizing: border-box;
    display:flex;
}

#close {
    background-color: var(--close-button-color);
    color:var(--secondary-color);
    width: 29px;
    height: 29px;
    text-align: center;
    border-radius: 0 .4em 0 0;
    position: absolute;
    right: 0;
    cursor:pointer;
}

#close-x p {
    font-size: 23px;
    margin: 0;
}

#chatboi {
    margin: auto;
    font-size:120%;
    cursor:default;
    color:rgba(0, 0, 0, 0.25)
}


/* Chatbox Styling */
#chatbox {
    order:2;
    overflow:auto;
    flex: 1;
    box-shadow: inset 0px 20px 30px -20px #00000028;
    padding: 5px 0;
    background-color: var(--background-color);
}

.message-group {
    display: flex;
}

.sent-avatar {
    /* border-radius: 50%; */
    width: 50px;
    height: 50px;
    align-self: flex-end;
    margin: 1px 3px 1px 3px;
    
}

/* Bubble Syling */
.bubble {
    border-radius: 0.3rem;
    min-width: 45%;
    padding: 2px 3px;
    margin: 1px 2px;
    text-align: center;
    max-height: fit-content;
    background-color:var(--background-color);
    color: var(--recieved-bubble-color);
    cursor:pointer;
    word-wrap: normal;
}

.bubble a {
    color: var(--recieved-bubble-color);
    text-decoration: none;
}

.bubble a:hover {
    color: var(--secondary-color);
}

.bubble:hover {
    background-color: var(--main-color);
    color: var(--secondary-color);
}

.bubble-box {
    display:flex;
    margin-bottom: 5px;
    justify-content: center;
    flex-wrap: wrap;
}

/* Chat Bubble Styling */
.chatbubble {
    max-width: 50%;
    word-wrap: break-word;
    margin: 3px 0;
    border-radius: 0.5em;
    padding: 0.1rem .6rem ;
    color: var(--secondary-color);
    /* box-shadow: 0 2px 10px rgba(0,0,0,.2); */
}

.chatbubble p {
    margin: 5px;
    padding: 0;
}

.chatbubble a {
    text-decoration: none;
}

.sent {
    text-align: right;
    background-color: var( --sent-bubble-color);
    margin-left: auto;
    margin-right: 10px;
    border-radius: 1em 1em 0.2em 1em;    
}
.recieved {
    margin-right: auto;
    background-color: var(--recieved-bubble-color);
    border-radius: 1em 1em 1em 0.2em;
}

/* Chat Text Input Styling */
.text-box {
    box-sizing: border-box;
    text-align: left;

    width:100%;
    height: 40px;
    padding-left: 1rem;
    font-size: 1.2rem;
    color: var(--chatbot-text-input-color);
    background-color: var(--secondary-color);
    
    border-width: 0px;
    border-top: 1px solid var(--border-color);
}

::placeholder {
  color: rgba(0, 0, 0, 0.247);
}

.text-box:focus {
    outline-width: 0;
}

@media screen and (max-width: 800px) {

    #open-bubble {
        flex-direction: row;
    }

    #open {
        width: 85px;
        height: 85px;
        margin-left: 15px;
        margin-top: 0;
    }
    #open p{
        font-size: 50px;
    }
    .chatbot {
        margin: 0px;
        width: 100%;
        max-width: 100%;
        height: 100vh;
        border-radius: 0;
        border: none;
    }
    
    .chat-header {
        height: 50px;
        border-radius: 0;
    }

    #close-x p {
    font-size: 35px;
    }

    #close{
        border-radius: 0;
        height: 49px;
        width: 49px;
    }

    .chatbubble {
        max-width: 65%;
        font-size: 1.1rem;

    }

    .text-box {
        height: 55px;
        font-size: 1.5rem;
    }
}

</style>