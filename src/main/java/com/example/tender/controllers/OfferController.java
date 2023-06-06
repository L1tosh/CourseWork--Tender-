package com.example.tender.controllers;

import com.example.tender.models.Offer;
import com.example.tender.services.OfferService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class OfferController {
    private final OfferService offerService;

    @PostMapping("/{id}/offer/add")
    public String createOffer(@PathVariable Long id, Principal principal, @ModelAttribute("offer") Offer offer) {
        offerService.createOffer(principal, offer, id);
        return "redirect:/";
    }

    @PostMapping("offer/delete/{id}")
    public String deleteOffer(@PathVariable Long id) {
        offerService.deleteOffer(id);
        return "redirect:/";
    }
}
