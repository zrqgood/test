package com.sh.action;

import java.util.Date;

import com.opensymphony.xwork2.ActionSupport;

public class RequiredAction extends ActionSupport {
	private String userName;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		System.out.println(userName);
		if(userName==null){
			System.out.println(true);
		}
		else{
			System.out.println(false);
		}
		return SUCCESS;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	

}
