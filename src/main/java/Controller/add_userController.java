package Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import Model.ResultMsg;
import Model.Users;
import Service.UsersService;

@Controller
public class add_userController {
	
	@Autowired
	private UsersService usersService;
	
	@RequestMapping("/add_user")
	public ModelAndView add_user() {
		ModelAndView mv = new ModelAndView("/add_user");
		return mv;	
	}
	
	@RequestMapping("/add_user_submit")
	@ResponseBody
	public ModelAndView add_user_submit(Users user) {
		Users u = new Users();
		u.setAccountNumber(user.getAccountNumber());
		u.setSex(user.getSex());
		u.setBirthday(user.getBirthday());
		u.setPassword(user.getPassword());
		u.setPhoneNumber(user.getPhoneNumber());
		u.setNickName(user.getNickName());
		int i = usersService.addUser(u);
		System.out.println(i);
		if(i>0) {
			ModelAndView mv = new ModelAndView("/add_user");
			mv.addObject("flag",1);
			return mv;
		}else {
			ModelAndView mv = new ModelAndView("/add_user");
			mv.addObject("flag",3);
			return mv;
		}
		
	}
	
	
	@RequestMapping("/findOnlyUser")
	@ResponseBody
	public ResultMsg findOnlyUser(String accountNumber) {
		int i = usersService.findOnlyUser(accountNumber);
		if(i>0) {
			return new ResultMsg(1,"该账号已存在!");
		}else { 
			return new ResultMsg(0,"该账号可以使用!");
		}
	}
	
	@RequestMapping("/findOnlyUser2")
	@ResponseBody
	public ResultMsg findOnlyUser2(String nickName) {
		int i = usersService.findOnlyUser2(nickName);
		if(i>0) {
			return new ResultMsg(1,"该昵称已存在!");
		}else { 
			return new ResultMsg(0,"该昵称可以使用!");
		}
	}
}
