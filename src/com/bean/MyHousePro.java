package com.bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


import com.db.*;

public class MyHousePro {
	Map<String , HouseBean> cMap=new HashMap<String, HouseBean>();

	public Map<String, HouseBean> getcMap() {

		return cMap;

	}

	/**

	 * 返回选中准备购买的货物

	 * @author Administrator:centre

	 * @param id：传入选中货物的编号

	 * @return cb:操作成功返回一个CartBean

	 */

	private HouseBean getHouse(String id){
		House house=new House();
		HouseBean houseBean=new HouseBean();
		EasyDb<House> easyDb=new EasyDb<House>();
		house.setUuid(id);
		house=easyDb.setTable("house_enquire").queryOne(house);
		//get
		houseBean.setUuid(id);
		houseBean.setDistrict(house.getDistrict());
		houseBean.setMoney(house.getMoney());
		houseBean.setLayout(house.getLayout());
		houseBean.setAddress(house.getAddress());
		houseBean.setAddTime(house.getAddTime());
		houseBean.setDescribes(house.getDescribes());
		houseBean.setAmenf(house.getAmenf());
		houseBean.setFloor(house.getFloor());
		houseBean.setSize(house.getSize());
		houseBean.setType(house.getType());
		if(house.getType() == 0){
			houseBean.setTypeDesc("APARTMENT");
		}else if(house.getType() == 1){
			houseBean.setTypeDesc("VILLA");
		}else if(house.getType() == 2){
			houseBean.setTypeDesc("LANE HOUSE");
		}else if(house.getType() == 3){
			houseBean.setTypeDesc("HIGH BUILDING");
		}else if(house.getType() == 4){
			houseBean.setTypeDesc("OFFICE");
		}
		Img img = new Img();
		img.setHouseId(id);
		EasyDb<Img> imgUtil = new EasyDb<Img>();
		Img img1 = imgUtil.setTable("imgs").queryOne(img);
		houseBean.setImgName(img1.getFileName());
		return houseBean;
	}

	/**

	 * 将cb放入到一个map里

	 * @author Administrator:centre

	 * @param id:商品id

	 */

	public void addHouse(String id){

		if (!cMap.containsKey(id)) {

			cMap.put(id, getHouse(id));         
		}else {
			System.out.println("已经加入，无需重复加入");

		}
	}

	/**

	 * 返回购物车容器

	 * @author Administrator:centre

	 * @return 返回购物车的容器

	 */

	public Map<String , HouseBean> myHouse(){

		return getcMap();

	}

	/**

	 * 删除选定的商品

	 * @author Administrator:centre

	 * @param id：货物的id

	 * @return：删除成功，返回true，否则返回false

	 */

	public void deleteBook(String id){

		cMap.remove(id);

	}

	/**

	 * 删除购物车的所有商品

	 * @author Administrator:centre

	 */

	public void deleteAllBooks(){

		cMap.clear();

	}


	/**

	 * 返回所有购买的货物

	 * @author Administrator:centre

	 * @return:无返回值

	 */

	public List<HouseBean> showMyHouse(){

		List<HouseBean> al=new ArrayList<HouseBean>();

		Iterator it=cMap.keySet().iterator();
		while (it.hasNext()) {

			HouseBean cb=cMap.get(it.next());
			al.add(cb);

		}
		return al;    

	}



}
