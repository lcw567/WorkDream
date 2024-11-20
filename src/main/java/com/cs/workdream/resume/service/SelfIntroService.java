package com.cs.workdream.resume.service;

import java.util.List;

import com.cs.workdream.resume.model.vo.SelfIntro;

public interface SelfIntroService {
    int insertSelfIntro(SelfIntro selfIntro);
    
    List<SelfIntro> selectSelfIntroList(String userId);
    
    int deleteSelfIntro(Integer selfIntroNo);
    
    SelfIntro getSelfIntroById(Integer selfintroNo);
    
    void updateSelfIntro(SelfIntro selfIntro);
}
