package com.db;

public class Like {
	
	public Like(){
		
	}
	
	public Like(String key, Object value) {
		this.key = key;
		this.value = value;
	}
	
	public Like(String key, Object value, boolean pre) {
		this.key = key;
		this.value = value;
		this.pre = pre;
	}

	public Like(String key, Object value, boolean pre, boolean after) {
		this.key = key;
		this.value = value;
		this.pre = pre;
		this.after = after;
	}

	private String key;
	
	private Object value;
	
	private boolean pre = true;
	
	private boolean after = true;

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

	public boolean isPre() {
		return pre;
	}

	public void setPre(boolean pre) {
		this.pre = pre;
	}

	public boolean isAfter() {
		return after;
	}

	public void setAfter(boolean after) {
		this.after = after;
	}
	
	
}
