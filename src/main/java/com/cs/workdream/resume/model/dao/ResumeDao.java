package com.cs.workdream.resume.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cs.workdream.portfolio.model.vo.Portfolio;
import com.cs.workdream.resume.model.vo.Award;
import com.cs.workdream.resume.model.vo.Certificate;
import com.cs.workdream.resume.model.vo.LanguageTest;
import com.cs.workdream.resume.model.vo.Resume;
import com.cs.workdream.resume.service.ResumeServiceImpl;

@Repository
public class ResumeDao {

    @Autowired
    private SqlSessionTemplate sqlSession;
    private static final String NAMESPACE = "com.cs.workdream.resume.mapper.ResumeMapper";
    private static final Logger logger = LoggerFactory.getLogger(ResumeServiceImpl.class);

    // 이력서 기본 정보 삽입
    public boolean insertResume(Resume resume) {
        int result = sqlSession.insert(NAMESPACE + ".insertResume", resume);
        return result > 0;
    }

    // 자격증 삽입
    public boolean insertCertificate(Certificate certificate) {
        int result = sqlSession.insert(NAMESPACE + ".insertCertificate", certificate);
        return result > 0;
    }

    // 어학시험 삽입
    public boolean insertLanguageTest(LanguageTest languageTest) {
        int result = sqlSession.insert(NAMESPACE + ".insertLanguageTest", languageTest);
        return result > 0;
    }

    // 수상내역 삽입
    public boolean insertAward(Award award) {
        int result = sqlSession.insert(NAMESPACE + ".insertAward", award);
        return result > 0;
    }

    // 이력서 목록 조회
    public List<Resume> selectResumesByPersonNo(int personNo) {
        return sqlSession.selectList(NAMESPACE + ".selectResumesByPersonNo", personNo);
    }

    // 이력서 상세 조회
    public Resume selectResumeById(int resumeNo) {
        return sqlSession.selectOne(NAMESPACE + ".selectResumeById", resumeNo);
    }
    
    // 자격증 목록 조회
    public List<Certificate> selectCertificatesByResumeNo(int resumeNo) {
        return sqlSession.selectList(NAMESPACE + ".selectCertificatesByResumeNo", resumeNo);
    }

    // 어학시험 목록 조회
    public List<LanguageTest> selectLanguageTestsByResumeNo(int resumeNo) {
        return sqlSession.selectList(NAMESPACE + ".selectLanguageTestsByResumeNo", resumeNo);
    }

    // 수상내역 목록 조회
    public List<Award> selectAwardsByResumeNo(int resumeNo) {
        return sqlSession.selectList(NAMESPACE + ".selectAwardsByResumeNo", resumeNo);
    }

    // 이력서 업데이트
    public int updateResume(Resume resume) {
        return sqlSession.update(NAMESPACE + ".updateResume", resume);
    }

    // 이력서 삭제
    public int deleteResumeById(int resumeNo) {
        return sqlSession.update(NAMESPACE + ".deleteResume", resumeNo);
    }

    // 자격증 삭제
    public int deleteCertificatesByResumeNo(int resumeNo) {
        return sqlSession.delete(NAMESPACE + ".deleteCertificatesByResumeNo", resumeNo);
    }

    // 어학시험 삭제
    public int deleteLanguageTestsByResumeNo(int resumeNo) {
        return sqlSession.delete(NAMESPACE + ".deleteLanguageTestsByResumeNo", resumeNo);
    }

    // 수상내역 삭제
    public int deleteAwardsByResumeNo(int resumeNo) {
        return sqlSession.delete(NAMESPACE + ".deleteAwardsByResumeNo", resumeNo);
    }
    
    public Resume selectResumeByNo(int resumeNo) {
        return sqlSession.selectOne(NAMESPACE + ".selectResumeByNo", resumeNo);
    }
    
    public List<Portfolio> selectPortfoliosByUserNo(int userNo) {
        return sqlSession.selectList(NAMESPACE + ".selectPortfoliosByUserNo", userNo);
    }
    
    public List<Portfolio> selectPortfoliosByIds(List<Integer> portfolioIds) {
        return sqlSession.selectList(NAMESPACE + ".selectPortfoliosByIds", portfolioIds);
    }
    
    // 포트폴리오를 이력서에 연결
    public void insertResumePortfolio(int resumeNo, int portfolioId) {
        Map<String, Integer> params = new HashMap<>();
        params.put("resumeNo", resumeNo);
        params.put("portfolioId", portfolioId);

        sqlSession.insert(NAMESPACE + ".insertResumePortfolio", params);
    }

    // 포트폴리오 업데이트: resume_no 변경
    public void updatePortfolioResumeNo(int portfolioId, int resumeNo) {
        Map<String, Integer> params = new HashMap<>();
        params.put("portfolioId", portfolioId);
        params.put("resumeNo", resumeNo);
        sqlSession.update(NAMESPACE + ".updatePortfolioResumeNo", params);
    }

    
    // 포트폴리오 삭제 by resume_no
    public void deletePortfoliosByResumeNo(int resumeNo) {
        sqlSession.delete(NAMESPACE + ".deletePortfoliosByResumeNo", resumeNo);
    }
    
    // 포트폴리오 목록 조회 by resumeNo
    public List<Portfolio> selectPortfoliosByResumeNo(int resumeNo) {
        return sqlSession.selectList(NAMESPACE + ".selectPortfoliosByResumeNo", resumeNo);
    }

}
