package Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import Model.Interview;
import Model.PageBean;
import Model.Programinglanguage;
import Model.ResultMsg;
import Service.LanguageService;
import Service.QuestionbankService;

@Controller
public class QuestionbankController {
	@Autowired
	private QuestionbankService questionbankService;
	
	@Autowired
	private LanguageService languageService;
	
	//question_bank_list页面
	@RequestMapping("/question_bank_list")
	public ModelAndView question_bank_list() {
		PageInfo<Interview> pageInfousers = questionbankService.getInterview();
		ModelAndView mv = new ModelAndView("/question_bank_list");
		mv.addObject("pageInfousers",pageInfousers);
		mv.addObject("key","flag");
		return mv;
	}
	
	//数据分页请求
	@RequestMapping("/question_bank_list2")
	@ResponseBody
	public PageInfo<Interview> question_bank_list2(Integer page,String language,String title) {
		PageHelper.startPage(page, 8);
		if(language != null || title != null ) {
			List<Interview> interview = questionbankService.likeInterview(language, title);
			PageInfo<Interview> in = new PageInfo<Interview>(interview);
			return in;
		}else {
			List<Interview> interview = questionbankService.getInterview(page);
			PageInfo<Interview> in = new PageInfo<Interview>(interview);
			return in;
		}
	}
	
	@RequestMapping("/interview_select")
	public ModelAndView interview_select(String language,String title) {
		System.out.println(language+title);
		List<Interview> interview = questionbankService.likeInterview(language, title);
		PageInfo<Interview> pageInfousers = new PageInfo<Interview>(interview);
		ModelAndView mv = new ModelAndView("/question_bank_list");
		mv.addObject("pageInfousers",pageInfousers);
		mv.addObject("key","true");
		mv.addObject("language",language);
		mv.addObject("title",title);
		return mv;
	}
	
	
	
	 //批量删除 
		@RequestMapping("questionbank_delAll")
		@ResponseBody
		public ResultMsg delAll(String ids) {
			System.out.println(ids);
			 
			List<Object> list = new ArrayList<>();
			String[] str = ids.split(",");
			for (int i = 0; i < str.length; i++) {
				  list.add(str[i]);
			}
		
			int i = questionbankService.delAll(list);
			if(i>0) {
				return new ResultMsg(1, "删除成功！");
			}else {
				return new ResultMsg(0, "删除失败！");
			}
		}
		
		
		 //单个删除 
		@RequestMapping("questionbank_del")
		@ResponseBody
		public ResultMsg del(Integer id) {
			int i = questionbankService.del(id);
			if(i>0) {
				return new ResultMsg(1, "删除成功！");
			}else {
				return new ResultMsg(0, "删除失败！");
			}
		}
		
		//question_bank_update页面
		@RequestMapping("/question_bank_update")
		public ModelAndView question_bank_update(Integer id) {
			Interview in = questionbankService.findInterview(id);
			List<Programinglanguage>  list= languageService.getAllLanguage();
			ModelAndView mv = new ModelAndView("/question_bank_update");
			mv.addObject("language",list);
			mv.addObject("in",in);
			return mv;
		}
		
		//修改题
		@RequestMapping("/update_submit")
		@ResponseBody
		public ResultMsg updateQuestionbank(Interview interview) {
			Interview in = new Interview();
			in.setId(interview.getId());
			in.setLanguageId(interview.getLanguageId());
			in.setTitle(interview.getTitle());
			in.setContent(interview.getContent());
			in.setDifficulty(interview.getDifficulty());
			int i = questionbankService.updateQuestionbank(in);
			if(i>0) {
				return new ResultMsg(1, "修改成功！");
			}else {
				return new ResultMsg(0, "修改失败！");
			}
		}
		
		
		//question_bank_update页面
		@RequestMapping("/question_bank_add")
		public ModelAndView add_submit() {
			List<Programinglanguage>  list= languageService.getAllLanguage();
			ModelAndView mv = new ModelAndView("/question_bank_add");
			mv.addObject("language",list);
			return mv;
		}
		
		
		//修改题
		@RequestMapping("/add_submit")
		@ResponseBody
	    public ResultMsg add_submit(Interview interview) {
			Interview in = new Interview();
			in.setLanguageId(interview.getLanguageId());
			in.setTitle(interview.getTitle());
			in.setContent(interview.getContent());
			in.setDifficulty(interview.getDifficulty());
			int i = questionbankService.addInterview(in);
			if(i>0) {
				return new ResultMsg(1, "添加成功！");
			}else {
				return new ResultMsg(0, "添加失败！");
			}
		}
		
}
