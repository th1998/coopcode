package Dao;

import java.util.List;

import Model.Interview;


public interface QuestionbankDao {
	List<Interview> getInterview();
	List<Interview> likeInterview(String language,String title);
	int delAll(List<Object> list);
	int del(Integer id);
	Interview findInterview(Integer id);
	int updateQuestionbank(Interview interview);
	int addInterview(Interview interview);
}
