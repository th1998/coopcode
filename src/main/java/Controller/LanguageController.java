package Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import Model.Programinglanguage;
import Model.ResultMsg;
import Service.LanguageService;

@Controller
public class LanguageController {
	@Autowired
	private LanguageService languageService;
	
	@RequestMapping("/language_list")
	public ModelAndView language_list() {
		ModelAndView mv = new ModelAndView("/language_list");
		return mv;
	}
	
	@RequestMapping("/getAllLanguage")
    @ResponseBody
	public List<Programinglanguage> getAllLanguage(){
		List<Programinglanguage>  list= languageService.getAllLanguage();
		return list;
	}
	
	@RequestMapping("/add_language")
    @ResponseBody
	public ResultMsg addLanguage(String language) {
		int i = languageService.addLanguage(language);
		if(i>0) {
			return new ResultMsg(1,"Ìí¼Ó³É¹¦");
		}else {
			return new ResultMsg(0,"Ìí¼ÓÊ§°Ü");
		}
	}
	
	@RequestMapping("/del_language")
    @ResponseBody
	public ResultMsg delLanguage(Integer id) {
		int i = languageService.delLanguage(id);
		if(i>0) {
			return new ResultMsg(1,"É¾³ý³É¹¦");
		}else {
			return new ResultMsg(0,"É¾³ýÊ§°Ü");
		}
	}
	
}
