package com.cs.workdream.resume.service;

import java.util.List;

import com.cs.workdream.portfolio.model.vo.Portfolio;
import com.cs.workdream.resume.model.vo.Award;
import com.cs.workdream.resume.model.vo.Certificate;
import com.cs.workdream.resume.model.vo.LanguageTest;
import com.cs.workdream.resume.model.vo.Resume;
import com.cs.workdream.selfintro.model.vo.SelfIntro;

public interface ResumeService {
	public boolean saveResume(Resume resume);
    List<Resume> getResumesByPersonNo(int personNo);
    Resume getResumeById(int resumeNo);
    boolean updateResume(Resume resume, List<Certificate> certificates, List<LanguageTest> languageTests, List<Award> awards);
    int deleteResumeById(int resumeNo);

    // New methods to handle certificates, language tests, and awards
    void deleteCertificatesByResumeNo(int resumeNo);
    void insertCertificate(Certificate certificate);
    void deleteLanguageTestsByResumeNo(int resumeNo);
    void insertLanguageTest(LanguageTest languageTest);
    void deleteAwardsByResumeNo(int resumeNo);
    void insertAward(Award award);
    Resume getResumeByNo(int resumeNo);
    List<Portfolio> getPortfoliosByUserNo(int userNo);
    List<Portfolio> getPortfoliosByIds(List<Integer> portfolioIds);
    void associatePortfoliosWithResume(int resumeNo, List<Integer> portfolioIds);
    void updatePortfolioResumeNo(int portfolioId, int resumeNo);
    List<Portfolio> getPortfoliosByResumeNo(int resumeNo);
    
    List<SelfIntro> getSelfIntrosByUserNo(int userNo);
    List<SelfIntro> getSelfIntrosByIds(List<Integer> selfIntroIds);
    void associateSelfIntroWithResume(int resumeNo, List<Integer> selfintroIds);
    void updateSeflintroResumeNo(int selfintroNo, int resumeNo);
    List<SelfIntro> getSelfIntrosByResumeNo(int resuemNo);
    
    void clearPortfolioResumeNo(int resumeNo);
    void clearSelfIntroResumeNo(int resumeNo);
}