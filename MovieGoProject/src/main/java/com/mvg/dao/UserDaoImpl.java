package com.mvg.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(UserDaoImpl.class);
	}
	
	private final String namespace = "com.mvg.mappers.userMapper.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Integer getUserCount() {
		String stmt = namespace + "getUserCount";
		int result = sqlSession.selectOne(stmt);
		return result;
	}

}
