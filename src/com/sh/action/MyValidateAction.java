package com.sh.action;

import com.opensymphony.xwork2.ActionSupport;

public class MyValidateAction extends ActionSupport {
private String name;

@Override
public String execute() throws Exception {
	// TODO Auto-generated method stub
	return SUCCESS;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

}
