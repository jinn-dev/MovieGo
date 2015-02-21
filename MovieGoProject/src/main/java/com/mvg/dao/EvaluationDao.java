package com.mvg.dao;

import java.util.List;

import com.mvg.entity.Evaluation;

public interface EvaluationDao {
	
	//모든 평가의 수
	int getAllEvaluationCount();
	
	//모든 평가 얻어오기
	List<Evaluation> getAllEvaluations();
	
	//사용자별 평가 얻어오기
	List<Evaluation> getEvaluationByUserId(String userId);
	
	//영화별 평가 얻어오기
	List<Evaluation> getEvaluationByMovieCode(String movieCode);
	
	//평가 추가
	int insertEvaluation(Evaluation evaluation);
	
	//평가 삭제
	int deleteEvaluation(int evId);
	
	//평가 수정
	int updateEvaluation(Evaluation evaluation);
	
	//평가시, 중복확인 위한 것
	int selectEvaluationByMovieCode(String movieCode, String userId);
	
	//별점만 수정
	int updateRating(Evaluation evaluation);
	
	int selectEvId(String movieCode, String userId);

}
