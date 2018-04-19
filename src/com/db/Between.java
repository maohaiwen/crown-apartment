package com.db;

public class Between {
	
	public Between(){
		
	}
	
	public Between(String field,Object between,Object and){
		this.field = field;
		this.between = between;
		this.and = and;
	}

	private Object between;
	
	private Object and;
	
	private String field;

	public Object getBetween() {
		return between;
	}

	public void setBetween(Object between) {
		this.between = between;
	}

	public Object getAnd() {
		return and;
	}

	public void setAnd(Object and) {
		this.and = and;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	
}
