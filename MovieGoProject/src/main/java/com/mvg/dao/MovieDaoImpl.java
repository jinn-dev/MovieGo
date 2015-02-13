package com.mvg.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.mvg.entity.Movie;

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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Movie> getAllMovies() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertMovie(Movie movie) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMovie(Movie movie) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMovie(String movieCode) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Movie getMovieByMovieCode(String movieCode) {
		// TODO Auto-generated method stub
		return null;
	}

}
