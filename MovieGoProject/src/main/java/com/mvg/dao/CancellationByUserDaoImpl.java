package com.mvg.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvg.entity.CancellationByUser;

@Repository
public class CancellationByUserDaoImpl implements CancellationByUserDao {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(CancellationByUserDaoImpl.class);
	}

	private final String namespace = "com.mvg.mappers.cancellationByUserMapper.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CancellationByUser> getCListByUserId(String userId) {
		String stmt = namespace + "getCListByUserId";
		List<CancellationByUser> clist = sqlSession.selectList(stmt, userId);
		return clist;
	}

}
