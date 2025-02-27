package com.example.demo.domain.userprofile;

import com.example.demo.domain.userprofile.dto.UserProfileDTO;
import com.example.demo.domain.userprofile.dto.UserProfileMapper;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
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

    @PostMapping({ "", "/" })
    @PreAuthorize("hasAuthority('USER_PROFILE_CREATE')")
    public ResponseEntity<UserProfile> getUserProfile(@Valid @RequestBody UserProfileDTO userProfileDTO) {
        return new ResponseEntity<>(userProfileService.save(userProfileMapper.fromUserProfileDTO(userProfileDTO)),
                HttpStatus.CREATED);
    }

    @GetMapping({ "", "/" })
    @PreAuthorize("hasAuthority('USER_PROFILE_LIST_READ')")
    public ResponseEntity<List<UserProfileDTO>> getUserProfiles(Pageable pageable) {
        return new ResponseEntity<>(userProfileMapper.toDtoList(userProfileService.findAll(pageable)), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    @PreAuthorize("(hasAuthority('USER_PROFILE_READ') && @userProfilePermissionEvaluator.userProfileEvaluator(authentication.principal.user,#id)) || hasAuthority('USER_PROFILE_LIST_READ')")
    public ResponseEntity<UserProfileDTO> getUserProfileById(@PathVariable UUID id) {
        return new ResponseEntity<>(userProfileMapper.toDto(userProfileService.findById(id)), HttpStatus.OK);
    }

    @PutMapping("/{id}")
    @PreAuthorize("(hasAuthority('USER_PROFILE_MODIFY') && @userProfilePermissionEvaluator.userProfileEvaluator(authentication.principal.user,#id)) || hasAuthority('USER_PROFILE_LIST_READ')")
    public ResponseEntity<UserProfileDTO> updateUserProfile(@PathVariable UUID id,
            @Valid @RequestBody UserProfileDTO userProfileDTO) {
        return new ResponseEntity<>(
                userProfileMapper.toDto(userProfileService.updateById(id, userProfileMapper.fromUserProfileDTO(
                        userProfileDTO))),
                HttpStatus.OK);
    }

}
