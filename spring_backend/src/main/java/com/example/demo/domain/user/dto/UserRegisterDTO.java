package com.example.demo.domain.user.dto;

import com.example.demo.core.generic.AbstractDTO;
import com.example.demo.domain.userprofile.dto.UserProfileDTO;

import java.util.UUID;
import jakarta.validation.constraints.Email;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;

@NoArgsConstructor
@Getter
@Setter
@Accessors(chain = true)
public class UserRegisterDTO extends AbstractDTO {

  private UserProfileDTO userProfile;

  private String firstName;

  private String lastName;

  @Email
  private String email;

  private String password;

  public UserRegisterDTO(UUID id, String firstName, String lastName, String email, String password,
      UserProfileDTO userProfile) {
    super(id);
    this.firstName = firstName;
    this.lastName = lastName;
    this.email = email;
    this.password = password;
    this.userProfile = userProfile;
  }

}
