package com.ronald.springboot.springmvc.app.services;

import com.ronald.springboot.springmvc.app.models.Vehicle;

import java.util.List;
import java.util.Optional;

public interface VehicleService {

    List<Vehicle> findAll();
    Optional<Vehicle> findById(Long id);
    void save(Vehicle vehicle);
    void delete(Long id);

}
