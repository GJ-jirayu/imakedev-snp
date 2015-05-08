package com.imake.moogle.lbs.backoffice.service;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import com.imake.moogle.lbs.backoffice.dto.KPIMaster;

public interface KPIService {
	public List<Integer> listYear(String query);
	public List<KPIMaster> listMaster(String query); 
	//public List<com.imake.moogle.lbs.backoffice.dto.EmployeeResult> searchEmployeeResult(Integer year,Integer periodNo,String employeeCode);
	public List<com.imake.moogle.lbs.backoffice.dto.EmployeeResult> searchEmployeeResult(String SCHEMA,String year,String periodNo,
			String departmentCode,String positionCode,String employeeCode,String employeeName,String jobLevelG,String employee_codeG);
	
	public int updateAdjustPercentage(String SCHEMA,BigDecimal[] adjustPercentage,BigDecimal[] finalPercentage,
			Integer[] year, Integer[] periodNo, String[] employeeCode,String[] reason);
	
	
	public List<com.imake.moogle.lbs.backoffice.dto.KpiResult> searchKPI(
			String SCHEMA,Integer year,Integer periodNo,String employeeCode,String etl_flag,String approved_flag);
	public int approveKPIResult(String SCHEMA,Integer[] year, Integer[] periodNo, String[] employeeCode,String[] kpiCode,String approved_flag);
	
	//Threshold
	public List<com.imake.moogle.lbs.backoffice.dto.Threshold> searchThreshold(
			String thresholdName);
	public int saveThreshold(com.imake.moogle.lbs.backoffice.dto.Threshold threshold);
	public int updateThreshold(com.imake.moogle.lbs.backoffice.dto.Threshold threshold);
	public int deleteThreshold(com.imake.moogle.lbs.backoffice.dto.Threshold threshold);
	public com.imake.moogle.lbs.backoffice.dto.Threshold findThresholdById(com.imake.moogle.lbs.backoffice.dto.Threshold threshold,Serializable id);
	
	public int updateObject(Object threshold);
	public int deleteObject(Object threshold);
	public Object findById(Object threshold,Serializable id);
	public int saveObject(Object threshold);
	
	//search
	public List searchObject(String query);
	public int executeQuery(String query);
	public List<String[]> assignKPI(String SCHEMA, String query, Integer year,
			Integer periodNo, String[] kpiCodes,String[] kpiOrders,String[] kpiWeight,String[] targetData,String[] targetScore, String[] approved_flag) ;
 
	public int assignKPIUpdate(String SCHEMA, String query, Integer year,
			Integer periodNo, String[] kpiCodes,String[] kpiOrders,String[] kpiWeight,String[] targetData,String[] targetScore, String[] approved_flag);
		// TODO Auto-generated method stub
	
	
	//public List<com.imake.moogle.lbs.backoffice.dto.KpiResult> searchApproveKPI(Integer year,Integer periodNo,String employeeCode);
}
/*7. etl_flag
select * from kpi_result result left join kpi kpi 
on result.kpi_code=kpi.kpi_code where kpi.etl_flag='N' 
and result.approved_flag = 'N' and year=2012 and period_no=1 
and employee_code='0211146004'*/ 