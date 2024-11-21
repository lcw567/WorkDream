package com.cs.workdream.resume.service;

import com.cs.workdream.resume.model.vo.Resume;

/**
 * ResumeService 인터페이스는 이력서 관련 비즈니스 로직을 정의합니다.
 */
public interface ResumeService {
    
	  void insertResume(Resume resume);
}