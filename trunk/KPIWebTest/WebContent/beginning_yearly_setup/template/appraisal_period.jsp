<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/jsp/includes.jsp" %> 
<style>
 .ui-datepicker-trigger{
 cursor: pointer;
 }
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#start_date" ).datepicker({
		showOn: "button",
		buttonImage: _path+"resources/images/calendar.gif",
		buttonImageOnly: true,
		dateFormat:"dd/mm/yy" ,
		changeMonth: true,
		changeYear: true
	});
	$("#end_date" ).datepicker({
		showOn: "button",
		buttonImage: _path+"resources/images/calendar.gif",
		buttonImageOnly: true,
		dateFormat:"dd/mm/yy" ,
		changeMonth: true,
		changeYear: true
	});
});
function goBackEmployeeStatus(){
 
	  $.ajax({
		  type: "get",
		  url: "employeeStatus/init",
		  cache: false
		 // data: { name: "John", location: "Boston" }
		}).done(function( data ) {
			if(data!=null){
				 appendContent(data);
				// $("#tabs-3").html(data);
			  }
		});
}
function doEmployeeStatusAction(action,mode,id){
	   
	var target="employeeStatus"; 
 	$.post(target+"/action/employeestatus",$("#employeeStatusForm").serialize(), function(data) {
		  // alert(data);
		  appendContent(data);
		   //appendContentWithId(data,"tabs-3");
		  // alert($("#_content").html());
		});
  }
 
</script><%-- 
<div style="${display};padding-top:10px">
 <div class="alert alert-success" style="${display}">    
    <button class="close" data-dismiss="alert"><span style="font-size: 12px">x</span></button>
    <strong>${message}</strong> 
  </div>
  </div> --%>
<fieldset style="font-family: sans-serif;padding-top:0px;width: 720px">
<!-- <fieldset style="font-family: sans-serif;"> -->
<form class="form-horizontal"  style="border:2px solid #B3D2EE;background: #F9F9F9;padding-top:20px" action="" method="post" >
  <div class="control-group">
    <label class="control-label" for="inputEmail">Year:</label>
    <div class="controls">
     <select style="width: 75px">
     	<option>2012</option>
     	<option>2013</option>
     </select>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Period No:</label>
    <div class="controls">
      <input type="text" >
    </div>
  </div> 
   <div class="control-group">
    <label class="control-label">Description:</label>
    <div class="controls">
      <input type="text" >
    </div>
  </div> 
   <div class="control-group">
    <label class="control-label">Start Date:</label>
    <div class="controls">
      <input type="text" id="start_date" name="start_date" readonly="readonly" style="width: 90px"/>
    </div>
  </div> 
   <div class="control-group">
    <label class="control-label">End Date:</label>
    <div class="controls">
      <input type="text" id="end_date" name="end_date" readonly="readonly"  style="width: 90px"/>
    </div>
  </div> 
  <div class="control-group">
    <div class="controls"> 
      <a class="btn btn-primary" ><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Submit</span></a>
    </div>
  </div>
</form><%-- 
	    <form id="employeeStatusForm" name="employeeStatusForm"  class="well" style="border:2px solid #B3D2EE;background: #F9F9F9" action="" method="post">
	  
			 
			  <fieldset style="font-family: sans-serif;">   
			 <!--  <pre  class="prettyprint" style="font-family: sans-serif;font-size:12px:;margin-top: 0px"> -->
			  <div align="left">
           	 <strong>Employee Status</strong><br></br>
            	</div>
			    <table border="0" width="800px" style="font-size: 12px">
			    	<tr>
    					<td width="100%" colspan="3"></td>
    				</tr>
    				<tr valign="middle">
    					<td width="25%" align="right"><span style="font-size: 13px;padding: 15px">คำอธิบาย :</span></td>
    					<td width="75%" colspan="2"> 
    						<form:input path="pstEmployeeStatus.pesName" id="pesName" cssStyle="height: 30;"/>
    					</td> 
    				</tr> 
    				<tr valign="middle">
    					<td width="25%" align="right"><span style="font-size: 13px;padding: 15px">อัตราค่าแรง(เท่า) :</span></td>
    					<td width="75%" colspan="2"> 
    					<form:input path="pstEmployeeStatus.pesWageRate" id="pesWageRate" cssStyle="height: 30;width:80px"/>
    					</td>
    				</tr> 
    			</table> 
    			</fieldset> 
			  </form> 
			  
			<div align="center">
			<a class="btn btn-info"  onclick="goBackEmployeeStatus()"><i class="icon-chevron-left icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Back</span></a>	
    					 <a class="btn btn-primary"  onclick="doEmployeeStatusAction('action','${employeeStatusForm.mode}','${employeeStatusForm.pstEmployeeStatus.pesId}')"><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Save</span></a>
			</div> --%>
</fieldset>