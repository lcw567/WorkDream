package com.cs.workdream.selfintro.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cs.workdream.resume.controller.ResumeController;
import com.cs.workdream.resume.model.vo.Resume;
import com.cs.workdream.selfintro.model.dao.SelfIntroDao;
import com.cs.workdream.selfintro.model.vo.SelfIntro;
@Service

public class SelfIntroServiceImpl implements SelfIntroService {
	
	private static final Logger logger = LoggerFactory.getLogger(ResumeController.class);

    @Autowired
    private SelfIntroDao selfIntroDao;

    @Override
    public int insertSelfIntro(SelfIntro selfIntro) {
        return selfIntroDao.insertSelfIntro(selfIntro);
    }

    @Override
    public List<SelfIntro> selectSelfIntroList(String userId) {
        return selfIntroDao.selectSelfIntroList(userId);
    }

    @Override
    @Transactional
    public int deleteSelfIntro(Integer selfIntroNo) {
        return selfIntroDao.deleteSelfIntro(selfIntroNo);
    }

    @Override
    @Transactional
    public void updateSelfIntro(SelfIntro selfIntro) {
        logger.info("Updating SelfIntro in service layer: {}", selfIntro);
        selfIntroDao.updateSelfIntro(selfIntro);
        logger.info("SelfIntro updated successfully in service layer for id: {}", selfIntro.getSelfintroNo());
    }

	@Override
	public SelfIntro getSelfIntroById(Integer selfintroNo) {
		return selfIntroDao.selectSelfIntroById(selfintroNo);
	}
	
	@Override
    public SelfIntro getSelfintroByNo(Integer selfintroNo) {
        return selfIntroDao.selectSelfIntroByNo(selfintroNo);
    }

	@Override
	public List<SelfIntro> getSelfintroByPersonNo(int personNo) {
		return selfIntroDao.selectSelfintroByPersonNo(personNo);
	}


}

