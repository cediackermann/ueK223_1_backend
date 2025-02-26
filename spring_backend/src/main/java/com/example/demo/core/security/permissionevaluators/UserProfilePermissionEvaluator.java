package com.example.demo.core.security.permissionevaluators;

import java.util.UUID;

import org.springframework.stereotype.Component;

import com.example.demo.domain.user.User;

import lombok.NoArgsConstructor;

@Component
@NoArgsConstructor
public class UserProfilePermissionEvaluator {

    public boolean userProfileEvaluator(User principal, UUID id) {
        if (principal.getUserProfile().getId().equals(id)) {
            return true;
        } else {
            return false;
        }
    }

}
