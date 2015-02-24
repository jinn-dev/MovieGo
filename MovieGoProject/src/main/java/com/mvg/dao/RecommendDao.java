package com.mvg.dao;

import java.util.HashMap;
import java.util.List;

import com.mvg.entity.Movie;
import com.mvg.entity.Recommend;
import com.mvg.entity.User;

public interface RecommendDao {

	// 평가한 영화 장르 통계 
	List<Recommend> countGenre(User user);
	
	
	// 평가한 영화 갯수
	int countMovieEval(User user);
	
	// 장르 기반 추천 
	List<Movie> recommendMovieBasedGenre(HashMap<String, Object> hashmap);
	
}
