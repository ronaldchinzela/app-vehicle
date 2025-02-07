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

// FUNCIÓN PARA DAR FORMATO A LOS PRECIOS CON EL SÍMBOLO US$
function formatPrice(price) {
    price = parseFloat(price);
    if (isNaN(price)) return 'US$ 0.00';
    return 'US$ ' + price.toLocaleString('en-US', {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
}

// FUNCIÓN PARA FORMATEAR TODOS LOS PRECIOS EN LA TABLA
function formatAllPrices() {
    $('td[data-price]').each(function () {
        let price = parseFloat($(this).text().replace(/[^\d.-]/g, ''));
        $(this).text(formatPrice(price));
    });
}

// FUNCIÓN PARA CARGAR UNA NUEVA PÁGINA CON AJAX Y FORMATEAR LOS PRECIOS
function loadPage(page) {
    let size = 15;
    $.ajax({
        url: '/vehicles?page=' + page + '&size=' + size,
        type: 'GET',
        success: function(response) {
            $('#vehicle-table').html($(response).find('#vehicle-table').html());
            $('.pagination').html($(response).find('.pagination').html());
            formatAllPrices();
        },
        error: function() {
            alert('Error cargando la página');
        }
    });
}

// EJECUTAR EL FORMATO AL CARGAR LA PÁGINA POR PRIMERA VEZ
$(document).ready(function() {
    formatAllPrices();

    $(document).on('click', '.pagination a', function(e) {
        e.preventDefault();
        let page = $(this).data('page');

        if (typeof page === "undefined") {
            console.error('Error: data-page no definido en el enlace de paginación', this);
            return;
        }
        loadPage(page);
    });
});

//EJECUTAR MENSAJE ESTRUCTURADO EN CONFIRM AL MOMENTO DE ELIMINAR UNB VEHÍCULO:
function confirmDelete(marca, modelo, id) {
    return confirm(`Está seguro que desea eliminar el vehículo ${marca} ${modelo} con ID ${id}?`);
}








