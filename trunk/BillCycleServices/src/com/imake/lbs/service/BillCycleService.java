package com.imake.lbs.service;

import java.util.List;

import com.imake.lbs.dto.ArBillingSchedule;
import com.imake.lbs.dto.ArCustomer;

public interface BillCycleService {
	//search
	public List searchObject(String query);
	public int executeQuery(String query);
	public int executeBillCycleQuery(String schema,ArCustomer arCustomer,
			List<ArBillingSchedule> arBillingSchedules,List<ArBillingSchedule> arPaymentSchedules);
}	