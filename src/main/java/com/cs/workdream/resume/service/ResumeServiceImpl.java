package com.cs.workdream.resume.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.cs.workdream.resume.model.dao.ResumeDao;
import com.cs.workdream.resume.model.vo.Resume;

public class ResumeServiceImpl implements ResumeService{
	
    private final ResumeDao resumeDao;

    @Autowired
    public ResumeServiceImpl(ResumeDao resumeDao) {
        this.resumeDao = resumeDao;
    }

	@Override
	public int saveResume(Resume resume) {
		return resumeDao.insertResume(resume);
	}

}
