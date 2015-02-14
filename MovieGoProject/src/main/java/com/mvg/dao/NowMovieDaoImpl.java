package com.mvg.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvg.entity.Movie;
import com.mvg.entity.NowMovie;

@Repository
public class NowMovieDaoImpl implements NowMovieDao {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(NowMovieDaoImpl.class);
	}
	
	private final String namespace = "com.mvg.mappers.nowmovieMapper.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getAllNowMovieCnt() {
		String stmt = namespace + "getAllNowMovieCnt";
		int result = sqlSession.selectOne(stmt);
		return result;
	}

	@Override
	public List<NowMovie> getAllNowMovies() {
		String stmt = namespace + "getAllNowMovies";
		List<NowMovie> nmovies = sqlSession.selectList(stmt);
		return nmovies;
	}

	@Override
	public List<NowMovie> getNowMovieByMovieCode(String movieCode) {
		String stmt = namespace + "getNowMovieByMovieCode";
		List<NowMovie> nmovies = sqlSession.selectList(stmt, movieCode);
		return nmovies;
	}

	@Override
	public int insertNowMovie(Movie movie) {
		String stmt = namespace + "insertNowMovie";
		int result = sqlSession.insert(stmt, movie);
		return result;
	}

	@Override
	public int updateNowMovie(Movie movie) {
		String stmt = namespace + "updateNowMovie";
		int result = sqlSession.update(stmt, movie);
		return result;
	}

	@Override
	public int deleteNowMovie(String movieCode) {
		String stmt = namespace + "deleteNowMovie";
		int result = sqlSession.delete(stmt, movieCode);
		return result;
	}
	
}
