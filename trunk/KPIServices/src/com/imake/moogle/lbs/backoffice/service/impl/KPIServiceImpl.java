package com.imake.moogle.lbs.backoffice.service.impl;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.imake.moogle.lbs.backoffice.dto.KPIMaster;
import com.imake.moogle.lbs.backoffice.dto.KpiResult;
import com.imake.moogle.lbs.backoffice.dto.Threshold;
import com.imake.moogle.lbs.backoffice.service.KPIService;

/**
 * @author Chatchai Pimtun
 */
@Repository
@Transactional
public class KPIServiceImpl implements KPIService {

	private SessionFactory sessionAnnotationFactory;
	/*private static String SCHEMA="FSD";
	private static final  ResourceBundle myResources =
		      ResourceBundle.getBundle("jdbc"); 
	static{
		SCHEMA=myResources.getString("SCHEMA");
	}*/
	/*
	 * @Autowired public BalanceScorecardServiceImpl(SessionFactory
	 * sessionAnnotationFactory) { this.sessionAnnotationFactory =
	 * sessionAnnotationFactory; }
	 */
	public SessionFactory getSessionAnnotationFactory() {
		return sessionAnnotationFactory;
	}

	public void setSessionAnnotationFactory(
			SessionFactory sessionAnnotationFactory) {
		this.sessionAnnotationFactory = sessionAnnotationFactory;
	}

	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	@Override
	public List<Integer> listYear(String query) {
		// TODO Auto-generated method stub
		
		List<Integer> list =null;
		try{
		
		 list = this.sessionAnnotationFactory
				.getCurrentSession()
				.createSQLQuery(
						query
						//"SELECT distinct result.year FROM "+SCHEMA+".employee_result result order by result.year desc "
						)
						
				.list();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println("listYear ="+list);
		return list;
		
	}
	@Transactional(readOnly=true)
	@Override
	public List<KPIMaster> listMaster(String query) {
		// TODO Auto-generated method stub
		List<KPIMaster> master =null;
		/*List<KPIMaster>  xx=this.sessionAnnotationFactory
		.getCurrentSession().createQuery("select from KPIMaster").list();*/
		try{
		    List result= this.sessionAnnotationFactory
				.getCurrentSession()
				.createSQLQuery(query).list();
		    if(result!=null && result.size()>0){
		    	int size=result.size();
		    	master=new ArrayList<KPIMaster>(size);
		    	String id="";
		    	for (int i = 0; i < size; i++) {
		    		KPIMaster kpiMaster =new KPIMaster();
		    		Object obj[] =(Object[])result.get(i);
		    		
		    		 if (obj[0] instanceof Integer) {
		    			 Integer idObj = (Integer) obj[0];
						id=idObj.intValue()+"";
					 }else
						id=(String)obj[0]; 
		    		kpiMaster.setId(id);
		    		kpiMaster.setName((String)obj[1]);
		    		master.add(kpiMaster);
				}
		    	 
		    }
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	//	System.out.println("listYear ="+list);
		return master;
	}

	@Transactional(readOnly=true)
	@Override
	public List<com.imake.moogle.lbs.backoffice.dto.EmployeeResult> searchEmployeeResult(String SCHEMA,String year,String periodNo,
			String departmentCode,String positionCode,String employeeCode,String employeeName,String jobLevelG,String employee_codeG) {
	//public List<com.imake.moogle.lbs.backoffice.dto.EmployeeResult> searchEmployeeResult(Integer year,Integer periodNo,String employeeCode) {
		// TODO Auto-generated method stub
		List<com.imake.moogle.lbs.backoffice.dto.EmployeeResult> employeeResult =null;
		StringBuffer sb=new StringBuffer(" select em_result.period_no,p.period_desc,em_result.employee_code," +
				" concat(em.employee_name,' ',em.employee_surname) as emp_name ,em_result.weight_percentage," +
				" em_result.adjust_percentage,em_result.adjustment_reason" +
				" ,em_result.final_percentage ,em_result.year  from "+SCHEMA+".employee_result  em_result inner join " +
				" "+SCHEMA+".employee em on em_result.employee_code=em.employee_code inner join "+SCHEMA+".period p  on" +
				" (em_result.period_no=p.period_no and em_result.year =p.year) ");
		boolean haveWhere=false;
		if(!year.equalsIgnoreCase("all")){
			if(haveWhere)
				sb.append(" and em_result.year="+year.trim());
			else
				sb.append(" where em_result.year="+year.trim());
			haveWhere=true;
		}
		if(!periodNo.equalsIgnoreCase("all")){
			if(haveWhere)
				sb.append(" and em_result.period_no="+periodNo.trim());
			else
				sb.append(" where em_result.period_no="+periodNo.trim());
			haveWhere=true;
		}
		if(!employeeCode.equalsIgnoreCase("all")  &&  employeeCode.trim().length()>0){
			if(haveWhere)
				sb.append(" and em_result.employee_code='"+employeeCode+"' " );
			else
				sb.append(" where em_result.employee_code='"+employeeCode+"' ");
			haveWhere=true;
		}
		if(employeeName!=null &&  employeeName.trim().length()>0){ 
			if(haveWhere)
				sb.append(" and  concat(em.employee_name,' ',em.employee_surname)='"+employeeName+"' " );
			else
				sb.append(" where concat(em.employee_name,' ',em.employee_surname)='"+employeeName+"' ");
			haveWhere=true;
		}
		if(!departmentCode.equalsIgnoreCase("all") &&  departmentCode.trim().length()>0){
			if(haveWhere)
				sb.append(" and em.department_code='"+departmentCode+"' " );
			else
				sb.append(" where em.department_code='"+departmentCode+"' ");
			haveWhere=true;
		}
		/*if(!positionCode.equalsIgnoreCase("all")){
			if(haveWhere)
				sb.append(" and em.position_code='"+positionCode+"' " );
			else
				sb.append(" where em.position_code='"+positionCode+"' ");
			haveWhere=true;
		}*/
		if(!positionCode.equalsIgnoreCase("All")){
			if(haveWhere)
				sb.append(" and em.position_name='"+positionCode+"' " );
			else
				sb.append(" where em.position_name='"+positionCode+"' ");
			haveWhere=true;
		}
		if(jobLevelG.equalsIgnoreCase("Manager")){		
			if(haveWhere)
				sb.append("  and em_result.employee_code !='"+employee_codeG+"'");
			else
				sb.append("  where em_result.employee_code!= '"+employee_codeG+"'");
			haveWhere=true;
		}
		sb.append(" order by  em_result.period_no asc ");
		System.out.println("Query -->"+sb.toString());
		try{
			/*String query =" select em_result.period_no,p.period_desc,em_result.employee_code," +
					" concat(em.employee_name,' ',em.employee_surname) as emp_name ,em_result.weight_percentage," +
					" em_result.adjust_percentage,em_result.adjustment_reason" +
					" ,em_result.final_percentage ,em_result.year  from "+SCHEMA+".employee_result  em_result inner join " +
					" "+SCHEMA+".employee em on em_result.employee_code=em.employee_code inner join "+SCHEMA+".period p  on" +
					" (em_result.period_no=p.period_no and em_result.year =p.year) where" +
					" em_result.year="+year.intValue()+" and em_result.employee_code='"+employeeCode+"' order by  em_result.period_no asc ";*/
				 
		    List result= this.sessionAnnotationFactory
				.getCurrentSession()
				.createSQLQuery(sb.toString()).list();
		    //if(false)
		    if(result!=null && result.size()>0){
		    	int size=result.size();
		    	employeeResult=new ArrayList<com.imake.moogle.lbs.backoffice.dto.EmployeeResult>(size);
		    	for (int i = 0; i < size; i++) {
		    		com.imake.moogle.lbs.backoffice.dto.EmployeeResult emp =new com.imake.moogle.lbs.backoffice.dto.EmployeeResult();
		    		Object obj[] =(Object[])result.get(i);
		    		emp.setPeriodNo(obj[0]!=null?(Integer)obj[0]:null);
		    		emp.setPeriodDesc(obj[1]!=null?(String)obj[1]:null);
		    		emp.setEmployeeCode(obj[2]!=null?(String)obj[2]:null);
		    		emp.setEmpName(obj[3]!=null?(String)obj[3]:null);
		    		emp.setWeightPercentage(obj[4]!=null?(BigDecimal)obj[4]:null);
		    		emp.setAdjustPercentage(obj[5]!=null?(BigDecimal)obj[5]:null);
		    		emp.setAdjustmentReason(obj[6]!=null?(String)obj[6]:null);
		    		emp.setFinalPercentage(obj[7]!=null?(BigDecimal)obj[7]:null);
		    		emp.setYear(obj[8]!=null?(Integer)obj[8]:null);
		    		
		    		employeeResult.add(emp);
				}
		      } 

		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	//	System.out.println("listYear ="+list);
		return employeeResult;
	}
	@Transactional(propagation = Propagation.REQUIRES_NEW,rollbackFor={RuntimeException.class})
	@Override
	public int updateAdjustPercentage(String SCHEMA,BigDecimal[] adjustPercentage,BigDecimal[] finalPercentage,
			Integer[] year, Integer[] periodNo, String[] employeeCode,String[] reason) {
		// TODO Auto-generated method stub
		Session session=sessionAnnotationFactory.getCurrentSession();
		int returnId=0;
	try{
		StringBuffer sb =new StringBuffer();
		if(adjustPercentage!=null && adjustPercentage.length>0){
			int size= adjustPercentage.length; 
			for (int i = 0; i < size; i++) {
				sb.setLength(0); 
				sb.append("update "+SCHEMA+".employee_result set adjust_percentage=:adjust_percentage , final_percentage=:final_percentage " +
						"	,adjustment_reason=:reason" +
						",updated_dt=now()" +
						" where year="+year[i]+" and period_no="+periodNo[i] +
						"	and employee_code='"+employeeCode[i]+"'" );
			Query	query= session.createSQLQuery(sb.toString());
				 query.setParameter("reason", reason[i]);
			//query.setParameter("reason", "ทดสอบ");
				query.setParameter("adjust_percentage", adjustPercentage[i]);
				query.setParameter("final_percentage", finalPercentage[i]);
				//System.out.println("ทดสอบ ==>"+reason[i]); 
				returnId=query.executeUpdate();
			}
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if (session != null) {
			session = null;
		} 
	}
			return returnId;
			
   	 }

	@Transactional(readOnly=true)
	@Override
	public List<KpiResult> searchKPI(String SCHEMA,Integer year, Integer periodNo,
			String employeeCode, String etl_flag, String approved_flag) {

		// TODO Auto-generated method stub
		List<com.imake.moogle.lbs.backoffice.dto.KpiResult> kpiResult =null;
		try{
			String query ="select result.year,result.period_no,p.period_desc,result.employee_code" +
					"	,concat(em.employee_name,' ',em.employee_surname) as emp_name , result.kpi_code ,kpi.kpi_name " +
					"  ,result.target_score,result.actual_score from "+SCHEMA+".kpi_result result inner join "+SCHEMA+".kpi kpi " +
					" on result.kpi_code=kpi.kpi_code inner join	"+SCHEMA+".employee em on result.employee_code=em.employee_code  inner join "+SCHEMA+".period p  on" +
					" (result.period_no=p.period_no and result.year =p.year) where kpi.etl_flag='"+etl_flag.trim()+"'" +
					" and result.approved_flag = '"+approved_flag.trim()+"' and result.year="+year.intValue()+" and result.period_no="+periodNo.intValue()+" and em.employee_code='"+employeeCode+"' " +
					"";
			
		    List result= this.sessionAnnotationFactory
				.getCurrentSession()
				.createSQLQuery(query).list();
		    if(result!=null && result.size()>0){
		    	int size=result.size();
		    	kpiResult=new ArrayList<com.imake.moogle.lbs.backoffice.dto.KpiResult>(size);
		    	for (int i = 0; i < size; i++) {
		    		com.imake.moogle.lbs.backoffice.dto.KpiResult kpi =new com.imake.moogle.lbs.backoffice.dto.KpiResult();
		    		Object obj[] =(Object[])result.get(i);
		    		kpi.setYear(obj[0]!=null?(Integer)obj[0]:null);
		    		kpi.setPeriodNo(obj[1]!=null?(Integer)obj[1]:null);
		    		kpi.setPeriodDesc(obj[2]!=null?(String)obj[2]:null);
		    		kpi.setEmployeeCode(obj[3]!=null?(String)obj[3]:null);
		    		kpi.setEmpName(obj[4]!=null?(String)obj[4]:null);
		    		kpi.setKpiCode(obj[5]!=null?(String)obj[5]:null);
		    		kpi.setKpiName(obj[6]!=null?(String)obj[6]:null);
		    		kpi.setTargetScore(obj[7]!=null?(BigDecimal)obj[7]:null);
		    		kpi.setActualScore(obj[8]!=null?(BigDecimal)obj[8]:null);
		    		
		    		kpiResult.add(kpi);
				}
		    	 
		    }
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	//	System.out.println("listYear ="+list);
		return kpiResult;
	
	}
	@Transactional(propagation = Propagation.REQUIRES_NEW,rollbackFor={RuntimeException.class})
	@Override
	public int approveKPIResult(String SCHEMA,Integer[] year, Integer[] periodNo,
			String[] employeeCode, String[] kpiCode, String approved_flag) {
		// TODO Auto-generated method stub
		Session session=sessionAnnotationFactory.getCurrentSession();
		int returnId=0;
	try{
		StringBuffer sb =new StringBuffer();
		if(employeeCode!=null && employeeCode.length>0){
			int size= employeeCode.length; 
			for (int i = 0; i < size; i++) {
				sb.setLength(0); 
				sb.append("update "+SCHEMA+".kpi_result set approved_flag=:approved_flag  " + 
						",updated_dt=now()" +
						" where year="+year[i]+" and period_no="+periodNo[i] +
						"	and employee_code='"+employeeCode[i]+"'" +
						"	and kpi_code='"+kpiCode[i]+"'");
			Query	query= session.createSQLQuery(sb.toString());
				query.setParameter("approved_flag", approved_flag); 
				returnId=query.executeUpdate();
			}
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if (session != null) {
			session = null;
		} 
	}
			return returnId;
	}

	@Override
	public List<Threshold> searchThreshold(String thresholdName) {
		// TODO Auto-generated method stub
		return null;
	}
	@Transactional(propagation = Propagation.REQUIRES_NEW,rollbackFor={RuntimeException.class})
	@Override
	public int updateThreshold(Threshold threshold) {
		// TODO Auto-generated method stub
		Session session=sessionAnnotationFactory.getCurrentSession();
		int returnId=0;
		try{
			session.update(threshold);
			returnId=1;
		}catch (Exception e) {
			// TODO: handle exception 
			e.printStackTrace();
		}finally{
			if (session != null) {
				session = null;
			} 
		}
		return returnId;
	}
		@Transactional(propagation = Propagation.REQUIRES_NEW,rollbackFor={RuntimeException.class})
	@Override
	public int deleteThreshold(Threshold threshold) {
		// TODO Auto-generated method stub
			Session session=sessionAnnotationFactory.getCurrentSession();
			int returnId=0;
			try{
				session.delete(threshold);
				returnId=1;
			}catch (Exception e) {
				// TODO: handle exception 
				e.printStackTrace();
			}finally{
				if (session != null) {
					session = null;
				} 
			}
			return returnId;
	}
		@Transactional(propagation = Propagation.REQUIRES_NEW,rollbackFor={RuntimeException.class})
	@Override
	public int updateObject(Object threshold) {
		// TODO Auto-generated method stub
			Session session=sessionAnnotationFactory.getCurrentSession();
			int returnId=0;
			try{
				session.update(threshold);
				returnId=1;
			}catch (Exception e) {
				// TODO: handle exception 
				e.printStackTrace();
			}finally{
				if (session != null) {
					session = null;
				} 
			}
			return returnId;
	}
		@Transactional(propagation = Propagation.REQUIRES_NEW,rollbackFor={RuntimeException.class})
	@Override
	public int deleteObject(Object threshold) {
		// TODO Auto-generated method stub
			Session session=sessionAnnotationFactory.getCurrentSession();
			int returnId=0;
			try{
				session.delete(threshold);
				returnId=1;
			}catch (Exception e) {
				// TODO: handle exception 
				e.printStackTrace();
			}finally{
				if (session != null) {
					session = null;
				} 
			}
			return returnId;
	}

		@Override
		public com.imake.moogle.lbs.backoffice.dto.Threshold findThresholdById(Threshold threshold,Serializable id) {
			// TODO Auto-generated method stub
			Session session=sessionAnnotationFactory.getCurrentSession();
			com.imake.moogle.lbs.backoffice.dto.Threshold threshold_return=null;
			try{
				threshold_return=(com.imake.moogle.lbs.backoffice.dto.Threshold)session.get(threshold.getClass(),id); 
			}catch (Exception e) {
				// TODO: handle exception 
				e.printStackTrace();
			}finally{
				if (session != null) {
					session = null;
				} 
			}
			//System.out.println(threshold_return+"xxxxxxxxxxxxxxxxx");
			return threshold_return;
		}

		@Override
		public Object findById(Object obj,Serializable id) {
			// TODO Auto-generated method stub
			Session session=sessionAnnotationFactory.getCurrentSession();
			Object obj_return=null;
			try{
				obj_return=session.get(obj.getClass(), id); 
			}catch (Exception e) {
				// TODO: handle exception 
				e.printStackTrace();
			}finally{
				if (session != null) {
					session = null;
				} 
			}
			return obj_return;
		}
		@Transactional(propagation = Propagation.REQUIRES_NEW,rollbackFor={RuntimeException.class})
		@Override
		public int saveThreshold(Threshold threshold) {
			// TODO Auto-generated method stub
			Session session=sessionAnnotationFactory.getCurrentSession();
			int returnId=0;
			try{
				Serializable id =session.save(threshold);
				System.err.println(id+"xxxxxxxxxxxxxxxxxxx");
				returnId=1;
			}catch (Exception e) {
				// TODO: handle exception 
				e.printStackTrace();
			}finally{
				if (session != null) {
					session = null;
				} 
			}
			return returnId;
		}
		@Transactional(propagation = Propagation.REQUIRES_NEW,rollbackFor={RuntimeException.class})
		@Override
		public int saveObject(Object threshold) {
			// TODO Auto-generated method stub
			Session session=sessionAnnotationFactory.getCurrentSession();
			int returnId=0;
			try{
				session.save(threshold);
				returnId=1;
			}catch (Exception e) {
				// TODO: handle exception 
				e.printStackTrace();
			}finally{
				if (session != null) {
					session = null;
				} 
			}
			return returnId;
		}
		
		@Transactional(readOnly=true)
		@Override
		public List  searchObject(String query) {
			// TODO Auto-generated method stub
		//	List resultObject =null;
			try{ 
			    List result= this.sessionAnnotationFactory
					.getCurrentSession()
					.createSQLQuery(query).list();
			    if(result!=null && result.size()>0){ 
			    	return result;
			    	//	Object obj[] =(Object[])result.get(i); 
			    }
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} 
			return null;
		}
		@Transactional(propagation = Propagation.REQUIRES_NEW,rollbackFor={RuntimeException.class})
		@Override
		public int executeQuery(String str) {
			// TODO Auto-generated method stub
			Session session=sessionAnnotationFactory.getCurrentSession();
			int returnId=0;
		try{ 
				Query	query= session.createSQLQuery(str.toString()); 
				 returnId=query.executeUpdate(); 
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if (session != null) {
				session = null;
			} 
		}
				return returnId;
		}

		@Override
		public List<String[]> assignKPI(String SCHEMA, String query, Integer year,
				Integer periodNo, String[] kpiCodes,String[] kpiOrders,String[] kpiWeight,String[] targetData,String[] targetScore, String[] approved_flag) {
			// TODO Auto-generated method stub
			System.out.println(" into assignKPI");
			Session session=sessionAnnotationFactory.getCurrentSession();
		int returnId=0;
		int returnIdAll=0;
		List<String[]> results=new ArrayList<String[]>();
		//Map results=new HashMap();
		Map employee_codes=new HashMap();
		Map kpi_codes=new HashMap();
		try{
			StringBuffer sb =new StringBuffer();
			Query sqlQuery= session.createSQLQuery(query);
			List result=sqlQuery.list();
			int size=result.size();
	    	// master=new ArrayList<KPIMaster>(size);
	    	String[] ids=new String[size];
	    	for (int i = 0; i < size; i++) {
	    		Object obj[] =(Object[])result.get(i);
	    		ids[i]=(String)obj[0]; 
			} 
	    	for (int i = 0; i < ids.length; i++) {
	    		for (int j = 0; j < kpiCodes.length; j++) {
	    			sb.setLength(0); 
	    			sb.append(" select count(*) from "+SCHEMA+".kpi_result  where year= "+year+" and period_no="+periodNo+" and employee_code='"+ids[i]+"' and " +
		    				" kpi_code='"+kpiCodes[j]+"'");
	    			sqlQuery=session.createSQLQuery(sb.toString());
	    			java.math.BigInteger count=(java.math.BigInteger)sqlQuery.uniqueResult(); 
    				sb.setLength(0); 
    				String approved_flag_update="0";
    				if(approved_flag[j]!=null && approved_flag[j].length()>0){
    					if(approved_flag[j].equals("Y"))
    						approved_flag_update="Y";
    				}
	    			if(count.intValue()>0){ //update 
						sb.append("update "+SCHEMA+".kpi_result set approved_flag=:approved_flag  " + 
								",updated_dt=now()" +
								" where year="+year+" and period_no="+periodNo +
								"	and employee_code='"+ids[i]+"'" +
								"	and kpi_code='"+kpiCodes[j]+"'");
						sqlQuery= session.createSQLQuery(sb.toString());
						sqlQuery.setParameter("approved_flag", approved_flag_update); 
						returnId=sqlQuery.executeUpdate();
						returnIdAll=returnIdAll+returnId;
	    			}else{//save
	    				 //String[] kpiCodes,String[] kpiOrders,String[] kpiWeight,String[] targetData,String[] targetScore, String approved_flag) {
	    						
	    				sb.append("insert into "+SCHEMA+".kpi_result set approved_flag=:approved_flag ,kpi_order="+kpiOrders[j]+",kpi_weight="+kpiWeight[j]+",target_data='"+targetData[j]+"',target_score="+targetScore[j]+", created_dt=now(),updated_dt=now()"+
	    						",year="+year+",period_no="+periodNo+",employee_code='"+ids[i]+"',kpi_code='"+kpiCodes[j]+"'");
	    				 
						sqlQuery= session.createSQLQuery(sb.toString());
						sqlQuery.setParameter("approved_flag", approved_flag_update); 
						returnId=sqlQuery.executeUpdate();
						returnIdAll=returnIdAll+returnId;
						//employee_code ids[i]+"' and result.kpi_code='"+kpiCodes[j]+
						
						employee_codes.put(ids[i], ids[i]);
						kpi_codes.put(kpiCodes[j], kpiCodes[j]);
						/*sb.setLength(0);
					
						sb.append("select result.year,result.period_no,p.period_desc,result.employee_code" +
								"	,concat(em.employee_name,' ',em.employee_surname) as emp_name , result.kpi_code ,kpi.kpi_name " +
								"  ,result.target_score,result.actual_score,cast(result.kpi_order as char),cast(result.kpi_weight as char),cast(result.target_data as char),cast(result.target_score as char) from "+SCHEMA+".kpi_result result inner join "+SCHEMA+".kpi kpi " +
								" on result.kpi_code=kpi.kpi_code inner join	"+SCHEMA+".employee em on result.employee_code=em.employee_code  inner join "+SCHEMA+".period p  on" +
								" (result.period_no=p.period_no and result.year =p.year)  where result.year="+year+" and result.period_no="+periodNo +" and result.employee_code='"+ids[i]+"' and result.kpi_code='"+kpiCodes[j]+"' order by em.employee_code, kpi.kpi_code");
						
						sqlQuery= session.createSQLQuery(sb.toString());
						List result_kpi=sqlQuery.list();
						int size_kpi=result_kpi.size();
				    	// master=new ArrayList<KPIMaster>(size);
				    
				    	for (int k = 0; k < size_kpi; k++) {
				    		Object obj[] =(Object[])result_kpi.get(k);
				    		String[] kpi_result=new String[8];
				    		kpi_result[0]=obj[3]!=null?((String)obj[3]):"";
				    		kpi_result[1]=obj[4]!=null?((String)obj[4]):"";
				    		kpi_result[2]=obj[9]!=null?((String)obj[9]):"";
				    		kpi_result[3]=obj[5]!=null?((String)obj[5]):"";
				    		kpi_result[4]=obj[6]!=null?((String)obj[6]):"";
				    		kpi_result[5]=obj[10]!=null?((String)obj[10]):"";
				    		kpi_result[6]=obj[11]!=null?((String)obj[11]):"";
				    		kpi_result[7]=obj[12]!=null?((String)obj[12]):"";
				    		results.add(kpi_result);
						} */
	    			}
				} 
			}
	    	//Map employee_codes=new HashMap();
	    	String employee_code_str="";
	    	int employee_codes_size=employee_codes.size();
	    	int index=0;
	    	for (Iterator iterator = employee_codes.keySet().iterator(); iterator.hasNext();) {
				String emplyee_code = (String) iterator.next();
				if(index==(employee_codes_size-1))
					employee_code_str=employee_code_str+"'"+emplyee_code+"'";
				else
					employee_code_str=employee_code_str+"'"+emplyee_code+"',";
				index++;
			}
	    	if(employee_codes_size>0)
	    		employee_code_str="("+employee_code_str+")";
	    	
	    	String kpi_code_str="";
	    	int kpi_codes_size=kpi_codes.size();
	    	index=0;
	    	for (Iterator iterator = kpi_codes.keySet().iterator(); iterator.hasNext();) {
				String kpi_code = (String) iterator.next();
				if(index==(kpi_codes_size-1))
					kpi_code_str=kpi_code_str+"'"+kpi_code+"'";
				else
					kpi_code_str=kpi_code_str+"'"+kpi_code+"',";
				index++;
			}
	    	if(kpi_codes_size>0)
	    		kpi_code_str="("+kpi_code_str+")";
	    
	    	
	    	if(employee_codes_size>0){
	    	sb.setLength(0);
			
			sb.append("select result.year,result.period_no,p.period_desc,result.employee_code" +
					"	,concat(em.employee_name,' ',em.employee_surname) as emp_name , result.kpi_code ,kpi.kpi_name " +
					"  ,result.target_score,result.actual_score,cast(result.kpi_order as char),cast(result.kpi_weight as char),cast(result.target_data as char),cast(result.target_score as char) from "+SCHEMA+".kpi_result result inner join "+SCHEMA+".kpi kpi " +
					" on result.kpi_code=kpi.kpi_code inner join	"+SCHEMA+".employee em on result.employee_code=em.employee_code  inner join "+SCHEMA+".period p  on" +
					" (result.period_no=p.period_no and result.year =p.year)  where result.year="+year+" and result.period_no="+periodNo +" and result.employee_code in "+employee_code_str+" and result.kpi_code in "+kpi_code_str+" order by em.employee_code, result.kpi_order");
			
			sqlQuery= session.createSQLQuery(sb.toString());
			List result_kpi=sqlQuery.list();
			int size_kpi=result_kpi.size();
	    	// master=new ArrayList<KPIMaster>(size);
	    
	    	for (int k = 0; k < size_kpi; k++) {
	    		Object obj[] =(Object[])result_kpi.get(k);
	    		String[] kpi_result=new String[8];
	    		kpi_result[0]=obj[3]!=null?((String)obj[3]):"";
	    		kpi_result[1]=obj[4]!=null?((String)obj[4]):"";
	    		kpi_result[2]=obj[9]!=null?((String)obj[9]):"";
	    		kpi_result[3]=obj[5]!=null?((String)obj[5]):"";
	    		kpi_result[4]=obj[6]!=null?((String)obj[6]):"";
	    		kpi_result[5]=obj[10]!=null?((String)obj[10]):"";
	    		kpi_result[6]=obj[11]!=null?((String)obj[11]):"";
	    		kpi_result[7]=obj[12]!=null?((String)obj[12]):"";
	    		results.add(kpi_result);
			} 
	    	}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if (session != null) {
				session = null;
			} 
		}
				return results;
		}
		 
		@Override
		public int assignKPIUpdate(String SCHEMA, String query, Integer year,
				Integer periodNo, String[] kpiCodes,String[] kpiOrders,String[] kpiWeight,String[] targetData,String[] targetScore, String[] approved_flag) {
			// TODO Auto-generated method stub
			
			Session session=sessionAnnotationFactory.getCurrentSession();
		int returnId=0;
		int returnIdAll=0;
		List<String[]> results=new ArrayList<String[]>();
		try{
			StringBuffer sb =new StringBuffer();
			Query sqlQuery= session.createSQLQuery(query);
			List result=sqlQuery.list();
			int size=result.size();
	    	// master=new ArrayList<KPIMaster>(size);
	    	String[] ids=new String[size];
	    	for (int i = 0; i < size; i++) {
	    		Object obj[] =(Object[])result.get(i);
	    		ids[i]=(String)obj[0]; 
			} 
	    	for (int i = 0; i < ids.length; i++) {
	    		for (int j = 0; j < kpiCodes.length; j++) {
	    			sb.setLength(0); 
	    			sb.append(" select count(*) from "+SCHEMA+".kpi_result  where year= "+year+" and period_no="+periodNo+" and employee_code='"+ids[i]+"' and " +
		    				" kpi_code='"+kpiCodes[j]+"'");
	    			sqlQuery=session.createSQLQuery(sb.toString());
	    			java.math.BigInteger count=(java.math.BigInteger)sqlQuery.uniqueResult(); 
    				sb.setLength(0); 
    				/*- ถ้า etl_flag = 'Y' ให้ approve_flag = 'Y'
    				 - ถ้า etl_flag = 'N' ให้ approve_flag = '0'*/
    				String approved_flag_update="0";
    				if(approved_flag[j]!=null && approved_flag[j].length()>0){
    					if(approved_flag[j].equals("Y"))
    						approved_flag_update="Y";
    				}
	    			if(count.intValue()>0){ //update 
						sb.append("update "+SCHEMA+".kpi_result set approved_flag=:approved_flag  ,kpi_order="+kpiOrders[j]+",kpi_weight="+kpiWeight[j]+",target_data='"+targetData[j]+"',target_score="+targetScore[j]+", updated_dt=now()"+
	    						//",year="+year+",period_no="+periodNo+",employee_code='"+ids[i]+"',kpi_code='"+kpiCodes[j]+"'"+
								//",updated_dt=now()" +
								" where year="+year+" and period_no="+periodNo +
								"	and employee_code='"+ids[i]+"'" +
								"	and kpi_code='"+kpiCodes[j]+"'");
						sqlQuery= session.createSQLQuery(sb.toString());
						sqlQuery.setParameter("approved_flag", approved_flag_update); 
						returnId=sqlQuery.executeUpdate();
						returnIdAll=returnIdAll+returnId;
	    			}else{//save
	    				 //String[] kpiCodes,String[] kpiOrders,String[] kpiWeight,String[] targetData,String[] targetScore, String approved_flag) {
	    						
	    				sb.append("insert into "+SCHEMA+".kpi_result set approved_flag=:approved_flag ,kpi_order="+kpiOrders[j]+",kpi_weight="+kpiWeight[j]+",target_data='"+targetData[j]+"',target_score="+targetScore[j]+", created_dt=now(),updated_dt=now()"+
	    						",year="+year+",period_no="+periodNo+",employee_code='"+ids[i]+"',kpi_code='"+kpiCodes[j]+"'");
	    				 
						sqlQuery= session.createSQLQuery(sb.toString());
						sqlQuery.setParameter("approved_flag", approved_flag_update); 
						returnId=sqlQuery.executeUpdate();
						returnIdAll=returnIdAll+returnId; 
						
	    			}
				} 
			}
	    	 
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if (session != null) {
				session = null;
			} 
		}
				return returnIdAll;
		}
	 
}
