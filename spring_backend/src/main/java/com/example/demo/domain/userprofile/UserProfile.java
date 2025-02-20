package com.example.demo.domain.userprofile;

import com.example.demo.core.generic.AbstractEntity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.springframework.http.HttpStatusCode;
import org.springframework.validation.annotation.Validated;

import java.time.LocalDate;
import java.time.Period;
import java.util.UUID;

@Entity
@Table(name = "user_profiles")
@NoArgsConstructor
@Getter
@Setter
@Accessors(chain = true)
public class UserProfile extends AbstractEntity  {

    @Column(name = "address")
    private String address;

    @Column(name = "birth_date")
    private LocalDate birthDate;

    @Column(name = "profile_picture_url")
    private String profilePictureUrl;

    @Transient
    private int age;

    @PostPersist
    public void calculateAge() {
        this.age =  Period.between(birthDate, LocalDate.now()).getYears();
    }

    public UserProfile(UUID id, String address, LocalDate birthDate, String profilePictureUrl) {
        super(id);
        this.address = address;
        this.birthDate = birthDate;
        this.profilePictureUrl = profilePictureUrl;
    }
}
