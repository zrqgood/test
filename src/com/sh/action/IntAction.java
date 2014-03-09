package com.sh.action;

import com.opensymphony.xwork2.ActionSupport;

public class IntAction extends ActionSupport {

private int age;

public int getAge() {
	return age;
}

public void setAge(int age) {
	this.age = age;
}

@Override
public String execute() throws Exception {
	// TODO Auto-generated method stub
	return SUCCESS;
}


}
