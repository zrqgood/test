package com.sh.action;

import com.opensymphony.xwork2.ActionSupport;

public class ExpressionAction extends ActionSupport {

	private int min1;
	private int max1;
	private int min2;
	private int max2;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}
	public int getMin1() {
		return min1;
	}
	public void setMin1(int min1) {
		this.min1 = min1;
	}
	public int getMax1() {
		return max1;
	}
	public void setMax1(int max1) {
		this.max1 = max1;
	}
	public int getMin2() {
		return min2;
	}
	public void setMin2(int min2) {
		this.min2 = min2;
	}
	public int getMax2() {
		return max2;
	}
	public void setMax2(int max2) {
		this.max2 = max2;
	}
	
	
	
}
