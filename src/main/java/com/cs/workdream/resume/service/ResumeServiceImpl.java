package com.cs.workdream.resume.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.cs.workdream.resume.model.dao.ResumeDao;
import com.cs.workdream.resume.model.vo.Resume;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.Files;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.PostConstruct;

@Service
public class ResumeServiceImpl implements ResumeService {

    private final ResumeDao resumeDao;
    private static final Logger logger = LoggerFactory.getLogger(ResumeServiceImpl.class);

    // 파일 업로드 디렉토리 설정 (application.properties에서 주입)
    @Value("${file.upload-dir}")
    private String uploadDir;

    @Autowired
    public ResumeServiceImpl(ResumeDao resumeDao) {
        this.resumeDao = resumeDao;
    }

    // 애플리케이션 시작 시 uploadDir 값 확인
    @PostConstruct
    public void init() {
        logger.info("파일 업로드 디렉토리: {}", uploadDir);
    }

    @Override
    @Transactional
    public boolean saveResume(Resume resume, MultipartFile userPicFile) {
        try {
            // 업로드 디렉토리 경로 설정
            Path uploadPath = Paths.get(uploadDir).toAbsolutePath().normalize();
            logger.info("절대 업로드 경로: {}", uploadPath.toString());

            // 업로드 디렉토리 존재 여부 확인 및 생성
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
                logger.info("업로드 디렉토리 생성: {}", uploadPath.toString());
            }

            // 프로필 이미지 업로드 처리
            if (userPicFile != null && !userPicFile.isEmpty()) {
                String originalFilename = userPicFile.getOriginalFilename();
                String extension = "";
                if (originalFilename != null && originalFilename.contains(".")) {
                    extension = originalFilename.substring(originalFilename.lastIndexOf("."));
                }
                String newFilename = UUID.randomUUID().toString() + extension;
                Path destination = uploadPath.resolve(newFilename);
                userPicFile.transferTo(destination.toFile());
                resume.setUserPic(newFilename);
                logger.info("프로필 이미지 업로드 성공: {}", newFilename);
            }

            // 이력서 정보 저장
            boolean isResumeInserted = resumeDao.insertResume(resume);
            if (!isResumeInserted) {
                logger.error("이력서 정보 저장 실패");
                return false;
            }

            // 추가적인 정보 저장이 필요하다면 여기에 구현

            return true;
        } catch (IOException e) {
            logger.error("파일 업로드 중 오류 발생", e);
            return false;
        } catch (Exception e) {
            logger.error("이력서 저장 중 오류 발생", e);
            return false;
        }
    }
}
