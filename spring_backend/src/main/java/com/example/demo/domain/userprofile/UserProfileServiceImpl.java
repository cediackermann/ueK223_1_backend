package com.example.demo.domain.userprofile;

import com.example.demo.core.generic.AbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserProfileServiceImpl extends AbstractServiceImpl<UserProfile> implements UserProfileService {

    @Autowired
    public UserProfileServiceImpl(UserProfileRepository userProfileRepository) {
        super(userProfileRepository);
    }
}
