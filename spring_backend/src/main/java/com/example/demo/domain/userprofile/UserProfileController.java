package com.example.demo.domain.userprofile;

import com.example.demo.domain.userprofile.dto.UserProfileDTO;
import com.example.demo.domain.userprofile.dto.UserProfileMapper;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@Validated
@RestController
@RequestMapping("/userprofile")
public class UserProfileController {
    private final UserProfileService userProfileService;
    private final UserProfileMapper userProfileMapper;

    @Autowired
    UserProfileController(UserProfileService userProfileService, UserProfileMapper userProfileMapper) {
        this.userProfileService = userProfileService;
        this.userProfileMapper = userProfileMapper;
    }

    @PostMapping("/")
    @PreAuthorize("hasAuthority('USER_WRITE')")
    public ResponseEntity<UserProfile> getUserProfile(@Valid @RequestBody UserProfileDTO userProfileDTO) {
        return new ResponseEntity<>(userProfileService.save(userProfileMapper.fromUserProfileDTO(userProfileDTO)),
                HttpStatus.CREATED);
    }

    @GetMapping("/")
    @PreAuthorize("hasAuthority('USER_PROFILE_READ')")
    public ResponseEntity<List<UserProfile>> getUserProfiles() {
        return new ResponseEntity<>(userProfileService.findAll(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('USER_PROFILE_READ')")
    public ResponseEntity<UserProfile> getUserProfileById(@PathVariable UUID id) {
        return new ResponseEntity<>(userProfileService.findById(id), HttpStatus.OK);
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAuthority('USER_PROFILE_MODIFY')")
    public ResponseEntity<UserProfile> updateUserProfile(@PathVariable UUID id,
            @Valid @RequestBody UserProfileDTO userProfileDTO) {
        return new ResponseEntity<>(
                userProfileService.updateById(id, userProfileMapper.fromUserProfileDTO(userProfileDTO)),
                HttpStatus.OK);
    }

}
