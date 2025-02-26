package com.example.demo.domain.userprofile;

import com.example.demo.core.generic.AbstractEntity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDate;
import java.time.Period;
import java.util.UUID;

@Entity
@Table(name = "user_profiles")
@NoArgsConstructor
@Getter
@Setter
@Accessors(chain = true)
@Log4j2
public class UserProfile extends AbstractEntity {

    @Column(name = "address")
    private String address;

    @Column(name = "birth_date")
    private LocalDate birthDate;

    @Column(name = "profile_picture_url")
    private String profilePictureUrl;

    @Transient
    private int age;

    @PostLoad
    public void calculateAge() {
        this.age = Period.between(birthDate, LocalDate.now()).getYears();
    }

    @PrePersist
    public void logNewUserProfileAttempt() {
        log.info("New user profile created with id: {}", this.getId());
    }

    @PreUpdate
    public void logUserProfileUpdateAttempt() {
        log.info("User profile with id: {} updated", this.getId());
    }

    @PreRemove
    public void logUserProfileRemovalAttempt() {
        log.info("User profile with id: {} removed", this.getId());
    }

    @PostPersist
    public void logNewUserProfile() {
        log.info("New user profile created with id: {}", this.getId());
        this.calculateAge();
    }

    @PostUpdate
    public void logUserProfileUpdate() {
        log.info("User profile with id: {} updated", this.getId());
        this.calculateAge();
    }

    @PostRemove
    public void logUserProfileRemoval() {
        log.info("User profile with id: {} removed", this.getId());
        this.calculateAge();
    }

    public UserProfile(UUID id, String address, LocalDate birthDate, String profilePictureUrl) {
        super(id);
        this.address = address;
        this.birthDate = birthDate;
        this.profilePictureUrl = profilePictureUrl;
    }
}
