package com.cs.workdream.portfolio.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.cs.workdream.common.vo.PageInfo;
import com.cs.workdream.member.model.vo.Member;
import com.cs.workdream.portfolio.model.service.PortfolioService;
import com.cs.workdream.portfolio.model.vo.Portfolio;

/**
 * 포트폴리오 컨트롤러 클래스
 */
@Controller
@RequestMapping("/portfolio")
public class PortfolioController {

    @Autowired
    private PortfolioService portfolioService;

    /**
     * 포트폴리오 작성 페이지 표시
     */
    @GetMapping("/portfolioPost")
    public String showPortfolioPost(HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }
        return "portfolio/portfolioPost";
    }

    /**
     * 포트폴리오 저장
     */
    @PostMapping("/save")
    public String savePortfolio(@ModelAttribute Portfolio portfolio, HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }
        int userNo = loginUser.getUserNo();
        portfolio.setUserNo(userNo);
        portfolioService.addPortfolio(portfolio);
        return "redirect:/portfolio/portfolioDashboard";
    }

    /**
     * 포트폴리오 관리 대시보드 표시
     */
    @GetMapping("/portfolioDashboard")
    public String showPortfolioDashboard(
            @RequestParam(value = "page", defaultValue = "1") int currentPage,
            Model model, HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }
        int userNo = loginUser.getUserNo();

        // 페이지네이션 처리
        int listCount = portfolioService.getPortfolioCountByUserNo(userNo);
        int pageLimit = 5;    // 페이지 하단에 보여질 페이지 수
        int boardLimit = 5;   // 한 페이지에 보여질 포트폴리오 수

        int maxPage = (int) Math.ceil((double) listCount / boardLimit);
        int startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
        int endPage = startPage + pageLimit - 1;
        if (endPage > maxPage) {
            endPage = maxPage;
        }

        PageInfo pageInfo = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

        List<Portfolio> portfolios = portfolioService.getPortfoliosByUserNo(userNo, pageInfo);
        model.addAttribute("portfolios", portfolios);
        model.addAttribute("pageInfo", pageInfo);
        return "portfolio/portfolioDashboard";
    }

    /**
     * 포트폴리오 상세 보기
     */
    @GetMapping("/portfolioView")
    public String showPortfolioView(@RequestParam int id, Model model, HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }
        Portfolio portfolio = portfolioService.getPortfolioById(id);
        model.addAttribute("portfolio", portfolio);
        return "portfolio/portfolioView";
    }

    /**
     * 포트폴리오 수정 페이지 표시
     */
    @GetMapping("/portfolioEdit")
    public String showPortfolioEdit(@RequestParam int id, Model model, HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }
        Portfolio portfolio = portfolioService.getPortfolioById(id);
        model.addAttribute("portfolio", portfolio);
        return "portfolio/portfolioEdit";
    }

    /**
     * 포트폴리오 업데이트
     */
    @PostMapping("/update")
    public String updatePortfolio(@ModelAttribute Portfolio portfolio, HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }
        portfolioService.updatePortfolio(portfolio);
        return "redirect:/portfolio/portfolioDashboard";
    }

    /**
     * 포트폴리오 삭제
     */
    @PostMapping("/delete")
    public String deletePortfolio(@RequestParam int id, HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }
        portfolioService.deletePortfolio(id);
        return "redirect:/portfolio/portfolioDashboard";
    }
}
