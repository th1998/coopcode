package Dao;

import java.util.List;
import Model.Users;

public interface UsersDao {
	List<Users> getUsers();
	List<Users> likeUsers(Integer id,String accountNumber,String nickName);
	int delAll(List<Object> list);
	int addUser(Users user);
	int findOnlyUser(String accountNumber);
	int findOnlyUser2(String nickName);
	int del(Integer id);
}
