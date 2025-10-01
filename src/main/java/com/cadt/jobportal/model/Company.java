package com.cadt.jobportal.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "company")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Company {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 150)
    private String name;

    private String website;

    @Lob
    private String description;
}
