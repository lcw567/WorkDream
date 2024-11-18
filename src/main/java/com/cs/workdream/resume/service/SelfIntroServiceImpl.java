package com.cs.workdream.resume.service;

import java.util.List;

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

	@Override
	public List<SelfIntro> selectSelfIntroList(String userId) {
		return selfIntroDao.selectSelfIntroList(userId);
	}

	@Override
	public int deleteSelfIntro(int selfIntroId) {
		return selfIntroDao.deleteSelfIntro(selfIntroId);
	}

}
