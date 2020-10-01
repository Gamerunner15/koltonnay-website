<template>
    <div class='login-screen'>
        <p>Register Account</p>

        <form @submit.prevent="register">
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
                <input
                type="password"
                id="password"
                class="login-form"
                placeholder="Confirm Password"
                v-model="user.confirmPassword"
                required
                />
            </div>
            <div>
                <button type="submit" class="login-button">Register</button>
            </div>
        </form>

    </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: 'fox-chat-register',
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
     
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.$swal({
                icon: 'warning',
                title: 'Registration Unsuccessful',
                text: 'Passwords do not match!',
                toast: true,
                timer: 3000,
                timerProgressBar: true,
                position: 'top',
                showConfirmButton: false,
            });
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
                this.$emit("registered");
                 this.$swal({
                icon: 'success',
                title: 'Registration Successful',
                toast: true,
                timer: 3000,
                timerProgressBar: true,
                position: 'top',
                showConfirmButton: false,
            });
              this.$router.push({
                path: '/',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
           
            if (response.status === 400) {
                this.$swal({
                icon: 'error',
                title: 'Registration Unsuccessful',
                text: 'Bad Request: Validation Errors',
                toast: true,
                timer: 3000,
                timerProgressBar: true,
                position: 'top',
                showConfirmButton: false,
            });
            
            }
          });
      }
    },
  },
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