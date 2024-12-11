package com.cs.workdream.portfolio.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cs.workdream.common.model.vo.PageInfo;
import com.cs.workdream.portfolio.model.dao.PortfolioDao;
import com.cs.workdream.portfolio.model.vo.Portfolio;

@Service
public class PortfolioServiceImpl implements PortfolioService {

    private final PortfolioDao portfolioDao;

    @Autowired
    public PortfolioServiceImpl(PortfolioDao portfolioDao) {
        this.portfolioDao = portfolioDao;
    }

    @Override
    public void addPortfolio(Portfolio portfolio) {
        portfolioDao.insertPortfolio(portfolio);
    }

    @Override
    public List<Portfolio> getPortfoliosByUserNo(int userNo, PageInfo pageInfo) {
        return portfolioDao.selectPortfoliosByUserNo(userNo, pageInfo);
    }

    @Override
    public Portfolio getPortfolioById(int portfolioId) {
        return portfolioDao.selectPortfolioById(portfolioId);
    }

    @Override
    public void updatePortfolio(Portfolio portfolio) {
        portfolioDao.updatePortfolio(portfolio);
    }

    @Override
    public void deletePortfolio(int portfolioId) {
        portfolioDao.softDeletePortfolio(portfolioId);
    }

    @Override
    public int getPortfolioCountByUserNo(int userNo) {
        return portfolioDao.selectPortfolioCountByUserNo(userNo);
    }
}
