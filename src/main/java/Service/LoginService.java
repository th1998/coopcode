package Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.LoginDao;
import Model.Guser;


@Service
public class LoginService {
	@Autowired
	private LoginDao loginDao;
	
	public boolean execute(String name,String pass){
		Guser m = new Guser();
		m.setName(name);
		m.setPass(pass);
		Guser g = loginDao.getManager(m);
		if(g!=null) {
			return true;
		}else {
			return false;
		}
	}
}
