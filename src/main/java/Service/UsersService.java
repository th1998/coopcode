package Service;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;

import Dao.UsersDao;
import Model.Users;


@Service
public class UsersService {
	@Autowired
	private UsersDao usersDao;
	

	public PageInfo<Users> getUsers(){
		List<Users> a= usersDao.getUsers();
		PageInfo<Users> page = new PageInfo<>(a);
		return page;
	}
	
	public List<Users> getUsers(Integer page){
		List<Users> a= usersDao.getUsers();
		return a;
	}
	
	public List<Users> likeUsers(Integer id,String accountNumber,String nickName){
		return usersDao.likeUsers(id, accountNumber, nickName);
	}
	
	public int delAll(List<Object> list) {
		return usersDao.delAll(list);
	}
	
	public int addUser(Users user) {
		return usersDao.addUser(user);
	}
	
	public int findOnlyUser(String accountNumber) {
		return usersDao.findOnlyUser(accountNumber);
	}
	
	public int findOnlyUser2(String nickName) {
		return usersDao.findOnlyUser2(nickName);
	}
	
	public int del(Integer id) {
		return usersDao.del(id);
	}
}
