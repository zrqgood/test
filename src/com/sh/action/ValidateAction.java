package com.sh.action;

import java.util.Date;
import java.util.regex.Pattern;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.xml.internal.fastinfoset.stax.events.Util;

public class ValidateAction extends ActionSupport {
private String name;
private String pwd;
private Date date;


@Override
public String execute() throws Exception {
	// TODO Auto-generated method stub
	return SUCCESS;
}

@Override  //������е� ������������ ���� execute login
public void validate() {
	if(date==null || date.after(new Date())){
		addFieldError("date", "����������Ч��");
	}
	if(pwd==null || Util.isEmptyString(pwd)){
		addFieldError("pwd", "���벻��Ϊ�գ�");
	}
}

//��½����
public String login(){
	return SUCCESS;
}
//ֻ�Ե�¼��������У��
public void validateLogin(){
	if(name!=null && !Pattern.matches("\\w{6,15}", name.trim())){
		addFieldError(name, "validateLogin()����������");
	}
}
public Date getDate() {
	return date;
}

public void setDate(Date date) {
	this.date = date;
}

public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getPwd() {
	return pwd;
}
public void setPwd(String pwd) {
	this.pwd = pwd;
}

}
