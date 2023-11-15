
var navbar = document.getElementById('navBar');
fetch('includes/header.html').then(response => response.text()).then(content => {
    navbar.innerHTML = content;
}).catch(error => console.log(error));