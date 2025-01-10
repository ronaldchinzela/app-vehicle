package com.ronald.springboot.springmvc.app.controllers;

import com.ronald.springboot.springmvc.app.models.Vehicle;
import com.ronald.springboot.springmvc.app.services.VehicleService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Optional;

@Controller
@RequestMapping("/vehicles")
public class VehicleController {

    private final VehicleService vehicleService;

    public VehicleController(VehicleService vehicleService) {
        this.vehicleService = vehicleService;
    }

    @GetMapping("/view")
    public String view(Model model){
        model.addAttribute("title", "VEHÍCULOS");
        model.addAttribute("message", "Esta es una aplicación CRUD de ejemplo para el despliegue en la Nube de Azure!");
        return "view";
    }
    
    @GetMapping
    public String list(Model model){
        model.addAttribute("title", "Listado de vehículos");
        model.addAttribute("vehicles", vehicleService.findAll());
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
    public String form(Vehicle vehicle, Model model, RedirectAttributes redirectAttributes){
        String message = (vehicle.getId() != null && vehicle.getId() > 0) ? "El vehículo "
                + vehicle.getMarca() + " "
                + vehicle.getModelo()
                + " se ha actualizado con éxito!." : "El vehículo "
                + vehicle.getMarca() + " "
                + vehicle.getModelo()
                + " se ha creado con éxito!.";

        vehicleService.save(vehicle);
        redirectAttributes.addFlashAttribute("message", message);
        return "redirect:/vehicles";
    }
    
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id, RedirectAttributes redirectAttributes){
        Optional<Vehicle> optionalVehicle = vehicleService.findById(id);
        if(optionalVehicle.isPresent()){
            redirectAttributes.addFlashAttribute("success", "El vehículo " 
                    + optionalVehicle.get().getMarca() + " "
                    + optionalVehicle.get().getModelo()
                    + " ha sido eliminado con éxito!."); 
            vehicleService.delete(id);
            return "redirect:/vehicles";
        }
        redirectAttributes.addFlashAttribute("error", "Error el vehículo con el id "
                + id + " no existe en el sistema!");
        return "redirect:/vehicles";
    }

}
