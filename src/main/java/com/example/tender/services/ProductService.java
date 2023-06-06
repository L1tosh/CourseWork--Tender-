package com.example.tender.services;

import com.example.tender.models.Offer;
import com.example.tender.models.Product;
import com.example.tender.models.User;
import com.example.tender.repositories.OfferRepository;
import com.example.tender.repositories.ProductRepository;
import com.example.tender.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepository productRepository;
    private final UserRepository userRepository;
    private final OfferRepository offerRepository;

    public List<Product> listProducts(String title) {
        if (title != null)
            if (productRepository.findByTitle(title).size() != 0)
                return productRepository.findByTitle(title);
        return productRepository.findAll();
    }

    public void saveProduct(Principal principal, Product product) {
        product.setUser(getUserByPrincipal(principal));
        product.setActive(true);
        product.setViews(0);
        log.info("Saving new Product. Title: {}; Author email: {}", product.getTitle(), product.getUser().getEmail());
        productRepository.save(product);
    }

    public void editProduct(Product product, Long id) {
        Product prod = productRepository.getById(id);
        prod.setTitle(product.getTitle());
        prod.setCompany(product.getCompany());
        prod.setCity(product.getCity());
        prod.setPrice(product.getPrice());
        prod.setTimeStart(product.getTimeStart());
        prod.setTimeEnd(product.getTimeEnd());
        prod.setLittleDescription(product.getLittleDescription());
        prod.setDescription(product.getDescription());
        productRepository.save(prod);
    }

    public void closeProduct(Long id) {
        Product product = getProductById(id);
        product.setActive(false);
        Offer offer = new Offer();
        int maxPrice = product.getPrice();
        for (Offer off: product.getOffers()) {
            if (off.getPrice() < maxPrice) {
                offer = off;
                maxPrice = off.getPrice();
            }
        }
        offer.setStatus(true);
        productRepository.save(product);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public void deleteProduct(Long id) {
        List<Offer> offers = offerRepository.findByProductId(id);
        Product p = getProductById(id);
        p.getUser().getProducts().remove(p);
        offers.forEach(offer -> {
            offer.getProduct().getOffers().remove(offer);
            offer.getUser().getOffers().remove(offer);
            offerRepository.delete(offer);
        });
        productRepository.deleteById(id);
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }

    public void raiseViews(Product product) {
        int views = product.getViews();
        product.setViews(++views);
        productRepository.save(product);
    }
}
