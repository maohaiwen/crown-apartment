package com.bean;

import java.util.Date;
import java.util.List;

public class House {
	private Integer id;
	private String uuid;
	private String address;
	private Integer type;
	private String district;	
	private String describes;
	private String owner;
	private String mobile;
	private String phone;
	private String email;
	private Integer size;
	private Integer money;
	private Integer shi;
	private Integer wei;	
	private Integer floor;
	private String x;
	private String y;
	private String layout;
	private Integer year;
	private Integer month;
	private String addTime;
	private Integer recommend;
	private Integer mark;
	private String railwayNo;
	private String railwayAddress;
	private Integer railwayTime;
	private String railwayNo1;
	private String railwayAddress1;
	private Integer railwayTime1;
	//0  出租  1 未审核      2 未出租
	private Integer state;	
	private String serial;
	private String expire_date;
	private String amenf;
	private List<Img> imgs;
	
	public Integer getFloor() {
		return floor;
	}
	public void setFloor(Integer floor) {
		this.floor = floor;
	}
	public Integer getShi() {
		return shi;
	}
	public void setShi(Integer shi) {
		this.shi = shi;
	}	
	public String getLayout() {
		return layout;
	}
	public void setLayout(String layout) {
		this.layout = layout;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public List<Img> getImgs() {
		return imgs;
	}
	public void setImgs(List<Img> imgs) {
		this.imgs = imgs;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getRailwayNo1() {
		return railwayNo1;
	}
	public void setRailwayNo1(String railwayNo1) {
		this.railwayNo1 = railwayNo1;
	}
	public String getRailwayAddress1() {
		return railwayAddress1;
	}
	public void setRailwayAddress1(String railwayAddress1) {
		this.railwayAddress1 = railwayAddress1;
	}
	public Integer getRailwayTime1() {
		return railwayTime1;
	}
	public void setRailwayTime1(Integer railwayTime1) {
		this.railwayTime1 = railwayTime1;
	}
	public String getAmenf() {
		return amenf;
	}
	public void setAmenf(String amenf) {
		this.amenf = amenf;
	}
	public String getDescribes() {
		return describes;
	}
	public void setDescribes(String describes) {
		this.describes = describes;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	public Integer getMoney() {
		return money;
	}
	public void setMoney(Integer money) {
		this.money = money;
	}	
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public Integer getMonth() {
		return month;
	}
	public void setMonth(Integer month) {
		this.month = month;
	}
	public String getAddTime() {
		return addTime;
	}
	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}
	public Integer getRecommend() {
		return recommend;
	}
	public void setRecommend(Integer recommend) {
		this.recommend = recommend;
	}
	public Integer getMark() {
		return mark;
	}
	public void setMark(Integer mark) {
		this.mark = mark;
	}
	public String getRailwayNo() {
		return railwayNo;
	}
	public void setRailwayNo(String railwayNo) {
		this.railwayNo = railwayNo;
	}
	public String getRailwayAddress() {
		return railwayAddress;
	}
	public void setRailwayAddress(String railwayAddress) {
		this.railwayAddress = railwayAddress;
	}
	public Integer getRailwayTime() {
		return railwayTime;
	}
	public void setRailwayTime(Integer railwayTime) {
		this.railwayTime = railwayTime;
	}
	public String getX() {
		return x;
	}
	public void setX(String x) {
		this.x = x;
	}
	public String getY() {
		return y;
	}
	public void setY(String y) {
		this.y = y;
	}
	public Integer getWei() {
		return wei;
	}
	public void setWei(Integer wei) {
		this.wei = wei;
	}
	public String getSerial() {
		return serial;
	}
	public void setSerial(String serial) {
		this.serial = serial;
	}
	public String getExpire_date() {
		return expire_date;
	}
	public void setExpire_date(String expire_date) {
		this.expire_date = expire_date;
	}	
}
