package com.example.demo.domain.userprofile.dto;

import com.example.demo.domain.userprofile.UserProfile;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;
import org.mapstruct.ReportingPolicy;

import java.time.LocalDate;
import java.time.Period;
import java.util.List;

@Mapper(componentModel = "spring", unmappedSourcePolicy = ReportingPolicy.IGNORE)
public interface UserProfileMapper {
    @Mapping(source = "birthDate", target = "age", qualifiedByName = "calculateAge")
    UserProfile fromUserProfileDTO(UserProfileDTO dto);

    @Named("calculateAge")
    static int calculateAge(LocalDate birthdate) {
        return Period.between(birthdate, LocalDate.now()).getYears();
    }

    List<UserProfileDTO> toDtoList(List<UserProfile> dtos);

    UserProfileDTO toDto(UserProfile dto);

}
