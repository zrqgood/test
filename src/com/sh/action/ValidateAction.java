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

@Override  //会对所有的 方法都有作用 比如 execute login
public void validate() {
	if(date==null || date.after(new Date())){
		addFieldError("date", "出生日期无效！");
	}
	if(pwd==null || Util.isEmptyString(pwd)){
		addFieldError("pwd", "密码不能为空！");
	}
}

//登陆方法
public String login(){
	return SUCCESS;
}
//只对登录方法进行校验
public void validateLogin(){
	if(name!=null && !Pattern.matches("\\w{6,15}", name.trim())){
		addFieldError(name, "validateLogin()方法的作用");
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
