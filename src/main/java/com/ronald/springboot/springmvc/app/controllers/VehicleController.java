package com.ronald.springboot.springmvc.app.controllers;

import com.ronald.springboot.springmvc.app.models.Vehicle;
import com.ronald.springboot.springmvc.app.services.VehicleService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.data.domain.Page;

import java.util.Optional;

@Controller
@RequestMapping("/vehicles")
@SessionAttributes({"vehicle"})
public class VehicleController {

    private final VehicleService vehicleService;

    public VehicleController(VehicleService vehicleService) {
        this.vehicleService = vehicleService;
    }

    /**
     * Método para listar los vehículos con paginación.
     * @param page número de la página actual (por defecto 0).
     * @param size cantidad de vehículos por página (por defecto 15).
     * @param model modelo de Spring para pasar datos a la vista.
     * @return la vista "list" con la lista de vehículos.
     */
    @GetMapping
    public String list(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "15") int size,
            Model model) {

        Page<Vehicle> vehiclesPage = vehicleService.findAllPaginated(page, size);

        if (vehiclesPage.isEmpty() && page > 0) {
            return "redirect:/vehicles?page=" + (page - 1);
        }

        model.addAttribute("title", "Listado de vehículos");
        model.addAttribute("vehicles", vehiclesPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", vehiclesPage.getTotalPages());
        model.addAttribute("totalElements", vehiclesPage.getTotalElements());

        return "list";
    }

    /**
     * Método para mostrar el formulario de creación de un nuevo vehículo.
     * @param model modelo de Spring para pasar datos a la vista.
     * @return la vista "form" con un nuevo objeto Vehicle vacío.
     */
    @GetMapping("/form")
    public String form(Model model){
        model.addAttribute("vehicle", new Vehicle());
        model.addAttribute("title", "Crear Vehículo");
        return "form";
    }

    /**
     * Método para mostrar el formulario de edición de un vehículo existente.
     * @param id identificador del vehículo a editar.
     * @param page número de la página actual para mantener la navegación.
     * @param model modelo de Spring para pasar datos a la vista.
     * @param redirectAttributes atributos para mensajes de redirección.
     * @return la vista "form" si el vehículo existe, de lo contrario, redirige a la lista de vehículos.
     */
    @GetMapping("/form/{id}")
    public String form(@PathVariable Long id,
                       @RequestParam(defaultValue = "0") int page,
                       Model model,
                       RedirectAttributes redirectAttributes) {
        Optional<Vehicle> optionalVehicle = vehicleService.findById(id);
        if(optionalVehicle.isPresent()) {
            model.addAttribute("vehicle", optionalVehicle.get());
            model.addAttribute("title", "Editar Vehículo");
            model.addAttribute("currentPage", page);
            return "form";
        } else {
            redirectAttributes.addFlashAttribute("error", "El vehículo con id " + id + " no existe en la base de datos!.");
            return "redirect:/vehicles?page=" + page;
        }
    }

    /**
     * Guarda un vehículo en la base de datos (creación o actualización).
     * Este método valida los datos del formulario y guarda un nuevo vehículo o actualiza uno existente.
     * Si el vehículo es nuevo, genera automáticamente un código de registro basado en la marca y el modelo.
     * @param vehicle objeto Vehicle validado desde el formulario.
     * @param result resultado de la validación del formulario.
     * @param page número de la página actual.
     * @param model modelo de Spring para pasar datos a la vista.
     * @param redirectAttributes atributos para mensajes de redirección.
     * @param status estado de la sesión para completar la transacción.
     * @return redirección a la lista de vehículos si la operación es exitosa, de lo contrario, vuelve al formulario.
     */
    @PostMapping
    public String form(@Valid Vehicle vehicle, BindingResult result,
                       @RequestParam(defaultValue = "0") int page,
                       Model model, RedirectAttributes redirectAttributes, SessionStatus status) {
        System.out.println("Página recibida: " + page);
        if (result.hasErrors()) {
            model.addAttribute("title", "Validando Formulario");
            return "form";
        }

        boolean isNew = (vehicle.getId() == null || vehicle.getId() == 0);

        String newCodigoRegistro = generateCodigoRegistro(vehicle);
        vehicle.setCodigoRegistro(newCodigoRegistro);

        vehicleService.save(vehicle);
        status.setComplete();

        String message = isNew
                ? "El vehículo <b>" + vehicle.getMarca() + " " + vehicle.getModelo() + "</b> se ha creado con éxito!"
                : "El vehículo <b>" + vehicle.getMarca() + " " + vehicle.getModelo() + "</b> de código <b>" + vehicle.getCodigoRegistro() + "</b> se ha actualizado con éxito!";

        redirectAttributes.addFlashAttribute("success", message);
        return "redirect:/vehicles?page=" + page;
    }

    /**
     * Genera un código de registro único para el vehículo.
     * El código de registro se genera utilizando la primera letra de la marca y del modelo, seguido de un número secuencial basado en el ID.
     * @param vehicle el vehículo para el que se generará el código de registro.
     * @return el código de registro generado.
     */
    private String generateCodigoRegistro(Vehicle vehicle) {
        return vehicle.getMarca().substring(0, 1).toUpperCase() +
                vehicle.getModelo().substring(0, 1).toUpperCase() +
                "0" + vehicle.getId();
    }

    /**
     * Método para eliminar un vehículo por su ID.
     * @param id identificador del vehículo a eliminar.
     * @param page número de la página actual.
     * @param redirectAttributes atributos para mensajes de redirección.
     * @return redirección a la lista de vehículos con un mensaje de éxito o error.
     */
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id,
                         @RequestParam(defaultValue = "0") int page,
                         RedirectAttributes redirectAttributes) {
        Optional<Vehicle> optionalVehicle = vehicleService.findById(id);

        if (optionalVehicle.isPresent()) {
            Vehicle vehicle = optionalVehicle.get();
            redirectAttributes.addFlashAttribute("success", "El vehículo <b>"
                    + vehicle.getMarca() + " "
                    + vehicle.getModelo()
                    + "</b> de código <b>" + vehicle.getCodigoRegistro()
                    + "</b> ha sido eliminado con éxito!");
            vehicleService.delete(id);
        } else {
            redirectAttributes.addFlashAttribute("error", "Error: El vehículo seleccionado no se encontró en el sistema.");
        }
        return "redirect:/vehicles?page=" + page;
    }

}