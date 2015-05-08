package com.imake.moogle.lbs.backoffice.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the threshold database table.
 * 
 */
@Entity
@Table(name="threshold")
public class Threshold implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="threshold_id")
	private Integer thresholdId;

	@Column(name="begin_threshold")
	private BigDecimal beginThreshold;

	@Column(name="color_code")
	private String colorCode;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_dt")
	private Date createdDt;

	@Column(name="end_threshold")
	private BigDecimal endThreshold;

	@Column(name="threshold_name")
	private String thresholdName;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="updated_dt")
	private Date updatedDt;

	public Threshold() {
	}

	public Threshold(Integer thresholdId, BigDecimal beginThreshold,
			String colorCode, Date createdDt, BigDecimal endThreshold,
			String thresholdName, Date updatedDt) {
		super();
		this.thresholdId = thresholdId;
		this.beginThreshold = beginThreshold;
		this.colorCode = colorCode;
		this.createdDt = createdDt;
		this.endThreshold = endThreshold;
		this.thresholdName = thresholdName;
		this.updatedDt = updatedDt;
	}

	public Integer getThresholdId() {
		return this.thresholdId;
	}

	public void setThresholdId(Integer thresholdId) {
		this.thresholdId = thresholdId;
	}

	public BigDecimal getBeginThreshold() {
		return this.beginThreshold;
	}

	public void setBeginThreshold(BigDecimal beginThreshold) {
		this.beginThreshold = beginThreshold;
	}

	public String getColorCode() {
		return this.colorCode;
	}

	public void setColorCode(String colorCode) {
		this.colorCode = colorCode;
	}

	public Date getCreatedDt() {
		return this.createdDt;
	}

	public void setCreatedDt(Date createdDt) {
		this.createdDt = createdDt;
	}

	public BigDecimal getEndThreshold() {
		return this.endThreshold;
	}

	public void setEndThreshold(BigDecimal endThreshold) {
		this.endThreshold = endThreshold;
	}

	public String getThresholdName() {
		return this.thresholdName;
	}

	public void setThresholdName(String thresholdName) {
		this.thresholdName = thresholdName;
	}

	public Date getUpdatedDt() {
		return this.updatedDt;
	}

	public void setUpdatedDt(Date updatedDt) {
		this.updatedDt = updatedDt;
	}

}