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


function hideAlert(alertId) {
  document.getElementById(alertId).style.display = "none";
}

///
    const form = document.getElementById('eventForm');

    form.addEventListener('submit', function(event) {
      event.preventDefault();
      if (validateForm()) {
        // Form is valid, you can submit the data or perform any action here
        alert('Form submitted successfully!');
        form.reset();
      }
    });

    function validateForm() {
      let isValid = true;

      // Resetting all error messages
      const errorMessages = document.querySelectorAll('.error');
      errorMessages.forEach(function(element) {
        element.textContent = '';
      });

      // Event Name validation
      const eventName = document.getElementById('eventName').value;
      if (!eventName) {
        document.getElementById('eventNameError').textContent = 'Event Name is required';
        isValid = false;
      }

      // Event Date validation
      const eventDate = document.getElementById('eventDate').value;
      if (!eventDate) {
        document.getElementById('eventDateError').textContent = 'Date is required';
        isValid = false;
      }

      // Event Place validation
      const eventPlace = document.getElementById('eventPlace').value;
      if (!eventPlace) {
        document.getElementById('eventPlaceError').textContent = 'Place is required';
        isValid = false;
      }

      // Coordinator Name validation
      const coordinatorName = document.getElementById('coordinatorName').value;
      if (!coordinatorName) {
        document.getElementById('coordinatorNameError').textContent = 'Coordinator Name is required';
        isValid = false;
      }

      // Department validation
      const department = document.getElementById('department').value;
      if (!department) {
        document.getElementById('departmentError').textContent = 'Department is required';
        isValid = false;
      }

      // Event Photos validation
      const eventPhotos = document.getElementById('eventPhotos').files;
      if (eventPhotos.length > 4) {
        document.getElementById('eventPhotosError').textContent = 'Maximum 4 photos allowed';
        isValid = false;
      } else {
        for (let i = 0; i < eventPhotos.length; i++) {
          const photoType = eventPhotos[i].type.split('/')[1];
          if (photoType !== 'jpeg' && photoType !== 'png') {
            document.getElementById('eventPhotosError').textContent = 'Photos must be in JPEG or PNG format';
            isValid = false;
            break;
          }
        }
      }

      return isValid;
    }

  });