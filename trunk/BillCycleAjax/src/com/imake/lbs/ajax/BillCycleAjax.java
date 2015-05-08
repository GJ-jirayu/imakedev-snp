package com.imake.lbs.ajax;

import java.util.List;

import javax.servlet.ServletContext;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.imake.lbs.dto.ArBillingSchedule;
import com.imake.lbs.dto.ArCustomer;
import com.imake.lbs.dto.ArPaymentSchedule;
import com.imake.lbs.service.BillCycleService;


public class BillCycleAjax {
	private final BillCycleService billCycleService;
	public BillCycleAjax(){
		WebContext ctx = WebContextFactory.get(); 
		ServletContext servletContext = ctx.getServletContext();
    	WebApplicationContext wac = WebApplicationContextUtils.
    	getRequiredWebApplicationContext(servletContext);
    	billCycleService = (BillCycleService)wac.getBean("billCycleService");
	}     
		public List searchObject(String query){
			return billCycleService.searchObject(query);
		}
		public int executeQuery(String query){
			return billCycleService.executeQuery(query);
		}
		public int executeBillCycleQuery(String schema,ArCustomer arCustomer,List<ArBillingSchedule> arBillingSchedules,
				List<ArBillingSchedule> arPaymentSchedules){
			return billCycleService.executeBillCycleQuery(schema,arCustomer,arBillingSchedules,arPaymentSchedules);
		}
	
		
}
