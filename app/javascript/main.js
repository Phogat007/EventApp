document.addEventListener("DOMContentLoaded", function () {
  var formWrapper = document.getElementsByClassName("form-wrapper")[0];
  var signInBtn = document.getElementById("signin-btn");
  var signUpBtn = document.getElementById("signup-btn");

  function showSignInForm() {
    console.log("Showing sign-in form");
    formWrapper.style.transform = "translateX(-350px)";
  }

  function showSignUpForm() {
    console.log("Showing sign-up form");
    formWrapper.style.transform = "translateX(0px)"; // Adjust this value based on your form's width
  }

  signInBtn.onclick = function () {
    showSignInForm();
  };

  signUpBtn.onclick = function () {
    showSignUpForm();
  };

  // Attach event listeners to the buttons
  signInBtn.onclick = function () {
    showSignInForm();
  };

  signUpBtn.onclick = function () {
    showSignUpForm();
  };
});

function hideAlert(alertId) {
  document.getElementById(alertId).style.display = "none";
}
