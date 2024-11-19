package com.cs.workdream.resume.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cs.workdream.resume.model.dao.SelfIntroDao;
import com.cs.workdream.resume.model.vo.SelfIntro;
@Service

public class SelfIntroServiceImpl implements SelfIntroService {

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
    public SelfIntro getSelfIntroById(int id) {
        return selfIntroDao.selectSelfIntroById(id);
    }

    @Override
    public void updateSelfIntro(SelfIntro intro) {
        selfIntroDao.updateSelfIntro(intro);
    }
}

