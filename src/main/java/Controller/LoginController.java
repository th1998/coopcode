package Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import Model.Guser;
import Model.ResultMsg;
import Service.LoginService;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/login")
	public ModelAndView Login() {
		ModelAndView mv = new ModelAndView("/login");
		return mv;
	}
	
	@RequestMapping("/login_submit")
	@ResponseBody
	public ResultMsg login_submit(HttpServletRequest request,Guser g) {
		boolean islogin = false;
		request.getSession().setAttribute("name", g.getName());
		islogin = loginService.execute(g.getName(), g.getPass());
		if(islogin) {
			return new ResultMsg(1,"");
		}else {
			return new ResultMsg(0,"");
		}
		
	}
}
