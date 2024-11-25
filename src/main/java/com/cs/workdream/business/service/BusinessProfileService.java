package com.cs.workdream.business.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.cs.workdream.business.model.vo.Business;

public interface BusinessProfileService {
    void registerBusinessProfile(Business business, List<MultipartFile> workEnvironmentFiles, List<MultipartFile> newWorkEnvironmentFiles, List<Integer> existingImageIds, String workEnvImageTitlesJson) throws Exception;
    Business viewBusinessProfile(int businessNo) throws Exception;
}
