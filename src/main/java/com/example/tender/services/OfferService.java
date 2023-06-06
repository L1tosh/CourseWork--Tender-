package com.example.tender.services;

import com.example.tender.models.Offer;
import com.example.tender.models.Product;
import com.example.tender.models.User;
import com.example.tender.repositories.OfferRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class OfferService {
    private final UserService userService;
    private final ProductService productService;
    private final OfferRepository offerRepository;

    public void createOffer(Principal principal, Offer o, Long id) {
        Offer offer = new Offer();
        offer.setUser(userService.getUserByPrincipal(principal));
        offer.setProduct(productService.getProductById(id));
        offer.setStatus(false);
        offer.setTitle(o.getTitle());
        offer.setPrice(o.getPrice());
        offer.setFilePrice(o.getFilePrice());
        offer.setDescription(o.getDescription());
        offerRepository.save(offer);
    }

    public void deleteOffer(Long id) {
        Offer offer = getOfferById(id);
        offer.getProduct().getOffers().remove(offer);
        offer.getUser().getOffers().remove(offer);
        offerRepository.delete(offer);
    }

    public Offer getOfferById(Long id) {
        return offerRepository.findById(id).orElse(null);
    }
}
