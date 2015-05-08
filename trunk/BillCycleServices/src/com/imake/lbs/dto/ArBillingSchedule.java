package com.imake.lbs.dto;

import java.io.Serializable;
import java.sql.Timestamp;

import com.thoughtworks.xstream.annotations.XStreamAlias;


@XStreamAlias("ArBillingSchedule")
public class ArBillingSchedule implements Serializable {
	private static final long serialVersionUID = 1L;
    private String arbillingSchedule;
	//ID 
	private String customerCode;

	public String getArbillingSchedule() {
		return arbillingSchedule;
	}



	public void setArbillingSchedule(String arbillingSchedule) {
		this.arbillingSchedule = arbillingSchedule;
	}



	private String schedule;

	private String type;
	

	
	private Timestamp createdDttm;

 
	private String timeFromStr;

 
	private String timeToStr;

	 
	private Timestamp updatedDttm;

	 

	public ArBillingSchedule() {
	}



	public String getCustomerCode() {
		return customerCode;
	}



	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}



	public String getSchedule() {
		return schedule;
	}



	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}



	public Timestamp getCreatedDttm() {
		return createdDttm;
	}



	public void setCreatedDttm(Timestamp createdDttm) {
		this.createdDttm = createdDttm;
	}



	public String getTimeFromStr() {
		return timeFromStr;
	}



	public void setTimeFromStr(String timeFromStr) {
		this.timeFromStr = timeFromStr;
	}



	public String getTimeToStr() {
		return timeToStr;
	}



	public void setTimeToStr(String timeToStr) {
		this.timeToStr = timeToStr;
	}



	public Timestamp getUpdatedDttm() {
		return updatedDttm;
	}



	public void setUpdatedDttm(Timestamp updatedDttm) {
		this.updatedDttm = updatedDttm;
	}
 
}