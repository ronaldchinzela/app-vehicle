//TIEMPO DE 6 SEGUNDOS PARA QUE DESPAREZCA EL ALERT
document.addEventListener("DOMContentLoaded", function () {

    const errorAlert = document.getElementById("error-alert");
    const successAlert = document.getElementById("success-alert");

    const fadeOutAlert = (alertElement) => {
        alertElement.style.opacity = "0";
        alertElement.style.backgroundColor = "#f8d7da";

        setTimeout(() => {
            alertElement.style.display = "none";
        }, 1000);
    };

    if (errorAlert) {
        setTimeout(() => {
            fadeOutAlert(errorAlert);
        }, 5000);
    }

    if (successAlert) {
        setTimeout(() => {
            fadeOutAlert(successAlert);
        }, 5000);
    }

});
