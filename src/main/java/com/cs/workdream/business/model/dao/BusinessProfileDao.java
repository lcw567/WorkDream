package com.cs.workdream.business.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cs.workdream.business.model.vo.Business;
import com.cs.workdream.business.model.vo.BusinessBenefit;
import com.cs.workdream.business.model.vo.WorkEnvironmentImage;

@Repository
public class BusinessProfileDao {

    @Autowired
    private SqlSession sqlSession;

    // Update Business
    public int updateBusiness(Business business) {
        return sqlSession.update("com.cs.workdream.business.model.dao.BusinessProfileDao.updateBusiness", business);
    }

    // Delete existing Business Benefits
    public int deleteBusinessBenefits(int businessNo) {
        return sqlSession.delete("com.cs.workdream.business.model.dao.BusinessProfileDao.deleteBusinessBenefits", businessNo);
    }

    // Delete existing Work Environment Images
    public int deleteWorkEnvironmentImages(int businessNo) {
        return sqlSession.delete("com.cs.workdream.business.model.dao.BusinessProfileDao.deleteWorkEnvironmentImages", businessNo);
    }

    // Insert Business Benefit
    public int insertBusinessBenefit(BusinessBenefit benefit) {
        return sqlSession.insert("com.cs.workdream.business.model.dao.BusinessProfileDao.insertBusinessBenefit", benefit);
    }

    // Insert Work Environment Image
    public int insertWorkEnvironmentImage(WorkEnvironmentImage image) {
        return sqlSession.insert("com.cs.workdream.business.model.dao.BusinessProfileDao.insertWorkEnvironmentImage", image);
    }

    // Select Business by BusinessNo
    public Business selectBusinessByNo(int businessNo) {
        return sqlSession.selectOne("com.cs.workdream.business.model.dao.BusinessProfileDao.selectBusinessByNo", businessNo);
    }

    // Select Benefits by BusinessNo
    public List<BusinessBenefit> selectBenefitsByBusinessNo(int businessNo) {
        return sqlSession.selectList("com.cs.workdream.business.model.dao.BusinessProfileDao.selectBenefitsByBusinessNo", businessNo);
    }

    // Select Work Environment Images by BusinessNo
    public List<WorkEnvironmentImage> selectWorkEnvironmentImagesByBusinessNo(int businessNo) {
        return sqlSession.selectList("com.cs.workdream.business.model.dao.BusinessProfileDao.selectWorkEnvironmentImagesByBusinessNo", businessNo);
    }
}
