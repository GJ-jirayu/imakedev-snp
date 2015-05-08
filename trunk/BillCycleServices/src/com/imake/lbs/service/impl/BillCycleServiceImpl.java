package com.imake.lbs.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.imake.lbs.dto.ArBillingSchedule;
import com.imake.lbs.dto.ArCustomer;
import com.imake.lbs.service.BillCycleService;

/**
 * @author Chatchai Pimtun
 */
@Repository
@Transactional
public class BillCycleServiceImpl implements BillCycleService {
	//private static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private SessionFactory sessionAnnotationFactory;
	
	public SessionFactory getSessionAnnotationFactory() {
		return sessionAnnotationFactory;
	}

	public void setSessionAnnotationFactory(
			SessionFactory sessionAnnotationFactory) {
		this.sessionAnnotationFactory = sessionAnnotationFactory;
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
		
		@Transactional(propagation = Propagation.REQUIRES_NEW,rollbackFor={RuntimeException.class})
		@Override
		public int executeBillCycleQuery(String schema,ArCustomer arCustomer,
				List<ArBillingSchedule> arBillingSchedules,
				List<ArBillingSchedule> arPaymentSchedules) {
			// TODO Auto-generated method stub
	//		System.out.println("executeBillCycleQuery->"+schema);
		    int recordReturn =0;
		    try{
			Session session=sessionAnnotationFactory.getCurrentSession();
			/*String str="SELECT	customer_code, customer_name, province_name,district_code,district_name,phone_no,include_receipt_flag,"+
						" shift_bill_date_flag,created_dttm,updated_dttm	FROM "+schema+".ar_customer ";*/
			java.sql.Timestamp timeStampStartDate = new java.sql.Timestamp(new Date().getTime());
			//update ar_customer 
			StringBuffer querySb=new StringBuffer("UPDATE "+schema+".ar_customer SET ");
		//	boolean haveComma=false;
			List<String> setStr=new ArrayList<String>();
			if(arCustomer.getCustomerName()!=null && arCustomer.getCustomerName().length()>0){ 
				setStr.add("customer_name='"+ arCustomer.getCustomerName()+"'"); 
			}
			if(arCustomer.getProvinceName()!=null && arCustomer.getProvinceName().length()>0){ 
				setStr.add("province_name='"+ arCustomer.getProvinceName()+"'"); 
			} 
			 if(arCustomer.getDistrictName()!=null && arCustomer.getDistrictName().length()>0){ 
				setStr.add("district_name='"+ arCustomer.getDistrictName()+"'"); 
			 }
			 if(arCustomer.getPhoneNo()!=null && arCustomer.getPhoneNo().length()>0){ 
					setStr.add("phone_no='"+ arCustomer.getPhoneNo()+"'"); 
			  }
			 if(arCustomer.getIncludeReceiptFlag()!=null && arCustomer.getIncludeReceiptFlag().length()>0){ 
					setStr.add("include_receipt_flag='"+ arCustomer.getIncludeReceiptFlag()+"'"); 
			  }
			 if(arCustomer.getShiftBillDateFlag()!=null && arCustomer.getShiftBillDateFlag().length()>0){ 
					setStr.add("shift_bill_date_flag='"+ arCustomer.getShiftBillDateFlag()+"'"); 
			  } 
			 setStr.add("district_code="+ arCustomer.getDistrictCode()+"");  
			// setStr.add("updated_dttm='"+format.format(timeStampStartDate)+"'"); 
			 setStr.add("updated_dttm=now() ");
			 int size=setStr.size();
			 for (int i=0;i<size;i++) {
				 querySb.append(setStr.get(i));
				 if(i!=(size-1))
					 querySb.append(",");
			}
			 querySb.append(" where customer_code='"+arCustomer.getCustomerCode()+"'");  
			 //System.out.println("querySb1 -->"+querySb.toString());
			Query query=session.createSQLQuery(querySb.toString());
			recordReturn=recordReturn+query.executeUpdate();
			//end update customer
			
			querySb.setLength(0);
			querySb.append("DELETE FROM "+schema+".ar_billing_schedule WHERE customer_code='"+arCustomer.getCustomerCode()+"' ");
			 query=session.createSQLQuery(querySb.toString());
			 query.executeUpdate();
			 
			 querySb.setLength(0);
			querySb.append("DELETE FROM "+schema+".ar_payment_schedule WHERE customer_code='"+arCustomer.getCustomerCode()+"' ");
			 query=session.createSQLQuery(querySb.toString());
			 query.executeUpdate();
			//save update ar_billing_schedule 
			if(arBillingSchedules!=null){
				int arBillingScheduleSize=arBillingSchedules.size();
				for (int i = 0; i < arBillingScheduleSize; i++) {
					querySb.setLength(0);
					/*querySb.append("select count(*) FROM "+schema+".ar_billing_schedule ar " +
							" where ar.customer_code='"+arBillingSchedules.get(i).getCustomerCode()+"' " +
							 "and ar.schedule='"+arBillingSchedules.get(i).getSchedule()+"' and ar.type='"+arBillingSchedules.get(i).getType()+"'"); 
					System.out.println("querySb2 -->"+querySb.toString());
					query=session.createSQLQuery(querySb.toString());
					java.math.BigInteger count =(java.math.BigInteger)query.uniqueResult();
					
					querySb.setLength(0);
					if(count.intValue()>0){ //update
						querySb.append("UPDATE "+schema+".ar_billing_schedule ar SET " +
								"  ar.time_from='"+arBillingSchedules.get(i).getTimeFromStr()+"' ,"+
								"  ar.time_to='"+arBillingSchedules.get(i).getTimeToStr()+"',"+
								//"  ar.time _to='"+arBillingSchedules.get(i).getTimeToStr()+"',"+
								"  ar.updated_dttm='"+format.format(timeStampStartDate)+"'"+
								" where ar.customer_code='"+arBillingSchedules.get(i).getCustomerCode()+"' " +
								" and ar.schedule='"+arBillingSchedules.get(i).getSchedule()+"' and ar.type='"+arBillingSchedules.get(i).getType()+"'");
						System.out.println("querySb3 -->"+querySb.toString());
						query=session.createSQLQuery(querySb.toString());
						recordReturn=recordReturn+query.executeUpdate();
					}else{//save  
*/						querySb.append("INSERT INTO "+schema+".ar_billing_schedule  ( customer_code,  schedule,  type, "+
						       " time_from,  time_to,  created_dttm,  updated_dttm) " +
								" VALUES ('"+arBillingSchedules.get(i).getCustomerCode()+"', '"+arBillingSchedules.get(i).getSchedule()+"'," +
								" '"+arBillingSchedules.get(i).getType()+"', '"+arBillingSchedules.get(i).getTimeFromStr()+"', '"+arBillingSchedules.get(i).getTimeToStr()+"', now(), now() ) "
								);
						//System.out.println("querySb4 -->"+querySb.toString());
						query=session.createSQLQuery(querySb.toString());
						recordReturn=recordReturn+query.executeUpdate();
					//}
				}
			}
			
			//save update ar_payment_schedule 
			if(arPaymentSchedules!=null){
				int arPaymentScheduleSize=arPaymentSchedules.size();
				for (int i = 0; i < arPaymentScheduleSize; i++) {
					querySb.setLength(0);
					/*
					querySb.append("select count(*) FROM "+schema+".ar_payment_schedule ar " +
							" where ar.customer_code='"+arPaymentSchedules.get(i).getCustomerCode()+"' " +
							 "and ar.schedule='"+arPaymentSchedules.get(i).getSchedule()+"' and ar.type='"+arPaymentSchedules.get(i).getType()+"'"); 
					System.out.println("querySb5 -->"+querySb.toString());
					query=session.createSQLQuery(querySb.toString());
					java.math.BigInteger count =(java.math.BigInteger)query.uniqueResult();
					
					querySb.setLength(0);
					if(count.intValue()>0){ //update
						querySb.append("UPDATE "+schema+".ar_payment_schedule ar SET " +
								"  ar.time_from='"+arPaymentSchedules.get(i).getTimeFromStr()+"' ,"+
								"  ar.time_to='"+arPaymentSchedules.get(i).getTimeToStr()+"',"+
								//"  ar.time _to='"+arPaymentSchedules.get(i).getTimeToStr()+"',"+
								"  ar.updated_dttm='"+format.format(timeStampStartDate)+"'"+
								" where ar.customer_code='"+arPaymentSchedules.get(i).getCustomerCode()+"' " +
								" and ar.schedule='"+arPaymentSchedules.get(i).getSchedule()+"' and ar.type='"+arPaymentSchedules.get(i).getType()+"'");
						System.out.println("querySb6 -->"+querySb.toString());
						query=session.createSQLQuery(querySb.toString());
						recordReturn=recordReturn+query.executeUpdate();
					}else{//save  
*/						querySb.append("INSERT INTO "+schema+".ar_payment_schedule  ( customer_code,  schedule,  type, "+
						       " time_from,  time_to,  created_dttm,  updated_dttm) " +
								" VALUES ('"+arPaymentSchedules.get(i).getCustomerCode()+"', '"+arPaymentSchedules.get(i).getSchedule()+"'," +
								" '"+arPaymentSchedules.get(i).getType()+"', '"+arPaymentSchedules.get(i).getTimeFromStr()+"', '"+arPaymentSchedules.get(i).getTimeToStr()+"', now(), now() ) "
								);
						//System.out.println("querySb7 -->"+querySb.toString());
						query=session.createSQLQuery(querySb.toString());
						recordReturn=recordReturn+query.executeUpdate();
					}
				//}
			}
		   }catch(Exception ex){
			   ex.printStackTrace();
		   }
			return recordReturn;
		}

		
}
