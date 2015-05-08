package com.imake.moogle.lbs.backoffice.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * The persistent class for the kpi_result database table.
 * 
 */
public class KpiResult implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer year;

	private Integer periodNo;

	private String employeeCode;

	private String kpiCode;

	private BigDecimal actualData;

	private BigDecimal actualScore;

	private String approvedFlag;

	private Date createdDt;

	private Integer kpiOrder;

	private BigDecimal kpiWeight;

	private BigDecimal lookupBaselineValue;

	private BigDecimal performancePercentage;

	private String targetData;

	private BigDecimal targetScore;

	private Date updatedDt;

	private BigDecimal weightPercentage;

	//Employee
	private String empName;
 
	//kpi  
	private String etlFlag; 
	private String kpiName;
	
	//period
	private String periodDesc;
	
	public KpiResult() {
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getPeriodNo() {
		return periodNo;
	}

	public void setPeriodNo(Integer periodNo) {
		this.periodNo = periodNo;
	}

	public String getEmployeeCode() {
		return employeeCode;
	}

	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}

	public String getKpiCode() {
		return kpiCode;
	}

	public void setKpiCode(String kpiCode) {
		this.kpiCode = kpiCode;
	}

	public BigDecimal getActualData() {
		return actualData;
	}

	public void setActualData(BigDecimal actualData) {
		this.actualData = actualData;
	}

	public BigDecimal getActualScore() {
		return actualScore;
	}

	public void setActualScore(BigDecimal actualScore) {
		this.actualScore = actualScore;
	}

	public String getApprovedFlag() {
		return approvedFlag;
	}

	public void setApprovedFlag(String approvedFlag) {
		this.approvedFlag = approvedFlag;
	}

	public Date getCreatedDt() {
		return createdDt;
	}

	public void setCreatedDt(Date createdDt) {
		this.createdDt = createdDt;
	}

	public Integer getKpiOrder() {
		return kpiOrder;
	}

	public void setKpiOrder(Integer kpiOrder) {
		this.kpiOrder = kpiOrder;
	}

	public BigDecimal getKpiWeight() {
		return kpiWeight;
	}

	public void setKpiWeight(BigDecimal kpiWeight) {
		this.kpiWeight = kpiWeight;
	}

	public BigDecimal getLookupBaselineValue() {
		return lookupBaselineValue;
	}

	public void setLookupBaselineValue(BigDecimal lookupBaselineValue) {
		this.lookupBaselineValue = lookupBaselineValue;
	}

	public BigDecimal getPerformancePercentage() {
		return performancePercentage;
	}

	public void setPerformancePercentage(BigDecimal performancePercentage) {
		this.performancePercentage = performancePercentage;
	}

	public String getTargetData() {
		return targetData;
	}

	public void setTargetData(String targetData) {
		this.targetData = targetData;
	}

	public BigDecimal getTargetScore() {
		return targetScore;
	}

	public void setTargetScore(BigDecimal targetScore) {
		this.targetScore = targetScore;
	}

	public Date getUpdatedDt() {
		return updatedDt;
	}

	public void setUpdatedDt(Date updatedDt) {
		this.updatedDt = updatedDt;
	}

	public BigDecimal getWeightPercentage() {
		return weightPercentage;
	}

	public void setWeightPercentage(BigDecimal weightPercentage) {
		this.weightPercentage = weightPercentage;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEtlFlag() {
		return etlFlag;
	}

	public void setEtlFlag(String etlFlag) {
		this.etlFlag = etlFlag;
	}

	public String getKpiName() {
		return kpiName;
	}

	public void setKpiName(String kpiName) {
		this.kpiName = kpiName;
	}

	public String getPeriodDesc() {
		return periodDesc;
	}

	public void setPeriodDesc(String periodDesc) {
		this.periodDesc = periodDesc;
	}

	

}