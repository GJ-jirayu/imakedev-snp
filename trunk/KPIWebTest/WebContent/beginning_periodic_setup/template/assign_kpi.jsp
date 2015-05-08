<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/jsp/includes.jsp" %> 
<style>
 .ui-datepicker-trigger{
 cursor: pointer;
 }
</style>
<script type="text/javascript">
$(document).ready(function() {
 
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
    <label class="control-label">Period:</label>
    <div class="controls">
     <select>
     	<option>การประเมิณผลงานครั้งที่ 1</option> 
     </select>
    </div>
  </div> 
   <div class="control-group">
    <label class="control-label">Department:</label>
    <div class="controls">
      <select>
     	<option>ฝ่ายการตลาด-การขาย</option> 
     </select>
    </div>
  </div> 
  <div class="control-group">
    <label class="control-label">Position:</label>
    <div class="controls">
      <select>
     	<option>พนักงานขาย</option> 
     </select>
    </div>
  </div> 
  <div class="control-group">
    <label class="control-label">Employee:</label>
    <div class="controls">
      <select>
     	<option>วิชัย เก่งกาจ</option> 
     </select>
    </div>
  </div>   
  <div style="padding: 10px">
  <table class="table table-hover table-striped table-bordered table-condensed" border="1" style="font-size: 12px">
        	<thead>
          		<tr> 
            		<th width="10%"><div class="th_class">KPI Order</div></th>
            		<th width="42%"><div class="th_class">KPI Name</div></th> 
            		<th width="14%"><div class="th_class">KPI Weight</div></th> 
            		<th width="14%"><div class="th_class">Target Data</div></th>
            		<th width="14%"><div class="th_class">Target Score</div></th>
          		</tr>
        	</thead>
        	<tbody>   
          	<tr> 
            	<td style="text-align: right;">1</td>
            	<td>ยอดขายเทียบเป้า</td>
            	<td style="text-align: right;">50</td> 
            	<td style="text-align: right;"> 
            	 5,000,000
            	</td>
            	<td style="text-align: right;"> 
            	 50
            	</td>
          	</tr> 
          	 <tr> 
            	<td style="text-align: right;">2</td>
            	<td>ความพึงพอใจของลูกค้า</td>
            	<td style="text-align: right;">30</td> 
            	<td style="text-align: right;"> 
            	 10
            	</td>
            	<td style="text-align: right;"> 
            	30
            	</td>
          	</tr> 
  		 </tbody>
   </table>
    </div>
  <div class="control-group">
    <div class="controls"> 
      <a class="btn btn-primary" ><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Assign KPI</span></a>
    </div>
  </div>
</form> 

</fieldset>