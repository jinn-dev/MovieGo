package com.mvg.service;

import java.util.List;
import java.util.Map;

import com.mvg.entity.Movie;
import com.mvg.entity.NowMovie;

public interface NowMovieService {
	// 현재 상영중인 영화의 수
	int getAllNMovieCntService();

	// 상영중인 영화 모두 얻어오기
	List<NowMovie> getAllNMoviesService();

	// 영화별 상영영화 얻어오기
	List<NowMovie> getNMovieByMCodeService(String movieCode);
	
	//상영영화이름
	Map<String, String> getAllNMovieNamesService(int theaterId);
	
	// 상영하려는 영화 추가
	int insertNMovieService(Movie movie);

	// 상영중인 영화 수정
	int updateNMovieService(Movie movie);

	// 상영 종료 영화 삭제
	int deleteNMovieService(String movieCode);

}
