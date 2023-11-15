// Login button
document.addEventListener("DOMContentLoaded", function() {
    // Captura el formulario y los campos de entrada
    var login_in = document.getElementById("login-in");
    var messageErrorIn = document.getElementById("messageErrorIn");
    var messageErrorUp = document.getElementById("messageErrorUp");
    var charNot = ['&', '<', '>', '%', '$'];

    // Agrega un evento al botón de inicio de sesión
    document.getElementById("SingIn").addEventListener("click", function() {
        // Obtén los valores de los campos
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        var data = {'username': username, 'password': password};
        var params = "request=" + JSON.stringify(data);
        // Realiza la validación del formulario en el servidor usando AJAX
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "../../models/php/DAL/DAO/user_signIn.php", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var respuesta = JSON.parse(xhr.responseText);
                if (respuesta.userFound && respuesta.passwordMatch) {
                    // Autenticación exitosa, redirige o realiza alguna acción
                    window.location.href = "../../";
                } else if (respuesta.userFound) {
                    // Usuario encontrado, pero contraseña incorrecta
                    messageErrorIn.textContent = "Contraseña incorrecta. Por favor, inténtalo de nuevo.";
                } else {
                    // Usuario no encontrado
                    messageErrorIn.textContent = "Usuario no encontrado. Por favor, regístrate.";
                }
            }
        };
        xhr.send(params);
    });

    // Agrega un evento al botón de registro
    document.getElementById("singUp").addEventListener("click", function() {
        // Obtén los valores de los campos
        var username = document.getElementById("up-username").value;
        var password = document.getElementById("up-password").value;
        var email = document.getElementById("up-email").value;
        var data = {'username': username, 'password': password, 'email': email};
        var params = "request=" + JSON.stringify(data);
        // Realiza la validación del formulario en el servidor usando AJAX
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "../../models/php/DAL/DAO/user_signUp.php", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")

        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var respuesta = JSON.parse(xhr.responseText);
                if (respuesta.pass === true) {
                    // Autenticación exitosa, redirige o realiza alguna acción
                    // window.location.href = "../../";
                    alert('Has sido agregado satisfactoriamente', respuesta.pass);
                } else {
                    // Nombre de usuario en uso
                    messageErrorUp.textContent = 'El nombre de usuario que intentas usar esta en uso';
                }
            }
        };
        xhr.send(params);
    });

    document.getElementById('up-password').addEventListener("input", function(){
        var password = document.getElementById('up-password').value;
        if (password.length <= 8) {
            messageErrorUp.textContent = "Ingresa como mínimo 8 caracteres.";
        }
        else {
            messageErrorUp.textContent = '';
            for (var i = 0; i < password.length; i++) {
                for (var j = 0; j < charNot.length; j++) {                    
                    if (password.charAt(i) == charNot[j]) {
                        messageErrorUp.textContent = "Tu contraseña no puede contener '&', '<', '>', '%', '$'";
                        return;
                    }
                    else if (password.charAt(i) =='') {
                        messageErrorUp.textContent = "";
                        return;
                    }
                }
            }
        }
    });

    document.getElementById('up-password-conf').addEventListener("input", function () {
        var passwordConf = document.getElementById('up-password-conf').value;
        var password = document.getElementById('up-password').value;
        if (password === passwordConf) {
            messageErrorUp.textContent = '';
        }
        else {
            messageErrorUp.textContent = 'Las contraseñas no coinciden.';
        }
    });

    // Evento de modificación de campos
    document.getElementById("username").addEventListener("input", function () {
        if (messageErrorIn.value != "")
        {
            messageErrorIn.textContent = ' ';
        }
        else
            return;
    })

    document.getElementById("password").addEventListener("input", function () {
        if (messageErrorIn.value != "")
        {
            messageErrorIn.textContent = '';
        }
        else
            return;
    })
});