import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) private var dismiss

    let html = """
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Login</title>
      <link rel="icon" type="image/x-icon" href="/MultiTools.jpg" />
      <meta name="theme-color" content="#45a049" />
      <link rel="manifest" href="/manifest.json" />
      <style>
        body {
          background-color: #121212;
          color: #ffffff;
          font-family: Arial, Helvetica, sans-serif;
          display: flex;
          justify-content: center;
          align-items: center;
          height: 100vh;
          margin: 0;
        }

    .back-button {
                padding: 12px 20px;
                border-radius: 8px;
                border: none;
                background-color: #4caf50;
                color: white;
                font-size: 16px;
                cursor: pointer;
                width: 120px;
                position: fixed;
                bottom: 30px;
                right: 30px;
                transition: all 0.2s ease;
                animation: fadeInUp 1s ease-out;
            }

            @keyframes fadeInUp {
                0% {
                    opacity: 0;
                    transform: translateY(30px);
                }
                100% {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .back-button:hover {
                background-color: #45a049;
                transform: translateY(-2px);
                box-shadow: 0px 4px 12px rgba(0, 255, 0, 0.3);
            }

        .container {
          background-color: #1e1e1e;
          padding: 40px;
          border-radius: 16px;
          box-shadow: 0px 6px 16px rgba(0, 0, 0, 0.5);
          width: 100%;
          max-width: 400px;
          text-align: center;
          
        }
        h1 {
          font-size: 32px;
          margin-bottom: 10px;
        }
        h2 {
          font-size: 16px;
          color: #aaa;
          margin-bottom: 20px;
        }
        .input-field {
          width: 80%;
          padding: 14px;
          margin: 12px 0;
          background-color: #2c2c2c;
          border: none;
          border-radius: 8px;
          color: #ffffff;
          font-size: 16px;
        }
        .input-field:focus {
          outline: none;
          border: 2px solid #4caf50;
          background-color: #333333;
        }
        .btn, .google-login {
          padding: 14px;
          border-radius: 8px;
          background-color: #4caf50;
          color: white;
          font-size: 16px;
          cursor: pointer;
          width: 60%;
          margin-top: 12px;
          border: none;
          transition: all 0.2s ease;
        }
        .btn:hover, .google-login:hover {
          background-color: #45a049;
          transform: translateY(-2px);
          box-shadow: 0px 4px 12px rgba(0, 255, 0, 0.3);
        }
        .message {
          color: #4caf50;
          font-size: 14px;
          margin-top: 12px;
        }
      </style>
    </head>
    <body>

    <div class="container" id="container">
      <!-- Login Form -->
      <div id="loginForm">
        <h1>Login</h1>
        <h2>Please note that accounts are online but are not fully compleated and are as on now for testing</h2>
        <input type="email" id="username" class="input-field" placeholder="Email" required />
        <input type="password" id="password" class="input-field" placeholder="Password" required />
        <button class="btn" onclick="login()">Login</button>
        <button class="google-login" onclick="googleLogin()">Login With Google</button>
        <p class="message">Don't have an account? <a href="#" onclick="showRegister()">Sign Up</a></p>
      </div>

      <!-- Register Form -->
      <div id="registerForm" style="display:none;">
        <h1>Sign Up</h1>
        <h2>Please note that accounts are online but are not fully compleated and are as on now for testing</h2>
        <input type="email" id="regUsername" class="input-field" placeholder="Email" required />
        <input type="password" id="regPassword" class="input-field" placeholder="Password" required />
        <button class="btn" onclick="register()">Register</button>
        <button class="google-login" onclick="googleLogin()">Sign Up With Google</button>
        <p class="message">Already have an account? <a href="#" onclick="showLogin()">Login</a></p>
      </div>
    </div>
    <button class="back-button" onclick="window.history.back()">Back</button>

    <!-- Firebase JS SDK -->  
    <script src="https://www.gstatic.com/firebasejs/9.22.2/firebase-app-compat.js"></script>
    <script src="https://www.gstatic.com/firebasejs/9.22.2/firebase-auth-compat.js"></script>

    <script>
      // For Firebase JS SDK v7.20.0 and later, measurementId is optional
      const firebaseConfig = {
        apiKey: "AIzaSyBHSuqEhGYcRd_6GsMDI0bHDy3_5v0lD9g",
        authDomain: "multitools-48cc8.firebaseapp.com",
        projectId: "multitools-48cc8",
        storageBucket: "multitools-48cc8.firebasestorage.app",
        messagingSenderId: "1048886823672",
        appId: "1:1048886823672:web:71f0ff40e2a9642de2890d",
        measurementId: "G-JG6J0KRN08"
      };

      firebase.initializeApp(firebaseConfig);
      const auth = firebase.auth();

        function login() {
        const email = document.getElementById('username').value;
        const password = document.getElementById('password').value;

        auth.signInWithEmailAndPassword(email, password)
            .then((userCredential) => {
            console.log("Logged in:", userCredential.user);
            window.location.href = "index.html"; // 👈 redirect
            })
            .catch((error) => {
            alert("Login failed: " + error.message);
            console.error(error);
            });
        }

      function register() {
        const email = document.getElementById('regUsername').value;
        const password = document.getElementById('regPassword').value;

        auth.createUserWithEmailAndPassword(email, password)
          .then((userCredential) => {
            alert("Registered successfully!");
            console.log(userCredential.user);
          })
          .catch((error) => {
            alert("Registration failed: " + error.message);
            console.error(error);
          });
      }

        function googleLogin() {
        const provider = new firebase.auth.GoogleAuthProvider();
        auth.signInWithPopup(provider)
            .then((result) => {
            console.log("Google login successful:", result.user);
            window.location.href = "index.html"; // 👈 redirect
            })
            .catch((error) => {
            alert("Google login failed: " + error.message);
            console.error(error);
            });
        }

      function showRegister() {
        document.getElementById('loginForm').style.display = 'none';
        document.getElementById('registerForm').style.display = 'block';
      }

      function showLogin() {
        document.getElementById('registerForm').style.display = 'none';
        document.getElementById('loginForm').style.display = 'block';
      }
    </script>

    </body>
    </html>
    """

    var body: some View {
        NavigationStack {
            HTMLWebView(htmlContent: html, onNavigationRequest: { tool in
                if tool == "ContentView" {
                    dismiss()
                }
            })
            .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    LoginView()
}
