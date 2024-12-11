package com.cs.workdream.portfolio.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cs.workdream.common.model.vo.PageInfo;
import com.cs.workdream.member.model.vo.Member;
import com.cs.workdream.portfolio.model.service.PortfolioService;
import com.cs.workdream.portfolio.model.vo.Portfolio;
import com.cs.workdream.resume.controller.ResumeController;
import com.cs.workdream.resume.service.ResumeService;

/**
 * 포트폴리오 컨트롤러 클래스
 */
@Controller
@RequestMapping("/portfolio")
public class PortfolioController {
	
	private static final Logger logger = LoggerFactory.getLogger(ResumeController.class);

    @Autowired
    private PortfolioService portfolioService;
    
    @Autowired
    private ResumeService resumeService;

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
    public String savePortfolio(@ModelAttribute Portfolio portfolio, HttpSession session, RedirectAttributes redirectAttributes) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }
        int userNo = loginUser.getUserNo();
        portfolio.setUserNo(userNo);

        // 사용자가 선택한 이력서 번호 설정
        // 폼에서 resumeNo를 전송받아 설정
        // 폼에 'resumeNo' 필드가 반드시 포함되어야 합니다
        // 예: <input type="hidden" name="resumeNo" value="${selectedResumeNo}" />
        // 폼이 이를 포함하지 않으면 resumeNo가 0으로 설정될 수 있습니다

        // 로그를 통해 resumeNo 확인
        logger.debug("Saving portfolio with resumeNo: {}", portfolio.getResumeNo());

        try {
            portfolioService.addPortfolio(portfolio);
            redirectAttributes.addFlashAttribute("message", "포트폴리오가 성공적으로 저장되었습니다.");
            return "redirect:/portfolio/portfolioDashboard";
        } catch (IllegalArgumentException e) {
            logger.warn("포트폴리오 저장 경고: {}", e.getMessage());
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return "redirect:/portfolio/portfolioPost";
        } catch (Exception e) {
            logger.error("포트폴리오 저장 중 오류 발생: ", e);
            redirectAttributes.addFlashAttribute("error", "포트폴리오 저장에 실패했습니다.");
            return "redirect:/portfolio/portfolioPost";
        }
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
