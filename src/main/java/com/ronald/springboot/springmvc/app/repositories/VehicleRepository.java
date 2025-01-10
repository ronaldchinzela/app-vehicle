package com.ronald.springboot.springmvc.app.repositories;

import com.ronald.springboot.springmvc.app.models.Vehicle;
import org.springframework.data.repository.CrudRepository;

public interface VehicleRepository extends CrudRepository<Vehicle, Long> {
}
