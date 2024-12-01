package com.cs.workdream.portfolio.model.dao;

import com.cs.workdream.portfolio.model.vo.Portfolio;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 포트폴리오 DAO 클래스
 */
@Repository
public class PortfolioDao {

    // MyBatis 매퍼 XML의 네임스페이스 설정
    private static final String NAMESPACE = "com.cs.workdream.portfolio.model.dao.PortfolioDao";

    @Autowired
    private SqlSession sqlSession;

    /**
     * 새로운 포트폴리오를 추가합니다.
     * @param portfolio 추가할 포트폴리오 정보
     */
    public void insertPortfolio(Portfolio portfolio) {
        sqlSession.insert(NAMESPACE + ".insertPortfolio", portfolio);
    }

    /**
     * 특정 사용자의 모든 포트폴리오를 조회합니다.
     * @param userNo 사용자 번호
     * @return 포트폴리오 목록
     */
    public List<Portfolio> selectPortfoliosByUserNo(int userNo) {
        return sqlSession.selectList(NAMESPACE + ".selectPortfoliosByUserNo", userNo);
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
}
