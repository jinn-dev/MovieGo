package com.mvg.dao;

import java.util.HashMap;
import java.util.List;

import com.mvg.entity.Movie;
import com.mvg.entity.User;

public interface RecommendDao {

	// 선호장르 통계 
	List<Movie> countGenre(User user);
	
	// 선호국가 통계
	List<Movie> countNation(User user);
	
	// 평가한영화 갯수
	int countMovieEval(User user);
	
	// 선호장르 기반 추천 
	List<Movie> recommendMovieBasedGenre(HashMap<String, Object> hashmap);
	
}
