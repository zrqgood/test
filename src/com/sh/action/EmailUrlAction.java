package com.sh.action;

import com.opensymphony.xwork2.ActionSupport;

public class EmailUrlAction extends ActionSupport {
private String email;//ÓÊ¼þµØÖ·
private String url;

@Override
public String execute() throws Exception {
	// TODO Auto-generated method stub
	return SUCCESS;
}

public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getUrl() {
	return url;
}
public void setUrl(String url) {
	this.url = url;
}

}
