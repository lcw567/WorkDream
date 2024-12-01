package com.cs.workdream.business.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cs.workdream.business.model.vo.Business;
import com.cs.workdream.business.model.vo.BusinessBenefit;
import com.cs.workdream.business.model.vo.WorkEnvironmentImage;

@Repository
public class BusinessProfileDao {

    @Autowired
    private SqlSessionTemplate sqlSession;
    
    
    /*=====================================================================================================*/
    

    // 비즈니스 업데이트
    public int updateBusiness(Business business) {
        return sqlSession.update("businessProfileMapper.updateBusiness", business);
    }

    // 기존 복리후생 삭제
    public int deleteBusinessBenefits(int businessNo) {
        return sqlSession.delete("businessProfileMapper.deleteBusinessBenefits", businessNo);
    }

    // 기존 근무 환경 이미지 삭제 (필요시 사용)
    public int deleteWorkEnvironmentImages(int businessNo) {
        return sqlSession.delete("businessProfileMapper.deleteWorkEnvironmentImages", businessNo);
    }

    // 비즈니스 복리후생 등록
    public int insertBusinessBenefit(BusinessBenefit benefit) {
        return sqlSession.insert("businessProfileMapper.insertBusinessBenefit", benefit);
    }

    // 근무 환경 이미지 등록
    public int insertWorkEnvironmentImage(WorkEnvironmentImage image) {
        return sqlSession.insert("businessProfileMapper.insertWorkEnvironmentImage", image);
    }

    // 비즈니스 번호로 비즈니스 조회
    public Business selectBusinessByNo(int businessNo) {
        return sqlSession.selectOne("businessProfileMapper.selectBusinessByNo", businessNo);
    }

    // 비즈니스 번호로 복리후생 목록 조회
    public List<BusinessBenefit> selectBenefitsByBusinessNo(int businessNo) {
        return sqlSession.selectList("businessProfileMapper.selectBenefitsByBusinessNo", businessNo);
    }

    // 비즈니스 번호로 근무 환경 이미지 목록 조회
    public List<WorkEnvironmentImage> selectWorkEnvironmentImagesByBusinessNo(int businessNo) {
        return sqlSession.selectList("businessProfileMapper.selectWorkEnvironmentImagesByBusinessNo", businessNo);
    }

    // 특정 WorkEnvironmentImage 조회
    public WorkEnvironmentImage selectWorkEnvironmentImageById(int workEnvironmentImageNo) {
        return sqlSession.selectOne("businessProfileMapper.selectWorkEnvironmentImageById", workEnvironmentImageNo);
    }

    // WorkEnvironmentImage 업데이트
    public int updateWorkEnvironmentImage(WorkEnvironmentImage image) {
        return sqlSession.update("businessProfileMapper.updateWorkEnvironmentImage", image);
    }

    // WorkEnvironmentImage 삭제
    public int deleteWorkEnvironmentImageById(int workEnvironmentImageNo) {
        return sqlSession.delete("businessProfileMapper.deleteWorkEnvironmentImageById", workEnvironmentImageNo);
    }
}
