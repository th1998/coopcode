package Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import Dao.QuestionbankDao;
import Model.Interview;


@Service
public class QuestionbankService {
	@Autowired
	private QuestionbankDao questionbankDao;
	
	public PageInfo<Interview> getInterview(){
		List<Interview> a= questionbankDao.getInterview();
		PageInfo<Interview> page = new PageInfo<>(a);
		return page;
	}
	
	public List<Interview> getInterview(Integer page){
		List<Interview> a= questionbankDao.getInterview();
		return a;
	}
	
	public List<Interview> likeInterview(String language,String title){
		return questionbankDao.likeInterview(language, title);
	}
	
	public int delAll(List<Object> list) {
		return questionbankDao.delAll(list);
	}
	
	public int del(Integer id) {
		return questionbankDao.del(id);
	}
	
	public Interview findInterview(Integer id){
		return questionbankDao.findInterview(id);
	}
	
	public int updateQuestionbank(Interview interview) {
		return questionbankDao.updateQuestionbank(interview);
	}
	
	public int addInterview(Interview interview) {
		return questionbankDao.addInterview(interview);
	}
}
