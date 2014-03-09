package com.sh.pojo;

import java.util.Date;

public class User {
private String name;
private String pwd;
private int age;
private String address;
private Date birthday;
private Double sal;
private String myCode;

public String getMyCode() {
	return myCode;
}
public void setMyCode(String myCode) {
	this.myCode = myCode;
}
public Double getSal() {
	return sal;
}
public void setSal(Double sal) {
	this.sal = sal;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public Date getBirthday() {
	return birthday;
}
public void setBirthday(Date birthday) {
	this.birthday = birthday;
}
private String mobile;

public int getAge() {
	return age;
}
public void setAge(int age) {
	this.age = age;
}
public String getMobile() {
	return mobile;
}
public void setMobile(String mobile) {
	this.mobile = mobile;
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
