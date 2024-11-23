package com.cs.workdream.business.service;

import com.cs.workdream.business.model.vo.Business;

public interface BusinessProfileService {
    int registerBusinessProfile(Business business) throws Exception;
    Business viewBusinessProfile(int businessNo) throws Exception;
}
