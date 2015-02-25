package com.mvg.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvg.dao.RecommendDao;
import com.mvg.dao.UserDaoImpl;
import com.mvg.entity.Movie;
import com.mvg.entity.User;

@Service
public class RecommendServiceImpl implements RecommendService {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(UserDaoImpl.class);
	}

	@Autowired
	RecommendDao dao;

	@Override
	public List<Movie> countGenreService(User user) {
		List<Movie> results = dao.countGenre(user);
		return results;
	}
	
	@Override
	public List<Movie> countNationService(User user) {
		List<Movie> results = dao.countNation(user);
		return results;
	}

	@Override
	public int countMovieEvalService(User user) {
		int result = dao.countMovieEval(user);
		return result;
	}

	@Override
	public List<Movie> rmdMovieBasedGenreService(HashMap<String, Object> hashmap) {
		List<Movie> results = dao.recommendMovieBasedGenre(hashmap);
		return results;
	}


}
