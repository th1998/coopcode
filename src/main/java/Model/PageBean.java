package Model;

import java.util.List;

public class PageBean {

    private List<Users> usersList;        //�û�ÿҳ����ʾ������
    private List<Interview> interviewList;//������ÿҳ����ʾ������
    
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
