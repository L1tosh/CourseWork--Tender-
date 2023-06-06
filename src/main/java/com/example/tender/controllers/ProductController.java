package com.example.tender.controllers;

import com.example.tender.models.Product;
import com.example.tender.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class ProductController {
    private final ProductService productService;

    @GetMapping("/")
    public String products(@RequestParam(name = "title", required = false) String title, Principal principal, Model model) {
        model.addAttribute("products", productService.listProducts(title));
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        return "product";
    }

    @GetMapping("/product/{id}")
    public String productInfo(@PathVariable Long id, Principal principal, Model model) {
        Product product = productService.getProductById(id);
        productService.raiseViews(product);
        model.addAttribute("product", product);
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        return "product-info";
    }

    @PostMapping("/product/create")
    public String createProduct(Product product, Principal principal) {
        productService.saveProduct(principal, product);
        return "redirect:/";
    }

    @PostMapping("/product/delete/{id}")
    public String deleteProduct(@PathVariable Long id, Principal principal, Model model) {
        productService.deleteProduct(id);
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        return "redirect:/profile";
    }

    @PostMapping("/product/close/{id}")
    public String closeProduct(@PathVariable Long id, Principal principal, Model model) {
        productService.closeProduct(id);
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        return "redirect:/profile";
    }

    @GetMapping("/product/edit/{id}")
    public String editProduct(@PathVariable Long id, Principal principal, Model model) {
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        return "product-edit";
    }

    @PostMapping("/product/edit/{id}")
    public String edit(@PathVariable Long id, @ModelAttribute("product") Product product, Principal principal, Model model) {
        System.out.println(product.getTitle());
        productService.editProduct(product, id);
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        return "redirect:/profile";
    }
}
