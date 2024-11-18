package com.cs.workdream.resume.service;

import com.cs.workdream.resume.model.vo.Resume;

/**
 * ResumeService 인터페이스는 이력서 관련 비즈니스 로직을 정의합니다.
 */
public interface ResumeService {
    
    /**
     * 이력서를 저장하는 메서드
     *
     * @param resume 저장할 Resume 객체
     * @return 저장 성공 시 1, 실패 시 0
     */
    int saveResume(Resume resume);
    
    // 필요에 따라 추가적인 메서드를 정의할 수 있습니다.
}