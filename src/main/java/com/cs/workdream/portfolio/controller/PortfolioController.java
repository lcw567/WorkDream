package com.cs.workdream.portfolio.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/portfolio")
public class PortfolioController {

    @GetMapping("/portfolioPost")
    public String showPortfolioPost() {
        return "portfolio/portfolioPost"; 
    }

    @GetMapping("/portfolioDashboard")
    public String showPortfolioDashboard() {
        return "portfolio/portfolioDashboard"; 
    }
    
    @GetMapping("/portfolioView")
    public String showPortfolioView() {
        return "portfolio/portfolioView"; 
    }

    @GetMapping("/portfolioEdit")
    public String showPortfolioEdit() {
        return "portfolio/portfolioEdit"; 
    }
    
    
}




