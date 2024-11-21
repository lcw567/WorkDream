package com.cs.workdream.selfintro.service;

import java.util.List;

import com.cs.workdream.selfintro.model.vo.SelfIntro;

public interface SelfIntroService {
    int insertSelfIntro(SelfIntro selfIntro);
    
    List<SelfIntro> selectSelfIntroList(String userId);
    
    int deleteSelfIntro(Integer selfIntroNo);
    
    SelfIntro getSelfIntroById(Integer selfintroNo);
    
    void updateSelfIntro(SelfIntro selfIntro);
}
