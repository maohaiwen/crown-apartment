package com.db;

public class OrderBy {
	
	public OrderBy(){
		
	}
	
	public OrderBy(String field) {
		this.field = field;
	}

	public OrderBy(String field, boolean asc) {
		this.field = field;
		this.asc = asc;
	}

	private String field;
	
	private boolean asc = true;

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public boolean isAsc() {
		return asc;
	}

	public void setAsc(boolean asc) {
		this.asc = asc;
	}
	
	
}
