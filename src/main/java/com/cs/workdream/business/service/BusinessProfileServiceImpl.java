package com.cs.workdream.business.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cs.workdream.business.model.dao.BusinessProfileDao;
import com.cs.workdream.business.model.vo.Business;
import com.cs.workdream.business.model.vo.BusinessBenefit;
import com.cs.workdream.business.model.vo.WorkEnvironmentImage;

@Service
public class BusinessProfileServiceImpl implements BusinessProfileService {

    @Autowired
    private BusinessProfileDao businessProfileDao;

    @Override
    @Transactional
    public int registerBusinessProfile(Business business) throws Exception {
        // BUSINESS 테이블에 업데이트
        int result = businessProfileDao.updateBusiness(business);
        if(result <= 0) throw new Exception("Business update failed");

        int businessNo = business.getBusinessNo();

        // 기존 복리후생 및 근무 환경 이미지 삭제
        businessProfileDao.deleteBusinessBenefits(businessNo);
        businessProfileDao.deleteWorkEnvironmentImages(businessNo);

        // BUSINESS_BENEFIT 테이블에 등록
        List<BusinessBenefit> benefits = business.getBenefits();
        if(benefits != null && !benefits.isEmpty()) {
            for(BusinessBenefit benefit : benefits) {
                benefit.setBusinessNo(businessNo);
                businessProfileDao.insertBusinessBenefit(benefit);
            }
        }

        // WORK_ENVIRONMENT_IMAGE 테이블에 등록
        List<WorkEnvironmentImage> images = business.getWorkEnvironmentImages();
        if(images != null && !images.isEmpty()) {
            for(WorkEnvironmentImage image : images) {
                image.setBusinessNo(businessNo);
                businessProfileDao.insertWorkEnvironmentImage(image);
            }
        }

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
