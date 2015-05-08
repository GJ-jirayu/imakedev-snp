package com.imake.moogle.lbs.backoffice.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


 
public class EmployeeResult implements Serializable {
	private static final long serialVersionUID = 1L;


	private Integer year; 
	private Integer periodNo;

	private String employeeCode;

	private BigDecimal adjustPercentage;

	private String adjustmentReason;

	private BigDecimal averageWeightPercentage;

	private Date createdDt;

	private BigDecimal finalPercentage;

	private Date updatedDt;

	private BigDecimal weightPercentage;

	private BigDecimal workingAge;

	//bi-directional many-to-one association to Employee
	/*@ManyToOne
	@JoinColumn(name="employee_code")
	private Employee employee;*/
	private String empName;

	//bi-directional many-to-one association to Period
	/*@ManyToOne
	@JoinColumns({
		@JoinColumn(name="period_no", referencedColumnName="period_no"),
		@JoinColumn(name="year", referencedColumnName="year")
		})
	private Period period;	
*/  
	 private String periodDesc;
	public EmployeeResult() {
	}

	
	public BigDecimal getAdjustPercentage() {
		return this.adjustPercentage;
	}

	public void setAdjustPercentage(BigDecimal adjustPercentage) {
		this.adjustPercentage = adjustPercentage;
	}

	public String getAdjustmentReason() {
		return this.adjustmentReason;
	}

	public void setAdjustmentReason(String adjustmentReason) {
		this.adjustmentReason = adjustmentReason;
	}

	public BigDecimal getAverageWeightPercentage() {
		return this.averageWeightPercentage;
	}

	public void setAverageWeightPercentage(BigDecimal averageWeightPercentage) {
		this.averageWeightPercentage = averageWeightPercentage;
	}

	public Date getCreatedDt() {
		return this.createdDt;
	}

	public void setCreatedDt(Date createdDt) {
		this.createdDt = createdDt;
	}

	public BigDecimal getFinalPercentage() {
		return this.finalPercentage;
	}

	public void setFinalPercentage(BigDecimal finalPercentage) {
		this.finalPercentage = finalPercentage;
	}

	public Date getUpdatedDt() {
		return this.updatedDt;
	}

	public void setUpdatedDt(Date updatedDt) {
		this.updatedDt = updatedDt;
	}

	public BigDecimal getWeightPercentage() {
		return this.weightPercentage;
	}

	public void setWeightPercentage(BigDecimal weightPercentage) {
		this.weightPercentage = weightPercentage;
	}

	public BigDecimal getWorkingAge() {
		return this.workingAge;
	}

	public void setWorkingAge(BigDecimal workingAge) {
		this.workingAge = workingAge;
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


	public String getEmpName() {
		return empName;
	}


	public void setEmpName(String empName) {
		this.empName = empName;
	}


	public String getPeriodDesc() {
		return periodDesc;
	}


	public void setPeriodDesc(String periodDesc) {
		this.periodDesc = periodDesc;
	}

	

}