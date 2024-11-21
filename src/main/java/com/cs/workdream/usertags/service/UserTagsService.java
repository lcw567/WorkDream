package com.cs.workdream.usertags.service;

import com.cs.workdream.usertags.model.vo.UserTag;

import java.util.List;

public interface UserTagsService {
    List<UserTag> getUserTags(int userNo);
    boolean addUserTag(int userNo, String tagName);
    boolean removeUserTag(int tagId, int userNo);
    boolean updateUserTags(int userNo, List<String> newTags);
}