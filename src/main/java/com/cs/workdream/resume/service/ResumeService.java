package com.cs.workdream.resume.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.cs.workdream.resume.model.vo.Award;
import com.cs.workdream.resume.model.vo.Certificate;
import com.cs.workdream.resume.model.vo.LanguageTest;
import com.cs.workdream.resume.model.vo.Resume;

public interface ResumeService {
    boolean saveResume(Resume resume, MultipartFile userPicFile);
    List<Resume> getResumesByPersonNo(int personNo);
    Resume getResumeById(int resumeNo);
    boolean updateResume(Resume resume);
    int deleteResumeById(int resumeNo);

    // New methods to handle certificates, language tests, and awards
    void deleteCertificatesByResumeNo(int resumeNo);
    void insertCertificate(Certificate certificate);
    void deleteLanguageTestsByResumeNo(int resumeNo);
    void insertLanguageTest(LanguageTest languageTest);
    void deleteAwardsByResumeNo(int resumeNo);
    void insertAward(Award award);
    Resume getResumeByNo(int resumeNo);
}
