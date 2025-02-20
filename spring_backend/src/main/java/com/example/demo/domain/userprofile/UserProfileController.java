package com.example.demo.domain.userprofile;

import com.example.demo.domain.userprofile.dto.UserProfileDTO;
import com.example.demo.domain.userprofile.dto.UserProfileMapper;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Validated
@RestController
@RequestMapping("/userprofile")
public class UserProfileController {
    private final UserProfileService userProfileService;
    private final UserProfileMapper userProfileMapper;

    @Autowired UserProfileController(UserProfileService userProfileService, UserProfileMapper userProfileMapper) {
        this.userProfileService = userProfileService;
        this.userProfileMapper = userProfileMapper;
    }

    @PostMapping("/")
    public ResponseEntity<UserProfile> getUserProfile(@Valid @RequestBody UserProfileDTO userProfileDTO) {
       return new ResponseEntity<>(userProfileService.save(userProfileMapper.fromUserProfileDTO(userProfileDTO)), HttpStatus.CREATED);
    }

    @GetMapping("/")
    public ResponseEntity<List<UserProfile>> getUserProfiles() {
        return new ResponseEntity<>(userProfileService.findAll(), HttpStatus.OK);
    }
}
