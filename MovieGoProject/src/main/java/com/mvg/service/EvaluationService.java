package com.mvg.service;

import com.mvg.entity.Evaluation;

public interface EvaluationService {
	public int insertEvaluation(Evaluation evaluation);
	public int updateEvaluation(Evaluation evaluation);
	public int selectEvaluationByMovieCode(String movieCode, String userId);
	public int updateRating(Evaluation evaluation);
	public int selectEvId(String movieCode, String userId);
	
}
