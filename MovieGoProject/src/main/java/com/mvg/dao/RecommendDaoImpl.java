package com.mvg.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvg.entity.Movie;
import com.mvg.entity.Recommend;
import com.mvg.entity.User;

@Repository
public class RecommendDaoImpl implements RecommendDao {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(UserDaoImpl.class);
	}

	private final String namespace = "com.mvg.mappers.recommendMapper.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Override
	public List<Recommend> countGenre(User user) {
		String stmt = namespace+"countGenreByUserId";
		List<Recommend> results = sqlSession.selectList(stmt, user);
		return results;
	}

	@Override
	public int countMovieEval(User user) {
		String stmt = namespace+"countMovieEvalByUserId";
		int result = sqlSession.selectOne(stmt, user);
		return result;
	}

	@Override
	public List<Movie> recommendMovieBasedGenre(HashMap<String, Object> hashmap) {
		String stmt = namespace+"recommendMovieBasedOnGenre";
		List<Movie> results = sqlSession.selectList(stmt, hashmap);
		return results;
	}





}
