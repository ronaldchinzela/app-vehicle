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

    @GetMapping
    public String list(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "15") int size,
            Model model) {
        Page<Vehicle> vehiclesPage = vehicleService.findAllPaginated(page, size);
        model.addAttribute("title", "Listado de vehículos");
        model.addAttribute("vehicles", vehiclesPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", vehiclesPage.getTotalPages());
        model.addAttribute("totalElements", vehiclesPage.getTotalElements());

        return "list";
    }
    
    //Crear vehículo
    @GetMapping("/form")
    public String form(Model model){
        model.addAttribute("vehicle", new Vehicle());
        model.addAttribute("title", "Crear Vehículo");
        return "form";
    }

    //Editar vehículo
    @GetMapping("/form/{id}")
    public String form(@PathVariable Long id, Model model, RedirectAttributes redirectAttributes){
        Optional<Vehicle> optionalVehicle = vehicleService.findById(id);
        if(optionalVehicle.isPresent()){
            model.addAttribute("vehicle", optionalVehicle.get());
            model.addAttribute("title", "Editar Vehículo");
            return "form";
        }else {
            redirectAttributes.addFlashAttribute("error", "El vehículo con id " 
                    + id + " no existe en la base de datos!.");
            return "redirect:/vehicles";
        }
    }

    @PostMapping
    public String form(@Valid Vehicle vehicle, BindingResult result, Model model, RedirectAttributes redirectAttributes, SessionStatus status) {

        if (result.hasErrors()) {
            model.addAttribute("title", "Validando Formulario");
            return "form";
        }

        vehicleService.save(vehicle);
        status.setComplete();

        String message = (vehicle.getId() != null && vehicle.getId() > 0)
                ? "El vehículo <b>" + vehicle.getMarca() + " " + vehicle.getModelo() + "</b> con ID <b>" + vehicle.getId() + "</b> se ha actualizado con éxito!"
                : "El vehículo <b>" + vehicle.getMarca() + " " + vehicle.getModelo() + "</b> se ha creado con éxito!";

        redirectAttributes.addFlashAttribute("success", message);
        return "redirect:/vehicles";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        Optional<Vehicle> optionalVehicle = vehicleService.findById(id);

        if (optionalVehicle.isPresent()) {
            Vehicle vehicle = optionalVehicle.get();
            redirectAttributes.addFlashAttribute("success", "El vehículo <b>"
                    + vehicle.getMarca() + " "
                    + vehicle.getModelo()
                    + "</b> con ID <b>" + id
                    + "</b> ha sido eliminado con éxito!");
            vehicleService.delete(id);
        } else {
            redirectAttributes.addFlashAttribute("error", "Error: el vehículo con ID <b>"
                    + id + "</b> no existe en el sistema!");
        }
        return "redirect:/vehicles";
    }

}
