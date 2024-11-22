package com.cs.workdream.resume.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.cs.workdream.resume.model.dao.ResumeDao;
import com.cs.workdream.resume.model.vo.AcademicAbility;
import com.cs.workdream.resume.model.vo.EmploymentPreferences;
import com.cs.workdream.resume.model.vo.Experience;
import com.cs.workdream.resume.model.vo.Qualification;
import com.cs.workdream.resume.model.vo.Resume;
import com.cs.workdream.resume.model.vo.BasicInfo;
import com.cs.workdream.resume.model.vo.Skill;
import com.cs.workdream.resume.model.vo.Career;

import java.io.File;
import java.io.IOException;
import java.util.UUID;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * ResumeServiceImpl 클래스는 ResumeService 인터페이스를 구현하며,
 * 이력서와 관련된 비즈니스 로직을 처리합니다.
 */
@Service
public class ResumeServiceImpl implements ResumeService {

    private final ResumeDao resumeDao;
    private static final Logger logger = LoggerFactory.getLogger(ResumeServiceImpl.class);

    // 파일 업로드 디렉토리 설정 (application.properties에서 주입)
    @Value("${file.upload-dir}")
    private String uploadDir;

    @Autowired
    public ResumeServiceImpl(ResumeDao resumeDao) {
        this.resumeDao = resumeDao;
    }

	@Override
	public boolean saveResume(Resume resume) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean saveResume(Resume resume, MultipartFile userPic) {
		// TODO Auto-generated method stub
		return false;
	}


}
