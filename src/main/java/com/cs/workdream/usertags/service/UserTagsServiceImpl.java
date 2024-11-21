package com.cs.workdream.usertags.service;

import com.cs.workdream.usertags.model.dao.UserTagsDao;
import com.cs.workdream.usertags.model.vo.UserTag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserTagsServiceImpl implements UserTagsService {

    @Autowired
    private UserTagsDao userTagsDao;

    @Override
    public List<UserTag> getUserTags(int userNo) {
        return userTagsDao.selectUserTagsByUserNo(userNo);
    }

    @Override
    @Transactional
    public boolean addUserTag(int userNo, String tagName) {
        // 중복 태그 확인
        List<UserTag> existingTags = userTagsDao.selectUserTagsByUserNo(userNo);
        boolean exists = existingTags.stream()
                .anyMatch(tag -> tag.getTagName().equalsIgnoreCase(tagName));
        if(exists) {
            return false; // 중복 태그인 경우
        }
        // 최대 20개 제한
        if(existingTags.size() >= 20) {
            return false; // 최대 태그 수 초과
        }
        UserTag newTag = new UserTag();
        newTag.setUserNo(userNo);
        newTag.setTagName(tagName);
        userTagsDao.insertUserTag(newTag);
        return true;
    }

    @Override
    @Transactional
    public boolean removeUserTag(int tagId, int userNo) {
        // 태그 소유자 확인
        List<UserTag> tags = userTagsDao.selectUserTagsByUserNo(userNo);
        boolean ownsTag = tags.stream()
                .anyMatch(tag -> tag.getTagId() == tagId);
        if(!ownsTag) {
            return false; // 소유자가 아닌 태그
        }
        userTagsDao.deleteUserTag(tagId);
        return true;
    }

    @Override
    @Transactional
    public boolean updateUserTags(int userNo, List<String> newTags) {
        // 중복 제거 및 최대 20개 제한
        List<String> uniqueTags = newTags.stream()
                .map(String::trim)
                .filter(tag -> !tag.isEmpty())
                .distinct()
                .limit(20)
                .collect(Collectors.toList());

        if(uniqueTags.size() > 20) {
            return false; // 최대 태그 수 초과
        }

        // 기존 태그 삭제
        userTagsDao.deleteUserTagsByUserNo(userNo);

        // 새로운 태그 삽입
        for(String tagName : uniqueTags) {
            UserTag newTag = new UserTag();
            newTag.setUserNo(userNo);
            newTag.setTagName(tagName);
            userTagsDao.insertUserTag(newTag);
        }
        return true;
    }
}
