package com.imake.lbs.dto;

import java.io.Serializable;
import java.sql.Time;
import java.sql.Timestamp;

import com.thoughtworks.xstream.annotations.XStreamAlias;


@XStreamAlias("ArPaymentSchedule")
public class ArPaymentSchedule implements Serializable {
	private static final long serialVersionUID = 1L;
	private String arpaymentSchedule;
	//ID
	private String customerCode;

	private String schedule;

	private String type;

	 
	private Timestamp createdDttm;

 
	private Time timeFromStr;
 
	private Time timeToStr;

 
	private Timestamp updatedDttm;

	 

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



	public Time getTimeFromStr() {
		return timeFromStr;
	}



	public void setTimeFromStr(Time timeFromStr) {
		this.timeFromStr = timeFromStr;
	}



	public Time getTimeToStr() {
		return timeToStr;
	}



	public void setTimeToStr(Time timeToStr) {
		this.timeToStr = timeToStr;
	}



	public Timestamp getUpdatedDttm() {
		return updatedDttm;
	}



	public void setUpdatedDttm(Timestamp updatedDttm) {
		this.updatedDttm = updatedDttm;
	}



	public String getArpaymentSchedule() {
		return arpaymentSchedule;
	}



	public void setArpaymentSchedule(String arpaymentSchedule) {
		this.arpaymentSchedule = arpaymentSchedule;
	}



	public ArPaymentSchedule() {
	}

	 
}