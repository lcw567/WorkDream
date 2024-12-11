package com.cs.workdream.person.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cs.workdream.person.model.dao.PersonDao;

@Service
public class PersonServiceImpl implements PersonService {

	@Autowired
	private PersonDao personDao;
	
	
	/*=====================================================================================================*/
	
	
	// 지원현황 조회
	@Override
	public Map<String, Integer> selectApplicationStatus(int personNo) {
		return personDao.selectApplicationStatus(personNo);
	}
}
