package com.mvg.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvg.entity.Theater;

@Repository
public class TheaterDaoImpl implements TheaterDao {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(TheaterDaoImpl.class);
	}

	private final String namespace = "com.mvg.mappers.theaterMapper.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Override
	public Integer getTheaterCount() {
		String stmt = namespace + "getTheaterCount";
		int result = sqlSession.selectOne(stmt);
		return result;
	}

	@Override
	public List<Theater> getAllTheaters() {
		String stmt = namespace + "getAllTheaters";
		List<Theater> theaters = sqlSession.selectList(stmt);
		return theaters;
	}

	@Override
	public int insertTheater(Theater theater) {
		String stmt = namespace + "insertTheater";
		int result = sqlSession.insert(stmt, theater);
		return result;
	}

	@Override
	public int updateTheater(Theater theater) {
		String stmt = namespace + "updateTheater";
		int result = sqlSession.update(stmt, theater);
		return result;
	}

	@Override
	public int deleteTheater(int theaterId) {
		String stmt = namespace + "insertTheater";
		int result = sqlSession.delete(stmt, theaterId);
		return result;
	}

	@Override
	public Theater getTheaterById(int theaterId) {
		String stmt = namespace + "getTheaterById";
		Theater theater = sqlSession.selectOne(stmt, theaterId);
		return theater;
	}

	@Override
	public Theater getTheaterByName(String theaterName) {
		String stmt = namespace + "getTheaterByName";
		Theater theater = sqlSession.selectOne(stmt, theaterName);
		return theater;
	}

	
}
