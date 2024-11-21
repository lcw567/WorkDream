package com.cs.workdream.resume.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cs.workdream.resume.model.dao.ResumeDao;
import com.cs.workdream.resume.model.vo.BasicInfo;
import com.cs.workdream.resume.model.vo.Resume;

import java.util.List;

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

    @Autowired
    public ResumeServiceImpl(ResumeDao resumeDao) {
        this.resumeDao = resumeDao;
    }

	@Override
	public void insertResume(Resume resume) {
		 resumeDao.insertResume(resume);
	        
	        // 생성된 resumeNo 가져오기 (MyBatis selectKey 사용 가정)
	        Integer resumeNo = resume.getResumeNo();
	        
	        // 각 BasicInfo에 resumeNo 설정 후 저장
	        resume.getBasicInfo().forEach(basicInfo -> {
	            basicInfo.setResumeNo(resumeNo);
	            resumeDao.insertBasicInfo(basicInfo);
	        });
		
	}



}