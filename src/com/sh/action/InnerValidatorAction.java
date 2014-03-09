package com.sh.action;

import com.opensymphony.xwork2.ActionSupport;

public class InnerValidatorAction extends ActionSupport {

	private int age;
	private String name;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}
	
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
