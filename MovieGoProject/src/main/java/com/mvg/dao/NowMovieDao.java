package com.mvg.dao;

import java.util.List;

import com.mvg.entity.Movie;
import com.mvg.entity.NowMovie;

public interface NowMovieDao {

	//현재 상영중인 영화의 수
	int getAllNowMovie();
	
	//상영중인 영화 모두 얻어오기
	List<NowMovie> getAllNowMovies();
	
	//상영하려는 영화 추가
	int insertNowMovie(Movie movie);
	
	//상영중인 영화 수정
	int updateNowMovie(Movie movie);
	
	//상영 종료 영화 삭제
	int deleteNowMovie(String movieCode);
	
	//상영 영화 하나 얻어오기
	NowMovie getNowMovieByMovieCode(String movieCode);
	
}
