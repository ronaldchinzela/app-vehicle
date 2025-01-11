package com.ronald.springboot.springmvc.app.repositories;

import com.ronald.springboot.springmvc.app.models.Vehicle;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VehicleRepository extends JpaRepository<Vehicle, Long> {
}
