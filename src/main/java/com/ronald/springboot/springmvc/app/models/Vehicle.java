package com.ronald.springboot.springmvc.app.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.PositiveOrZero;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Table(name = "vehicle")
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
public class Vehicle {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "codigo_registro", length = 10, unique = true)
    private String codigoRegistro;

    @NotEmpty(message = "La marca no puede estar vacía")
    @Size(min = 2, max = 50, message = "La marca debe tener entre 2 y 50 caracteres")
    private String marca;

    @NotEmpty(message = "El modelo no puede estar vacío")
    @Size(min = 2, max = 50, message = "El modelo debe tener entre 2 y 50 caracteres")
    private String modelo;

    @NotEmpty(message = "El color no puede estar vacío")
    @Size(min = 3, max = 30, message = "El color debe tener entre 3 y 30 caracteres")
    @Pattern(regexp = "^[a-zA-ZáéíóúÁÉÍÓÚñÑ ]+$", message = "El color solo puede contener letras y espacios")
    private String color;

    @NotNull(message = "El precio no puede ser nulo")
    @Positive(message = "El precio debe ser mayor a 0")
    private Double precio;

    @NotNull(message = "El stock no puede ser nulo")
    @PositiveOrZero(message = "El stock debe ser 0 o mayor")
    private Integer stock;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @PrePersist
    public void prePersist() {
        this.createdAt = LocalDateTime.now();
        generarCodigoRegistro();
    }

    public void generarCodigoRegistro() {
        if (this.marca != null && this.modelo != null && this.id != null) {
            this.codigoRegistro = (this.marca.charAt(0) + "" + this.modelo.charAt(0) + "0" + this.id).toUpperCase();
        }
    }

}
