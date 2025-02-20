package com.example.demo.domain.userprofile.dto;

import com.example.demo.core.generic.AbstractDTO;
import jakarta.persistence.Transient;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.time.LocalDate;
import java.time.Period;
import java.util.UUID;

@NoArgsConstructor
@Getter
@Setter
@Accessors(chain = true)
public class UserProfileDTO extends AbstractDTO {
    private String address;
    private LocalDate birthDate;
    private String profilePictureUrl;
    private int age;

    public UserProfileDTO(UUID id, String address, LocalDate birthDate, String profilePictureUrl) {
        super(id);
        this.address = address;
        this.birthDate = birthDate;
        this.profilePictureUrl = profilePictureUrl;
    }


}
