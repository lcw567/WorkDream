package com.cs.workdream.portfolio.model.dao;

import com.cs.workdream.common.vo.PageInfo;
import com.cs.workdream.portfolio.model.vo.Portfolio;
import com.cs.workdream.resume.controller.ResumeController;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 포트폴리오 DAO 클래스
 */
@Repository
public class PortfolioDao {

    // MyBatis 매퍼 XML의 네임스페이스 설정
    private static final String NAMESPACE = "com.cs.workdream.portfolio.model.dao.PortfolioDao";

    private static final Logger logger = LoggerFactory.getLogger(ResumeController.class);
    
    @Autowired
    private SqlSession sqlSession;

    /**
     * 새로운 포트폴리오를 추가합니다.
     * @param portfolio 추가할 포트폴리오 정보
     */
    public void insertPortfolio(Portfolio portfolio) {
        sqlSession.insert(NAMESPACE + ".insertPortfolio", portfolio);
        if (portfolio.getPortfolioId() == null) { // Integer로 변경된 경우
            throw new RuntimeException("포트폴리오 삽입 후 ID가 설정되지 않았습니다.");
        }
        logger.debug("Inserted Portfolio with ID: " + portfolio.getPortfolioId());
    
    }

    /**
     * 특정 사용자의 모든 포트폴리오를 조회합니다.
     * @param userNo 사용자 번호
     * @return 포트폴리오 목록
     */
    public List<Portfolio> selectPortfoliosByUserNo(int userNo, PageInfo pageInfo) {
        Map<String, Object> params = new HashMap<>();
        params.put("userNo", userNo);
        params.put("offset", (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit());
        params.put("limit", pageInfo.getBoardLimit());
        return sqlSession.selectList(NAMESPACE + ".selectPortfoliosByUserNo", params);
    }

    /**
     * 특정 포트폴리오 ID에 해당하는 포트폴리오를 조회합니다.
     * @param portfolioId 포트폴리오 ID
     * @return 조회된 포트폴리오 정보
     */
    public Portfolio selectPortfolioById(int portfolioId) {
        return sqlSession.selectOne(NAMESPACE + ".selectPortfolioById", portfolioId);
    }

    /**
     * 기존 포트폴리오 정보를 업데이트합니다.
     * @param portfolio 업데이트할 포트폴리오 정보
     */
    public void updatePortfolio(Portfolio portfolio) {
        sqlSession.update(NAMESPACE + ".updatePortfolio", portfolio);
    }

    /**
     * 특정 포트폴리오를 소프트 삭제(STATUS 변경)합니다.
     * @param portfolioId 삭제할 포트폴리오 ID
     */
    public void softDeletePortfolio(int portfolioId) {
        sqlSession.update(NAMESPACE + ".softDeletePortfolio", portfolioId);
    }

    /**
     * 특정 사용자의 포트폴리오 총 개수를 조회합니다.
     * @param userNo 사용자 번호
     * @return 포트폴리오 개수
     */
    public int selectPortfolioCountByUserNo(int userNo) {
        return sqlSession.selectOne(NAMESPACE + ".selectPortfolioCountByUserNo", userNo);
    }
}
