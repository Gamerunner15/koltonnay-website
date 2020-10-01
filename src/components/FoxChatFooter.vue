<template>
    <div>
        <div class='footer'>
            <a href="#"><img src="..\assets\MainPicture.jpg" /><p>Return to HomePage</p></a>
            <p>Copyright © 2020 JavaGreen, Inc. All rights reserved</p>
        </div>
    </div>
</template>

<script>
export default {
    name: "fox-chat-footer"
}
</script>

<style lang="scss">

.footer {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-evenly;
    font-family: Avenir, Helvetica, Arial, sans-serif;
    text-align: center;
    background-color:var(--main-color);
    color:var(--secondary-color);
    width: 100%;
    height: 75px;
    a {
        display: flex;
        flex-direction: row;
        justify-content: space-evenly;
        align-items: center;
    }
    img {
        width: 50px;
        border-radius: 50%;
    }
}

.footer p {
    color: var(--secondary-color);
    margin: 2px;
    font-size: 18px;
}

.footer a {
    color: var(--secondary-color);
}

.footer a:hover {
    color: rgb(110, 110, 110);
}

@media screen and (max-width: 600px) {
    .footer {
        height: 50px;
    }

    .footer p {
        font-size: 2vw;
    }
}
</style>