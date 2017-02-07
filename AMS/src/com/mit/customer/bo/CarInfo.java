package com.mit.customer.bo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * T_CAR_INFO 实体类 Tue Oct 11 11:52:36 CST 2016 刘鹏飞
 */

public class CarInfo {
	private Long id;
	private String brand;
	private String car_seri;
	private String car_type;
	private String outer_color;
	private String inner_color;
	private String vin;
	private String engine_num;
	private String cer_num;
	private String key_num;
	@DateTimeFormat(pattern="yyyy") 
	private Date year;
	private String ori_place;
	@DateTimeFormat(pattern="yyyy-MM-dd") 
	private Date creat_date;
	@DateTimeFormat(pattern="yyyy-MM-dd") 
	private Date out_fa_date;
	private String use_type;
	private String spare_num;
	@DateTimeFormat(pattern="yyyy-MM-dd") 
	private Date fir_date;
	private String serv_type;
	private Long mileages;
	private Long car_price;
	private String car_plates;
	private String seller;
	private Long cus_id;
	private String bak;
	private String del_flag;
	private String centerid;
	private String cus_name;
	private String vehicle_code;
	private String vehicle_name;
	private String group_name;
	private String body_type;
	private String engine_desc;
	private String engine_model;
	private String inairform;
	private String array_type;
	private String valve_num;
	private String fuel_jet_type;
	private String supply_oil;
	private String driven_type;
	private String gearbox_name;
	private String gear_num;
	private String door_num;
	private String wheelbase;
	private String year_pattern;
	private String cfg_level;

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getBrand() {
		return brand;
	}

	public void setCar_seri(String car_seri) {
		this.car_seri = car_seri;
	}

	public String getCar_seri() {
		return car_seri;
	}

	public void setCar_type(String car_type) {
		this.car_type = car_type;
	}

	public String getCar_type() {
		return car_type;
	}

	public void setOuter_color(String outer_color) {
		this.outer_color = outer_color;
	}

	public String getOuter_color() {
		return outer_color;
	}

	public void setInner_color(String inner_color) {
		this.inner_color = inner_color;
	}

	public String getInner_color() {
		return inner_color;
	}

	public void setVin(String vin) {
		this.vin = vin;
	}

	public String getVin() {
		return vin;
	}

	public void setEngine_num(String engine_num) {
		this.engine_num = engine_num;
	}

	public String getEngine_num() {
		return engine_num;
	}

	public void setCer_num(String cer_num) {
		this.cer_num = cer_num;
	}

	public String getCer_num() {
		return cer_num;
	}

	public void setKey_num(String key_num) {
		this.key_num = key_num;
	}

	public String getKey_num() {
		return key_num;
	}

	public void setYear(Date year) {
		this.year = year;
	}

	public Date getYear() {
		return year;
	}

	public void setOri_place(String ori_place) {
		this.ori_place = ori_place;
	}

	public String getOri_place() {
		return ori_place;
	}

	public void setCreat_date(Date creat_date) {
		this.creat_date = creat_date;
	}

	public Date getCreat_date() {
		return creat_date;
	}

	public void setOut_fa_date(Date out_fa_date) {
		this.out_fa_date = out_fa_date;
	}

	public Date getOut_fa_date() {
		return out_fa_date;
	}

	public void setUse_type(String use_type) {
		this.use_type = use_type;
	}

	public String getUse_type() {
		return use_type;
	}

	public void setSpare_num(String spare_num) {
		this.spare_num = spare_num;
	}

	public String getSpare_num() {
		return spare_num;
	}

	public void setFir_date(Date fir_date) {
		this.fir_date = fir_date;
	}

	public Date getFir_date() {
		return fir_date;
	}

	public void setServ_type(String serv_type) {
		this.serv_type = serv_type;
	}

	public String getServ_type() {
		return serv_type;
	}

	public void setMileages(Long mileages) {
		this.mileages = mileages;
	}

	public Long getMileages() {
		return mileages;
	}

	public void setCar_price(Long car_price) {
		this.car_price = car_price;
	}

	public Long getCar_price() {
		return car_price;
	}

	public void setCar_plates(String car_plates) {
		this.car_plates = car_plates;
	}

	public String getCar_plates() {
		return car_plates;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public String getSeller() {
		return seller;
	}

	public void setCus_id(Long cus_id) {
		this.cus_id = cus_id;
	}

	public Long getCus_id() {
		return cus_id;
	}

	public void setBak(String bak) {
		this.bak = bak;
	}

	public String getBak() {
		return bak;
	}

	public void setDel_flag(String del_flag) {
		this.del_flag = del_flag;
	}

	public String getDel_flag() {
		return del_flag;
	}

	public String getCus_name() {
		return cus_name;
	}

	public void setCus_name(String cus_name) {
		this.cus_name = cus_name;
	}

	public String getCenterid() {
		return centerid;
	}

	public void setCenterid(String centerid) {
		this.centerid = centerid;
	}

	public String getVehicle_code() {
		return vehicle_code;
	}

	public void setVehicle_code(String vehicle_code) {
		this.vehicle_code = vehicle_code;
	}

	public String getVehicle_name() {
		return vehicle_name;
	}

	public void setVehicle_name(String vehicle_name) {
		this.vehicle_name = vehicle_name;
	}

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	public String getBody_type() {
		return body_type;
	}

	public void setBody_type(String body_type) {
		this.body_type = body_type;
	}

	public String getEngine_desc() {
		return engine_desc;
	}

	public void setEngine_desc(String engine_desc) {
		this.engine_desc = engine_desc;
	}

	public String getEngine_model() {
		return engine_model;
	}

	public void setEngine_model(String engine_model) {
		this.engine_model = engine_model;
	}

	public String getInairform() {
		return inairform;
	}

	public void setInairform(String inairform) {
		this.inairform = inairform;
	}

	public String getArray_type() {
		return array_type;
	}

	public void setArray_type(String array_type) {
		this.array_type = array_type;
	}

	public String getValve_num() {
		return valve_num;
	}

	public void setValve_num(String valve_num) {
		this.valve_num = valve_num;
	}

	public String getFuel_jet_type() {
		return fuel_jet_type;
	}

	public void setFuel_jet_type(String fuel_jet_type) {
		this.fuel_jet_type = fuel_jet_type;
	}

	public String getSupply_oil() {
		return supply_oil;
	}

	public void setSupply_oil(String supply_oil) {
		this.supply_oil = supply_oil;
	}

	public String getDriven_type() {
		return driven_type;
	}

	public void setDriven_type(String driven_type) {
		this.driven_type = driven_type;
	}

	public String getGearbox_name() {
		return gearbox_name;
	}

	public void setGearbox_name(String gearbox_name) {
		this.gearbox_name = gearbox_name;
	}

	public String getGear_num() {
		return gear_num;
	}

	public void setGear_num(String gear_num) {
		this.gear_num = gear_num;
	}

	public String getDoor_num() {
		return door_num;
	}

	public void setDoor_num(String door_num) {
		this.door_num = door_num;
	}

	public String getWheelbase() {
		return wheelbase;
	}

	public void setWheelbase(String wheelbase) {
		this.wheelbase = wheelbase;
	}

	public String getYear_pattern() {
		return year_pattern;
	}

	public void setYear_pattern(String year_pattern) {
		this.year_pattern = year_pattern;
	}

	public String getCfg_level() {
		return cfg_level;
	}

	public void setCfg_level(String cfg_level) {
		this.cfg_level = cfg_level;
	}
	
}
