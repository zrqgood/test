package com.sh.validate;

import com.opensymphony.xwork2.validator.ValidationException;
import com.opensymphony.xwork2.validator.validators.FieldValidatorSupport;

public class MyValidate extends FieldValidatorSupport {

	private String name;
	public void validate(Object object) throws ValidationException {
		// TODO Auto-generated method stub
		String fieldName=super.getFieldName();
		String value=super.getFieldValue(fieldName, object).toString();
		
		if(!name.equals(value)){
			super.addFieldError(super.getFieldName(), object);
		}
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	

}
