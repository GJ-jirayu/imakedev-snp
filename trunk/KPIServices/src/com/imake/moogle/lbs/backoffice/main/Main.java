/**
 * Copyright 2005-2008 Noelios Technologies.
 * 
 * The contents of this file are subject to the terms of the following open
 * source licenses: LGPL 3.0 or LGPL 2.1 or CDDL 1.0 (the "Licenses"). You can
 * select the license that you prefer but you may not use this file except in
 * compliance with one of these Licenses.
 * 
 * You can obtain a copy of the LGPL 3.0 license at
 * http://www.gnu.org/licenses/lgpl-3.0.html
 * 
 * You can obtain a copy of the LGPL 2.1 license at
 * http://www.gnu.org/licenses/lgpl-2.1.html
 * 
 * You can obtain a copy of the CDDL 1.0 license at
 * http://www.sun.com/cddl/cddl.html
 * 
 * See the Licenses for the specific language governing permissions and
 * limitations under the Licenses.
 * 
 * Alternatively, you can obtain a royaltee free commercial license with less
 * limitations, transferable or non-transferable, directly at
 * http://www.noelios.com/products/restlet-engine
 * 
 * Restlet is a registered trademark of Noelios Technologies.
 */

package com.imake.moogle.lbs.backoffice.main;
  
import java.math.BigDecimal;
import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.imake.moogle.lbs.backoffice.service.KPIService;
 
 
/**
 * Simple demo application that can be run either as a standalone application
 * (http://localhost:3000/v1/) or inside a servlet container
 * (http://localhost:8080/v1/).
 * 
 * @author Chatchai Pimtun (Admin)
 */
public class Main { 
	public static void main(String[] args) throws Exception {
        // Load the Spring application context
        final ApplicationContext springContext = new ClassPathXmlApplicationContext(
                new String[] {  
                		 "com/imake/moogle/lbs/backoffice/main/hibernate-config.xml"
                		//"com/moogle/lbs/main/hibernate-balancescorecard-config.xml",
                		//"com/moogle/lbs/main/hibernate-operationdashboard-config.xml",
                		//"com/moogle/lbs/main/hibernate-financedashboard-config.xml"
                		});
        KPIService kpipService =(KPIService) springContext.getBean("kpiService");
        String queryYear="SELECT distinct result.year FROM FSD2.employee_result result order by result.year desc ";
        System.out.println(kpipService.listYear(queryYear).size());
       String department="select distinct department_code, department_name  from employee" +
        		" order by department_name";
		System.out.println(kpipService.listMaster(department).size());
		 
        
        String position="select distinct position_code, position_name  from employee" +
        		"  where department_code = '0110-1' order by position_name";
        		System.out.println(kpipService.listMaster(position).size());
         
        
        String emp="select distinct employee_code, concat(employee_name,' ',employee_surname) " +
        		" as emp_name ,department_code,position_code from employee where  department_code = '0110-1'" +
        		"  and   position_code = '177' order by emp_name";
    	System.out.println("employee size="+kpipService.listMaster(emp).size());
    	
    System.out.println(kpipService.searchEmployeeResult("ss","2012", null,"","all","all", "1050140001","",""));
    	
    	BigDecimal[] adjustPercentage={BigDecimal.valueOf(1)};
    	double finalD=adjustPercentage[0].doubleValue()+56.00d;
    	BigDecimal[] finalPercentage={BigDecimal.valueOf(finalD)};
    	Integer[] year={2012};
    	Integer[] periodNo={1};
    	String[] employeeCode={"0211146004"};
    	String[] reason={"ทดสอบdasfs"};
    	
    	 int updated=kpipService.updateAdjustPercentage("ss",adjustPercentage, finalPercentage, year, periodNo, employeeCode, reason);
    System.out.println(updated); 
    	/*com.imake.moogle.lbs.backoffice.dto.Threshold threshold =new com.imake.moogle.lbs.backoffice.dto.Threshold();
    	threshold.setThresholdId(1);
    	com.imake.moogle.lbs.backoffice.dto.Threshold threshold_return =kpipService.findThresholdById(threshold,1);
    	System.err.println("sssssssssssss 1 ="+threshold_return);
    	Object obj_return =kpipService.findById(threshold,1);
    	System.err.println("sssssssssssss 2 ="+obj_return);
    	threshold_return=(com.imake.moogle.lbs.backoffice.dto.Threshold)obj_return;
    	threshold_return.setThresholdName(threshold_return.getThresholdName()+"update");
    	threshold_return.setUpdatedDt(new Date());
    	System.err.println("sssssssssssss 3 ="+threshold_return);
    	//kpipService.updateObject(obj_return);
    	com.imake.moogle.lbs.backoffice.dto.Threshold threshold_returnx =new com.imake.moogle.lbs.backoffice.dto.Threshold();
    	//threshold_return.setThresholdId(null);
    	threshold_returnx.setThresholdId(null);
    	kpipService.saveThreshold(threshold_returnx);*/
    	//System.err.println(obj_return);
      //  Main obj=new Main();
     // obj.testBSC(balanceScorecardService);
        //obj.testProc(operationDashboardProcService);
        //obj.testFI(financeDashboardService);
    }
	 
}
