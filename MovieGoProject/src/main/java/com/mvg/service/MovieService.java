package com.mvg.service;

import java.util.List;

import com.mvg.entity.Movie;

public interface MovieService {

	// 총 영화의 개수
	Integer getAllMovieCntService();

	// 모든 영화 얻어오기
	List<Movie> getAllMoviesService();
	
	List<Movie> randomGetAllMovies(int page);

	
	// 영화 포스터 url 불러오기
	String getMovieThumbnailService(String movieCode);

	// 영화 하나 불러오기
	Movie getMovieByMCodeService(String movieCode);

	// 새 영화 추가
	int insertMovieService(Movie movie);

	// 기존 영화 수정
	int updateMovieService(Movie movie);

	// 영화 삭제
	int deleteMovieService(String movieCode);

}
