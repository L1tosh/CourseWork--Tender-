package com.example.tender.controllers;

import com.example.tender.models.User;
import com.example.tender.repositories.UserRepository;
import com.example.tender.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;

    @GetMapping("/login")
    public String login(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "login";
    }

    @GetMapping("/registration")
    public String registration(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "registration";
    }

    @PostMapping("/registration")
    public String createUser(@Valid User user, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "registration";
        }
        if (!userService.createUser(user)) {
            model.addAttribute("errorMessage", "Email: " + user.getEmail() + " exist");
            return "registration";
        }
        return "redirect:/login";

    }

    @GetMapping("user/{user}")
    public String userInfo(@PathVariable("user") User user, Principal principal, Model model) {
        model.addAttribute("userInfo", user);
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("products", user.getProducts());
        model.addAttribute("offers", user.getOffers());
        return "user-info";
    }

    @GetMapping("/profile")
    public String user(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "profile";
    }

    @PostMapping("/profile/edit")
    public String userEdit(Principal principal, @ModelAttribute("user") User user) {
        userService.userChange(userService.getUserByPrincipal(principal), user);
        return "redirect:/profile";
    }

    @GetMapping("/users")
    public String getUsers(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("users", userService.list());
        return "users";
    }

}