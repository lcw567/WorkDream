package com.cs.workdream.resume.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.cs.workdream.resume.model.vo.Resume;

public interface ResumeService {
    /**
     * 이력서를 저장하는 메서드
     * @param resume 이력서 정보
     * @param userPicFile 프로필 사진 파일
     * @return 저장 성공 여부
     */
    boolean saveResume(Resume resume, MultipartFile userPicFile);
    
    List<Resume> getResumesByPersonNo(int personNo);
}
