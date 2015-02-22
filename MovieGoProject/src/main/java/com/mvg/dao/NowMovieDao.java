package com.mvg.dao;

import java.util.List;
import java.util.Map;

import com.mvg.entity.Movie;
import com.mvg.entity.NowMovie;

public interface NowMovieDao {

	//현재 상영중인 영화의 수
	int getAllNowMovieCnt();
	
	//상영중인 영화 모두 얻어오기
	List<NowMovie> getAllNowMovies();
	
	//영화별 상영정보 얻어오기
	List<NowMovie> getNowMovieByMovieCode(String movieCode);
	
	//극장별 상영정보 얻어오기
	List<NowMovie> getNowMovieByTheaterId(int theaterId);
	
	//상영중인 영화의 이름, 코드 얻어오기
	Map<String, String> getAllNowMovieNames(int theaterId);
	
	//영화관, 영화코드 이용하여 상영시간 얻어오기
	Map<String, String> getNMovieTimeByThAndMovie(int theaterId, String movieCode);
	
	//모든 정보를 이용해서 상영영화의 아이디 얻어오기
	int getNMovieIdByNMovie(int theaterId, String movieCode, String movieTime);
	
	//상영하려는 영화 추가
	int insertNowMovie(Movie movie);
	
	//상영중인 영화 수정
	int updateNowMovie(Movie movie);
	
	//상영 종료 영화 삭제
	int deleteNowMovie(String movieCode);
	
	//시간 이쁘게얻어오기
	String getMovieTimeAmPm(String movieTime);
	
}
