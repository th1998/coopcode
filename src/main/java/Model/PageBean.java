package Model;

import java.util.List;

public class PageBean {

    private List<Users> usersList;        //用户每页的显示的数据
    private List<Interview> interviewList;//面试题每页的显示的数据
    
	public List<Interview> getInterviewList() {
		return interviewList;
	}
	public void setInterviewList(List<Interview> interviewList) {
		this.interviewList = interviewList;
	}
	
	public List<Users> getUsersList() {
		return usersList;
	}
	public void setUsersList(List<Users> usersList) {
		this.usersList = usersList;
	}
    
    
}
