package com.example.tender.services;

import com.example.tender.models.User;
import com.example.tender.models.enums.Role;
import com.example.tender.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;


    public boolean createUser(User user) {
        String email = user.getEmail();
        if (userRepository.findByEmail(email) != null) return false;
        if (!user.getPassword().equals(user.getPassword2())) return false;
        user.setActive(true);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.getRoles().add(Role.ROLE_ADMIN);
        log.info("Saving new User with email: {}", email);
        userRepository.save(user);
        return true;
    }

    public List<User> list() {
        return userRepository.findAll();
    }

    public void banUser(Long id) {
        User user = userRepository.findById(id).orElse(null);
        if (user != null) {
            if (user.isActive()) {
                user.setActive(false);
                user.setPassword2("1");
                log.info("Ban user with id: {}", user.getId());
            }
            else {
                user.setActive(true);
                user.setPassword2("1");
                log.info("Unban user with id: {}", user.getId());
            }
        }
        userRepository.save(user);
    }

    public void adminChanges(User user, String firstName, String lastName, String phoneNumber) {
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setPhoneNumber(phoneNumber);
        user.setPassword2("1");
        userRepository.save(user);
    }

    public void userChange(User user, User userForm) {
        if (!userForm.getFirstName().equals("")) user.setFirstName(userForm.getFirstName());
        if (!userForm.getLastName().equals("")) user.setLastName(userForm.getLastName());
        if (!userForm.getPhoneNumber().equals("")) user.setPhoneNumber(userForm.getPhoneNumber());
        if (!userForm.getPassword().equals(""))
            user.setPassword(passwordEncoder.encode(userForm.getPassword()));
        user.setPassword2(user.getPassword());
        userRepository.save(user);
    }

    public void changeUserRoles(User user, Map<String, String> form) {
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
        user.getRoles().clear();
        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepository.save(user);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

}
