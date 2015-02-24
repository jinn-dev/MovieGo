package com.mvg.service;

import java.util.HashMap;
import java.util.List;

import com.mvg.entity.Movie;
import com.mvg.entity.User;

public interface RecommendService {

	
	List<Movie> countGenreService(User user);
	
	List<Movie> countNationService(User user);
	
	int countMovieEvalService(User user);
	
	List<Movie> rmdMovieBasedGenreService(HashMap<String, Object> hashmap);
}
