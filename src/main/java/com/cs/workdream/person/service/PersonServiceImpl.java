package com.cs.workdream.person.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cs.workdream.person.model.dao.PersonDao;
import com.cs.workdream.person.model.vo.Person;

@Service
public class PersonServiceImpl implements PersonService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private PersonDao personDao;

}
