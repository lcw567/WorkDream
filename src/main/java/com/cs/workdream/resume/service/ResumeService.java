package com.cs.workdream.resume.service;

import org.springframework.web.multipart.MultipartFile;
import com.cs.workdream.resume.model.vo.Resume;

public interface ResumeService {
	boolean saveResume(Resume resume);

	/**
	 * 이력서를 저장하는 메서드
	 * 
	 * @param resume   저장할 이력서 객체
	 * @param userPic  프로필 이미지 파일
	 * @return         저장 성공 여부
	 */
	boolean saveResume(Resume resume, MultipartFile userPic);
}
