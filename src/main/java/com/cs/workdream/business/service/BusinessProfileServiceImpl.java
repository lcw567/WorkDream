package com.cs.workdream.business.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.cs.workdream.business.model.dao.BusinessProfileDao;
import com.cs.workdream.business.model.vo.Business;
import com.cs.workdream.business.model.vo.BusinessBenefit;
import com.cs.workdream.business.model.vo.WorkEnvironmentImage;
import javax.servlet.ServletContext;
import java.io.File;

@Service
public class BusinessProfileServiceImpl implements BusinessProfileService {

    @Autowired
    private BusinessProfileDao businessProfileDao;
    
    @Autowired
    private ServletContext servletContext;

    @Override
    @Transactional
    public int registerBusinessProfile(Business business) throws Exception {
        // BUSINESS 테이블에 업데이트
        int result = businessProfileDao.updateBusiness(business);
        if(result <= 0) throw new Exception("Business update failed");

        int businessNo = business.getBusinessNo();

        // 기존 복리후생 삭제
        int deleteBenefits = businessProfileDao.deleteBusinessBenefits(businessNo);
        System.out.println("Deleted Business Benefits count: " + deleteBenefits);

        // BUSINESS_BENEFIT 테이블에 등록
        List<BusinessBenefit> benefits = business.getBenefits();
        if(benefits != null && !benefits.isEmpty()) {
            for(BusinessBenefit benefit : benefits) {
                benefit.setBusinessNo(businessNo);
                businessProfileDao.insertBusinessBenefit(benefit);
            }
        }

        // 근무 환경 이미지 처리
        List<WorkEnvironmentImage> images = business.getWorkEnvironmentImages();
        if(images != null && !images.isEmpty()) {
            // 기존 근무 환경 이미지 삭제
            List<WorkEnvironmentImage> existingImages = businessProfileDao.selectWorkEnvironmentImagesByBusinessNo(businessNo);
            int deleteImages = businessProfileDao.deleteWorkEnvironmentImages(businessNo);
            System.out.println("Deleted Work Environment Images count: " + deleteImages);
            
            // 파일 시스템에서 이미지 파일 삭제
            if(existingImages != null && !existingImages.isEmpty()) {
                for(WorkEnvironmentImage image : existingImages) {
                    String imageUrl = image.getImageUrl();
                    String imagePath = servletContext.getRealPath(imageUrl);
                    File imageFile = new File(imagePath);
                    if(imageFile.exists()) {
                        boolean deleted = imageFile.delete();
                        if(deleted) {
                            System.out.println("Deleted image file: " + imagePath);
                        } else {
                            System.out.println("Failed to delete image file: " + imagePath);
                        }
                    }
                }
            }

            // 새로운 근무 환경 이미지 등록
            for(WorkEnvironmentImage image : images) {
                image.setBusinessNo(businessNo);
                businessProfileDao.insertWorkEnvironmentImage(image);
            }
        }
        // 새로운 이미지가 업로드되지 않은 경우 기존 이미지를 유지

        return businessNo;
    }

    @Override
    public Business viewBusinessProfile(int businessNo) throws Exception {
        Business business = businessProfileDao.selectBusinessByNo(businessNo);
        if(business == null) throw new Exception("Business not found");

        List<BusinessBenefit> benefits = businessProfileDao.selectBenefitsByBusinessNo(businessNo);
        business.setBenefits(benefits);

        List<WorkEnvironmentImage> images = businessProfileDao.selectWorkEnvironmentImagesByBusinessNo(businessNo);
        business.setWorkEnvironmentImages(images);

        return business;
    }
}
