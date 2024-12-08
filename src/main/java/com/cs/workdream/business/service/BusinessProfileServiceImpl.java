package com.cs.workdream.business.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.cs.workdream.business.model.dao.BusinessProfileDao;
import com.cs.workdream.business.model.vo.Business;
import com.cs.workdream.business.model.vo.BusinessBenefit;
import com.cs.workdream.business.model.vo.WorkEnvironmentImage;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class BusinessProfileServiceImpl implements BusinessProfileService {

    @Autowired
    private BusinessProfileDao businessProfileDao;
    
    @Autowired
    private ServletContext servletContext;
    
    @Override
    public Business viewBusinessProfile(int businessNo) throws Exception {
        Business business = businessProfileDao.selectBusinessByNo(businessNo);
        if(business == null) throw new Exception("Business not found");

        // 복리후생 정보
        List<BusinessBenefit> benefits = businessProfileDao.selectBenefitsByBusinessNo(businessNo);
        business.setBenefits(benefits);

        // 근무 환경 정보
        List<WorkEnvironmentImage> images = businessProfileDao.selectWorkEnvironmentImagesByBusinessNo(businessNo);
        business.setWorkEnvironmentImages(images);

        return business;
    }

    @Override
    @Transactional
    public void registerBusinessProfile(Business business, List<MultipartFile> workEnvironmentFiles, List<MultipartFile> newWorkEnvironmentFiles, List<Integer> existingImageIds, String workEnvImageTitlesJson, List<Integer> deleteImageIds) throws Exception {
        // BUSINESS 테이블에 업데이트
        int result = businessProfileDao.updateBusiness(business);
        if(result <= 0) throw new Exception("Business update failed");

        int businessNo = business.getBusinessNo();

        // 기존 복리후생 삭제 및 재등록
        businessProfileDao.deleteBusinessBenefits(businessNo);
        List<BusinessBenefit> benefits = business.getBenefits();
        if(benefits != null && !benefits.isEmpty()) {
            for(BusinessBenefit benefit : benefits) {
                benefit.setBusinessNo(businessNo);
                businessProfileDao.insertBusinessBenefit(benefit);
            }
        }

        // workEnvImageTitlesJson 파싱
        List<String> workEnvImageTitles = parseJsonArray(workEnvImageTitlesJson);

        // 삭제할 이미지 처리
        if(deleteImageIds != null && !deleteImageIds.isEmpty()) {
            for(Integer imageId : deleteImageIds) {
                WorkEnvironmentImage image = businessProfileDao.selectWorkEnvironmentImageById(imageId);
                if(image != null) {
                    // 파일 삭제
                    String imagePath = servletContext.getRealPath(image.getImageUrl());
                    File imageFile = new File(imagePath);
                    if(imageFile.exists()) {
                        boolean deleted = imageFile.delete();
                        if(!deleted) {
                            throw new Exception("Failed to delete image file: " + imagePath);
                        }
                    }
                    // DB 삭제
                    int deleteResult = businessProfileDao.deleteWorkEnvironmentImageById(imageId);
                    if(deleteResult <= 0) {
                        throw new Exception("Failed to delete WorkEnvironmentImage from DB for ID: " + imageId);
                    }
                }
            }
        }

        // 기존 이미지 처리
        int existingCount = 0;
        if(existingImageIds != null) {
            existingCount = existingImageIds.size();
        }

        // 기존 이미지 업데이트 (파일 변경 + 제목 변경)
        if(workEnvironmentFiles != null && !workEnvironmentFiles.isEmpty() && existingImageIds != null) {
            for(int i = 0; i < workEnvironmentFiles.size(); i++) {
                MultipartFile file = workEnvironmentFiles.get(i);
                Integer imageId = (existingImageIds.size() > i) ? existingImageIds.get(i) : null;
                String title = (workEnvImageTitles.size() > i) ? workEnvImageTitles.get(i) : ""; 
                
                if(imageId != null) {
                    WorkEnvironmentImage existingImage = businessProfileDao.selectWorkEnvironmentImageById(imageId);
                    if(existingImage == null) {
                        continue; // 해당 이미지가 DB에 없으면 스킵
                    }
                    
                    // 파일이 새로 업로드되었을 경우 기존 파일 삭제 후 업데이트
                    if(!file.isEmpty()) {
                        // 기존 파일 삭제
                        String oldImagePath = servletContext.getRealPath(existingImage.getImageUrl());
                        File oldImageFile = new File(oldImagePath);
                        if(oldImageFile.exists()) {
                            boolean deleted = oldImageFile.delete();
                            if(!deleted) {
                                throw new Exception("Failed to delete old image file: " + oldImagePath);
                            }
                        }
                        // 새 파일 업로드
                        String imageUrl = saveFile(file, "work_env_images");
                        existingImage.setImageUrl(imageUrl);
                    }
                    
                    // 제목 업데이트
                    existingImage.setTitle(title);
                    int updateResult = businessProfileDao.updateWorkEnvironmentImage(existingImage);
                    if(updateResult <= 0) {
                        throw new Exception("Failed to update WorkEnvironmentImage for ID: " + imageId);
                    }
                }
            }
        } else if (existingImageIds != null && !existingImageIds.isEmpty()) {
            // 파일 업로드는 없지만 제목만 수정해야 할 수도 있으니 이 경우 처리
            for (int i = 0; i < existingImageIds.size(); i++) {
                Integer imageId = existingImageIds.get(i);
                String title = (workEnvImageTitles.size() > i) ? workEnvImageTitles.get(i) : "";
                WorkEnvironmentImage existingImage = businessProfileDao.selectWorkEnvironmentImageById(imageId);
                if(existingImage != null) {
                    existingImage.setTitle(title);
                    int updateResult = businessProfileDao.updateWorkEnvironmentImage(existingImage);
                    if(updateResult <= 0) {
                        throw new Exception("Failed to update WorkEnvironmentImage title for ID: " + imageId);
                    }
                }
            }
        }

        // 새로운 이미지 추가
        if(newWorkEnvironmentFiles != null && !newWorkEnvironmentFiles.isEmpty()) {
            // 새로운 이미지는 기존 이미지 개수만큼 인덱스를 건너뛰고 시작
            int newImagesStartIndex = existingCount;
            for(int i = 0; i < newWorkEnvironmentFiles.size(); i++) {
                MultipartFile file = newWorkEnvironmentFiles.get(i);
                // 기존 이미지 수를 건너뛴 인덱스로 제목 가져오기
                String title = (workEnvImageTitles.size() > (newImagesStartIndex + i)) ? workEnvImageTitles.get(newImagesStartIndex + i) : "";

                if(!file.isEmpty()) {
                    String imageUrl = saveFile(file, "work_env_images");
                    WorkEnvironmentImage newImage = new WorkEnvironmentImage();
                    newImage.setBusinessNo(businessNo);
                    newImage.setImageUrl(imageUrl);
                    newImage.setTitle(title);
                    int insertResult = businessProfileDao.insertWorkEnvironmentImage(newImage);
                    if(insertResult <= 0) {
                        throw new Exception("Failed to insert new WorkEnvironmentImage");
                    }
                }
            }
        }
    }

    private String saveFile(MultipartFile file, String folderName) throws IOException {
        String uploadDir = servletContext.getRealPath("/resources/uploads/" + folderName + "/");
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            boolean created = dir.mkdirs();
            System.out.println("디렉토리 생성 여부: " + created);
            System.out.println("생성된 디렉토리 경로: " + dir.getAbsolutePath());
        } else {
            System.out.println("디렉토리가 이미 존재합니다: " + dir.getAbsolutePath());
        }

        String originalFilename = file.getOriginalFilename();
        String fileName = System.currentTimeMillis() + "_" + originalFilename;
        String filePath = uploadDir + File.separator + fileName;

        System.out.println("파일 저장 경로: " + filePath);

        try {
            file.transferTo(new File(filePath));
        } catch (IOException e) {
            e.printStackTrace();
            throw new IOException("파일 저장 중 오류 발생");
        }

        return "/resources/uploads/" + folderName + "/" + fileName;
    }

    private List<String> parseJsonArray(String jsonArrayStr) {
        try {
            ObjectMapper mapper = new ObjectMapper();
            List<String> list = mapper.readValue(jsonArrayStr, mapper.getTypeFactory().constructCollectionType(List.class, String.class));
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }
}
