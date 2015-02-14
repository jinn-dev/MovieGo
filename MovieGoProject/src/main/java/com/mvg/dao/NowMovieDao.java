package com.mvg.dao;

import java.util.List;

import com.mvg.entity.Movie;
import com.mvg.entity.NowMovie;

public interface NowMovieDao {

	//현재 상영중인 영화의 수
	int getAllNowMovieCnt();
	
	//상영중인 영화 모두 얻어오기
	List<NowMovie> getAllNowMovies();
	
	//영화별 상영정보 얻어오기
	List<NowMovie> getNowMovieByMovieCode(String movieCode);
	
	//상영하려는 영화 추가
	int insertNowMovie(Movie movie);
	
	//상영중인 영화 수정
	int updateNowMovie(Movie movie);
	
	//상영 종료 영화 삭제
	int deleteNowMovie(String movieCode);
	
}
