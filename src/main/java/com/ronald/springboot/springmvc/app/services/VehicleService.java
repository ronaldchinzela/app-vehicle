package com.ronald.springboot.springmvc.app.services;

import com.ronald.springboot.springmvc.app.models.Vehicle;
import org.springframework.data.domain.Page;

import java.util.Optional;

public interface VehicleService {

    Page<Vehicle> findAllPaginated(int page, int size);
    Optional<Vehicle> findById(Long id);
    void save(Vehicle vehicle);
    void delete(Long id);

}
