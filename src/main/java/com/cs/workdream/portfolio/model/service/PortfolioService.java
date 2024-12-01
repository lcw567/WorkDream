package com.cs.workdream.portfolio.model.service;

import com.cs.workdream.portfolio.model.vo.Portfolio;
import java.util.List;

public interface PortfolioService {
    void addPortfolio(Portfolio portfolio);
    List<Portfolio> getPortfoliosByUserNo(int userNo);
    Portfolio getPortfolioById(int portfolioId);
    void updatePortfolio(Portfolio portfolio);
    void deletePortfolio(int portfolioId);
}