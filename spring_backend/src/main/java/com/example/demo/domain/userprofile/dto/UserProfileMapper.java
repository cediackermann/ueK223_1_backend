package com.example.demo.domain.userprofile.dto;

import com.example.demo.domain.user.User;
import com.example.demo.domain.userprofile.UserProfile;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;
import org.mapstruct.ReportingPolicy;

import java.time.LocalDate;
import java.time.Period;

@Mapper(componentModel = "spring", unmappedSourcePolicy = ReportingPolicy.IGNORE)
public interface UserProfileMapper {
    @Mapping(source = "birthDate", target = "age", qualifiedByName = "calculateAge")
    UserProfile fromUserProfileDTO(UserProfileDTO dto);

    @Named("calculateAge")
    static int calculateAge(LocalDate birthdate) {
        return  Period.between(birthdate, LocalDate.now()).getYears();
    }


}

