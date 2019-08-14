package Controller;



import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import Model.PageBean;
import Model.ResultMsg;
import Model.Users;
import Service.UsersService;

@Controller
public class user_listController {
	
	@Autowired
	private UsersService usersService;
	
	//user_listÒ³Ãæ
	@RequestMapping("/user_list")
	public ModelAndView user_list() {
		PageInfo<Users> pageInfousers = usersService.getUsers();
		ModelAndView mv = new ModelAndView("/user_list");
		mv.addObject("pageInfousers",pageInfousers);
		mv.addObject("key","flag");
		return mv;
	}
	
	//Êý¾Ý·ÖÒ³ÇëÇó
	@RequestMapping("/userslist")
	@ResponseBody
	public PageInfo<Users> getUsers(Integer page,Integer id,String accountNumber,String nickName){
		PageHelper.startPage(page, 8);
		if(id != null || accountNumber != null || nickName != null) {
			List<Users> u = usersService.likeUsers(id, accountNumber, nickName);
			PageInfo<Users> users = new PageInfo<Users>(u);
			return users;
		}else {
			List<Users> u = usersService.getUsers(page);
			PageInfo<Users> users = new PageInfo<Users>(u);
			return users;
		}
		
	}
	
	
	@RequestMapping("user_select")
	public ModelAndView user_select(Integer id,String accountNumber,String nickName) {
		
		List<Users> u = usersService.likeUsers(id, accountNumber, nickName);
		PageInfo<Users> pageInfousers = new PageInfo<Users>(u);
		ModelAndView mv = new ModelAndView("user_list");
		mv.addObject("pageInfousers",pageInfousers);
		mv.addObject("key","true");
		mv.addObject("id",id);
		mv.addObject("accountNumber",accountNumber);
		mv.addObject("nickName",nickName);
		return mv;
	}
	
	//ÅúÁ¿É¾³ý 
	@RequestMapping("user_delAll")
	@ResponseBody
	public ResultMsg delAll(String ids) {
		System.out.println(ids);
		 
		List<Object> list = new ArrayList<>();
		String[] str = ids.split(",");
		for (int i = 0; i < str.length; i++) {
			  list.add(str[i]);
		}
	
		int i = usersService.delAll(list);
		if(i>0) {
			return new ResultMsg(1, "É¾³ý³É¹¦£¡");
		}else {
			return new ResultMsg(0, "É¾³ýÊ§°Ü£¡");
		}
	}
	
	//µ¥¸öÉ¾³ý
	@RequestMapping("del_submit")
	@ResponseBody
	public ResultMsg del(Integer id) {
		int i = usersService.del(id);
		if(i>0) {
			return new ResultMsg(1, "É¾³ý³É¹¦£¡");
		}else {
			return new ResultMsg(0, "É¾³ýÊ§°Ü£¡");
		}
	}
	
}
