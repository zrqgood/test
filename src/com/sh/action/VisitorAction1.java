package com.sh.action;

import com.opensymphony.xwork2.ActionSupport;
import com.sh.pojo.User;

public class VisitorAction1  extends ActionSupport{

	private User uu;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public User getUu() {
		return uu;
	}

	public void setUu(User uu) {
		this.uu = uu;
	}

	
	
}
