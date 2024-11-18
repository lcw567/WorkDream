package com.cs.workdream.resume.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cs.workdream.resume.model.dao.SelfIntroDao;
import com.cs.workdream.resume.model.vo.SelfIntro;
@Service
public class SelfIntroServiceImpl implements SelfIntroService{

	 @Autowired
	 private SelfIntroDao selfIntroDao;
	
	@Override
	public int insertSelfIntro(SelfIntro selfIntro) {
		return selfIntroDao.insertSelfIntro(selfIntro);
	}

}
