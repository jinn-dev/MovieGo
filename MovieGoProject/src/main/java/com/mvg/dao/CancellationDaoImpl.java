package com.mvg.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvg.entity.Cancellation;

@Repository
public class CancellationDaoImpl implements CancellationDao {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(CancellationDaoImpl.class);
	}
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String namespace ="com.mvg.mappers.cancellationMapper.";

	@Override
	public List<Cancellation> getCancellationByUserId(String userId) {
		String stmt = namespace + "getCancellationByUserId";
		List<Cancellation> clist = sqlSession.selectList(stmt, userId);
		return clist;
	}

	@Override
	public int insertCancellation(Cancellation cancellation) {
		String stmt = namespace + "insertCancellation";
		int result = sqlSession.insert(stmt, cancellation);
		return result;
	}
	
	

}
