//TIEMPO DE 6 SEGUNDOS PARA QUE DESPAREZCA EL DIV DEL ALERT
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

//FORMATO PARA LOS PRECIOS EN TODA LA TABLA
function formatPrice(price) {
    return 'US$ ' + price.toLocaleString('en-US', {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
}

document.addEventListener('DOMContentLoaded', function () {
    const priceCells = document.querySelectorAll('td[data-price]');
    priceCells.forEach(function(cell) {
        let price = parseFloat(cell.textContent.replace(/[^\d.-]/g, ''));
        cell.textContent = formatPrice(price);
    });
});

//MANEJO DE LA PAGINACIÓN CON AJAX
function loadPage(page) {
    var size = 15;
    $.ajax({
        url: '/vehicles?page=' + page + '&size=' + size,
        type: 'GET',
        success: function(response) {
            $('#vehicle-table').html($(response).find('#vehicle-table').html());
            $('.pagination').html($(response).find('.pagination').html());
        },
        error: function() {
            alert('Error cargando la página');
        }
    });
}




