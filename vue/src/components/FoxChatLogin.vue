<template>
    <div class='login-screen'>
        <div
          class="alert alert-success"
          role="alert"
          v-if="this.$route.query.registration">
            <p>Thank you for registering!</p>
        </div>
        <p>Sign in to your account</p>
        <form @submit.prevent="login">
            <div>
                <input
                type="text"
                id="username"
                class="login-form"
                placeholder="Type in your username"
                v-model="user.username"
                required
                autofocus
                />
            </div>
            <div>
                <input
                type="password"
                id="password"
                class="login-form"
                placeholder="Type in your password"
                v-model="user.password"
                required
                />
            </div>
            <div>
                <button type="submit" class="login-button">Sign in</button>
            </div>
        </form>

        <div class='forgot'><p>Forgot username/password?</p></div>
    </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
    name: 'fox-chat-login',
    components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/admin");
          }
        })
        .catch(error => {
          const response = error.response;
          if (response.status === 401) {
            this.$swal({
                icon: 'error',
                title: 'Login Unsuccessful',
                text: 'Invalid username and password!',
                toast: false,
                timer: 4000,
                timerProgressBar: true,
                position: 'top',
                showConfirmButton: true,
            })
          }
        });
    }
  }
}
</script>

<style>

.login-screen {
    
    display: flex;
    flex-direction: column;
    max-width: 100%;
}

.login-screen p {
    margin: 0;
    color: var(--main-color);
    font-size: 20px;
    text-align: center;
}

.login-form {
    box-sizing: border-box;
    width: 100%;
    padding: 16px;
    margin-top: 15px;
    border-radius: 3px;
    border: 1px solid var(--main-color);
    font-size: 16px;
    background-color: var(--secondary-color);
}

.login-form::placeholder {
    padding-left: 10px;
}

.login-button {
    padding: 13px 40px 15px;
    width: 100%;
    color:var(--secondary-color);
    background-color: var(--main-color);
    border-radius: 3px;
    border: none;
    margin: 15px 0;
    font-size: 19px;
    border: 1px solid var(--main-color);
}
.login-button:hover {
    color:var(--main-color);
    background-color: var(--secondary-color);
}

.forget {
    margin-top: 15px;
}

.forget p {
    font-size: 1.1rem;
}
</style>