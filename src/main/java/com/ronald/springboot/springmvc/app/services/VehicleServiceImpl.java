package com.ronald.springboot.springmvc.app.services;

import com.ronald.springboot.springmvc.app.models.Vehicle;
import com.ronald.springboot.springmvc.app.repositories.VehicleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.Optional;

@Service
public class VehicleServiceImpl implements VehicleService {

    private final VehicleRepository vehicleRepository;

    @Autowired
    public VehicleServiceImpl(VehicleRepository vehicleRepository) {
        this.vehicleRepository = vehicleRepository;
    }

    @Transactional(readOnly = true)
    @Override
    public Page<Vehicle> findAllPaginated(int page, int size) {
        if (page < 0) page = 0;
        if (size <= 0) size = 15;

        Pageable pageable = PageRequest.of(page, size);
        return vehicleRepository.findAll(pageable);
    }

    @Transactional(readOnly = true)
    @Override
    public Optional<Vehicle> findById(Long id) {
        return vehicleRepository.findById(id);
    }

    @Transactional
    @Override
    public void save(Vehicle vehicle) {
        Vehicle savedVehicle = vehicleRepository.save(vehicle);
        savedVehicle.generarCodigoRegistro();
        vehicleRepository.save(savedVehicle);
    }

    @Transactional
    @Override
    public void delete(Long id) {
        vehicleRepository.deleteById(id);
    }
}
