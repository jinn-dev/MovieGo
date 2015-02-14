package com.mvg.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvg.entity.Movie;

@Repository
public class MovieDaoImpl implements MovieDao{

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(MovieDaoImpl.class);
	}
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String namespace="com.mvg.mappers.movieMapper.";
	
	@Override
	public Integer getAllMovieCount() {
		String stmt = namespace + "getAllMovieCount";
		int result = sqlSession.selectOne(stmt);
		return result;
	}

	@Override
	public List<Movie> getAllMovies() {
		String stmt = namespace + "getAllMovies";
		List<Movie> movies = sqlSession.selectList(stmt);
		return movies;
	}
	
	@Override
	public Movie getMovieByMovieCode(String movieCode) {
		String stmt = namespace + "getMovieByMovieCode";
		Movie movie = sqlSession.selectOne(stmt, movieCode);
		return movie;
	}

	@Override
	public int insertMovie(Movie movie) {
		String stmt = namespace + "insertMovie";
		int result = sqlSession.insert(stmt, movie);
		return result;
	}

	@Override
	public int updateMovie(Movie movie) {
		String stmt = namespace + "updateMovie";
		int result = sqlSession.update(stmt, movie);
		return result;
	}

	@Override
	public int deleteMovie(String movieCode) {
		String stmt = namespace + "deleteMovie";
		int result = sqlSession.delete(stmt, movieCode);
		return result;
	}



}
