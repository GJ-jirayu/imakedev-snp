package com.imake.lbs.dto;

import java.io.Serializable;
import java.sql.Timestamp;

import com.thoughtworks.xstream.annotations.XStreamAlias;


@XStreamAlias("ArCustomer")
public class ArCustomer implements Serializable {
	private static final long serialVersionUID = 1L;

	 
	private String customerCode;

	 
	private Timestamp createdDttm;
 
	private String customerName;
 
	private int districtCode;

 
	private String districtName;
 
	private String includeReceiptFlag;
 
	private String phoneNo;
 
	private String provinceName;
 
	private String shiftBillDateFlag;
 
	private Timestamp updateDttm;

	 

	public String getCustomerCode() {
		return customerCode;
	}



	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}



	public Timestamp getCreatedDttm() {
		return createdDttm;
	}



	public void setCreatedDttm(Timestamp createdDttm) {
		this.createdDttm = createdDttm;
	}



	public String getCustomerName() {
		return customerName;
	}



	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}



	public int getDistrictCode() {
		return districtCode;
	}



	public void setDistrictCode(int districtCode) {
		this.districtCode = districtCode;
	}



	public String getDistrictName() {
		return districtName;
	}



	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}



	public String getIncludeReceiptFlag() {
		return includeReceiptFlag;
	}



	public void setIncludeReceiptFlag(String includeReceiptFlag) {
		this.includeReceiptFlag = includeReceiptFlag;
	}



	public String getPhoneNo() {
		return phoneNo;
	}



	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}



	public String getProvinceName() {
		return provinceName;
	}



	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}



	public String getShiftBillDateFlag() {
		return shiftBillDateFlag;
	}



	public void setShiftBillDateFlag(String shiftBillDateFlag) {
		this.shiftBillDateFlag = shiftBillDateFlag;
	}



	public Timestamp getUpdateDttm() {
		return updateDttm;
	}



	public void setUpdateDttm(Timestamp updateDttm) {
		this.updateDttm = updateDttm;
	}



	public ArCustomer() {
	}

 
}