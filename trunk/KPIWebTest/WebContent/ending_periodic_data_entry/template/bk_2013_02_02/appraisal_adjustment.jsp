<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/jsp/includes.jsp" %> 
<script type="text/javascript">
$(document).ready(function() {
	/* $( "#dialog-Message" ).dialog({
	      autoOpen: false,
	      show: "blind",
	    //  hide: "explode"
	    }); */
	$('#togle_emp').click(function() {
		 //$("#dialog-Message").slideDown("slow"); 
		     $('#dialog-Message').toggle('slow', function() {
		    // Animation complete.
		  });  
		});
	listYear();
	listDepartment();
}); 
function parseDouble(value){
	  if(typeof value == "string") {
	    value = value.match(/^-?\d*/)[0];
	  }
	  
	  return !isNaN(parseFloat(value)) ? value * 1 : NaN;
	}
function listYear(){
	var query="SELECT distinct result.year FROM "+SCHEMA_G+".employee_result result order by result.year desc ";
	KPIAjax.listYears(query,{
		callback:function(data){
			//alert(data);
			if(data!=null && data.length>0){
			    var str="<select id=\"yearElement\" style=\"width: 75px\" onchange=\"listDepartment()\">";
				for(var i=0;i<data.length;i++){
					str=str+"<option value=\""+data[i]+"\">"+data[i]+"</option>";
				}
				str=str+"</select>";
				$("#yearSelection").html(str);
				
				
			}
		}
    });
}
function listDepartment(){
	//var year=$("#yearElement").val();
	//alert(year)
	var query="select distinct department_code, department_name  from "+SCHEMA_G+".employee" +
	" order by department_name";
	KPIAjax.listMaster(query,{
		callback:function(data){
			//alert(data);
			if(data!=null && data.length>0){
			    var str="<select id=\"departmentElement\" onchange=\"listPosition()\">";
				for(var i=0;i<data.length;i++){
					str=str+"<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
				}
				str=str+"</select>";
				$("#departmentSelection").html(str);
				listPosition();
				
			}
		}
    });
}
function listPosition(){
	var department_value=$("#departmentElement").val();
	//alert(department_value)
	 var query="select distinct position_code, position_name  from "+SCHEMA_G+".employee" +
		"  where department_code ='"+department_value+"' order by position_name";
	KPIAjax.listMaster(query,{
		callback:function(data){
			//alert(data);
			if(data!=null && data.length>0){
			    var str="<select id=\"positionElement\" onchange=\"listEmployee()\">";
				for(var i=0;i<data.length;i++){
					str=str+"<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
				}
				str=str+"</select>";
				$("#positionSelection").html(str);
				listEmployee(); 
			}
		}
    });
}
function listEmployee(){
	var position_value=$("#positionElement").val();
	//alert(position_value) 
	var department_value=$("#departmentElement").val();
	//alert(department_value)
	var query="select distinct employee_code, concat(employee_name,' ',employee_surname) " +
		" as emp_name ,department_code,position_code from "+SCHEMA_G+".employee where  department_code = '"+department_value+"'" +
		"  and   position_code = '"+position_value+"' order by emp_name";
	KPIAjax.listMaster(query,{
		callback:function(data){
			//alert(data);
			if(data!=null && data.length>0){
			    var str="<select id=\"employeeElement\" onchange=\"distplayEmployee()\">";
				for(var i=0;i<data.length;i++){
					str=str+"<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
				}
				//str=str+"</select> &nbsp; &nbsp;<a class=\"btn\" onclick=\"searchKPIResult()\">Search</a>";
				str=str+"</select>";
				
			     
				$("#employeeSelection").html(str);
				distplayEmployee();
			}
		}
 });
}
function distplayEmployee(){
	 var year=$("#yearElement").val();
	 var employee_code=$("#employeeElement").val();
	//alert("a")
	KPIAjax.searchEmployeeResult(year,null,employee_code,{
		callback:function(data){
			//alert(data);
			if(data!=null && data.length>0){
			    var str="<table class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px\">"+
			    		"<thead>"+
			    		"<tr> "+
	          			"<th width=\"20%\"><div class=\"th_class\">Period</div></th>"+
	            		"<th width=\"10%\"><div class=\"th_class\">Employee Code</div></th>"+
	            		"<th width=\"20%\"><div class=\"th_class\">Employee Name</div></th>"+
	            		"<th width=\"10%\"><div class=\"th_class\">Weight Percentage</div></th>"+ 
	            		"<th width=\"10%\"><div class=\"th_class\">Adjust Percentage</div></th>"+
	            		"<th width=\"30%\"><div class=\"th_class\">AdjustmentReason</div></th>  "+
	            		"<th width=\"10%\"><div class=\"th_class\">Final Percentage</div></th>    "+
	          		"</tr>"+
	        	"</thead>"+
	        	"<tbody>";
	        	<%-- 
	        	/* BigDecimal adjustPercentage=BigDecimal.valueOf(1);
	        	double finalD=adjustPercentage.doubleValue()+56.00d;
	        	BigDecimal finalPercentage=BigDecimal.valueOf(finalD);
	        	Integer year=2012;
	        	Integer periodNo=1;
	        	String employeeCode="0211146004";
	        	String reason="sss";
	        	int updated=kpipService.updateAdjustPercentage(adjustPercentage, finalPercentage, year, periodNo, employeeCode, reason); */
	        	--%>
				for(var i=0;i<data.length;i++){
				//for(var z=0;z<10;z++){
					//var i=0;
					str=str+
					"<tr style=\"cursor: pointer;\">"+
	          		"<td style=\"text-align: left;\">"+
	          		"<input type=\"hidden\" name=\"employee_code_input\" value=\""+data[i].employeeCode+"\" />"+
	          		"<input type=\"hidden\" name=\"period_no_input\" value=\""+data[i].periodNo+"\" />"+
	          		"<input type=\"hidden\" name=\"year_input\" value=\""+data[i].year+"\" />"+
	          		"<input type=\"hidden\" name=\"weightPercentage_input\" value=\""+data[i].weightPercentage+"\" />"+
	          		data[i].periodDesc+"</td>    "+
	            	"<td style=\"text-align: left;\">"+data[i].employeeCode+"</td>"+
	            	"<td>"+data[i].empName+"</td> "+
	            	"<td style=\"text-align: right;\">"+data[i].weightPercentage+"</td>"+
	            	"<td style=\"text-align: right;\"><input  style=\"width: 50px\" name=\"adjustPercentage_input\" value=\""+(data[i].adjustPercentage!=null?data[i].adjustPercentage:"")+"\" /></td>"+
	            	"<td> <textarea  style=\"width:260px\" name=\"adjustmentReason_input\" cols=\"4\" rows=\"2\">"+(data[i].adjustmentReason!=null?data[i].adjustmentReason:"")+"</textarea></td>"+
	            	"<td style=\"text-align: right;\">"+data[i].finalPercentage+"</td>  "+
	          	"</tr>  ";
				}
				str=str+"</tbody> </table>";
				
				$("#employee_section").html(str);  
				/* alert($(document).height());
				$(document).height("1024px");
				alert($(document).height()); */
				$("#dialog-Message").slideDown("slow");
				//$("#employee_section").slideDown("slow");
			}else{
			    $("#dialog-Message").slideUp("slow");
			}
		}
 });		 
}
function adjust(){
	var employee_code_input=document.getElementsByName("employee_code_input"); // period_no_input , year_input , adjustPercentage_input , weightPercentage_input
	var period_no_input=document.getElementsByName("period_no_input");
	var year_input=document.getElementsByName("year_input");
	var adjustPercentage_input=document.getElementsByName("adjustPercentage_input");
	var weightPercentage_input=document.getElementsByName("weightPercentage_input");
	var adjustmentReason_input=document.getElementsByName("adjustmentReason_input");
	if(employee_code_input!=null && employee_code_input.length>0){
		var finalPercentageArray=[];
		var adjustPercentageArray=[];
		var yearArray=[];
		var period_noArray=[];
		var employee_codeArray=[];
		var adjustmentReasonArray=[];
		for(var i=0;i<employee_code_input.length;i++){
			//alert("period_no_input="+document.getElementsByName("period_no_input")[i].value);
			//alert("year_input="+document.getElementsByName("year_input")[i].value);
			//alert("adjustPercentage_input="+document.getElementsByName("adjustPercentage_input")[i].value);
			//alert("weightPercentage_input="+document.getElementsByName("weightPercentage_input")[i].value);
			//alert("adjustmentReason_input="+document.getElementsByName("adjustmentReason_input")[i].value);
			var finalPercentage= parseFloat(document.getElementsByName("weightPercentage_input")[i].value)+parseFloat(document.getElementsByName("adjustPercentage_input")[i].value);
			finalPercentage=parseFloat(finalPercentage).toFixed(2);
			adjustPercentageArray.push(parseFloat(adjustPercentage_input[i].value).toFixed(2));
			yearArray.push(parseInt(year_input[i].value));
			employee_codeArray.push(employee_code_input[i].value);
			adjustmentReasonArray.push(adjustmentReason_input[i].value);
			period_noArray.push(parseInt(period_no_input[i].value));
			//alert("finalPercentage="+finalPercentage);
			finalPercentageArray.push(finalPercentage);
		}
	
		//kpipService.updateAdjustPercentage(adjustPercentage, finalPercentage, year, periodNo, employeeCode, reason);
		KPIAjax.updateAdjustPercentage(adjustPercentageArray,finalPercentageArray,yearArray
				,period_noArray,employee_codeArray,adjustmentReasonArray,{
			callback:function(data){
				//alert("return adjust="+data);
				if(data!=null && data!=0){
					$("#_message_show").html("Adjust Success."); 
				}else{
					$("#_message_show").html("Adjust not Success."); 
				}
				$( "#dialog-Message-alert" ).dialog({
					/* height: 140, */
					modal: true,
					buttons: {
						"Ok": function() { 
							$( this ).dialog( "close" );
							distplayEmployee();
						}
					} 
				});
				/* if(data!=null && data.length>0){
				    var str="<select id=\"employeeElement\">";
					for(var i=0;i<data.length;i++){
						str=str+"<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
					}
					//str=str+"</select> &nbsp; &nbsp;<a class=\"btn\" onclick=\"searchKPIResult()\">Search</a>";
					str=str+"</select>";
					
				     
					$("#employeeSelection").html(str);
					distplayEmployee();
				} */
			},
			 errorHandler:function(errorString, exception) { 
				 alert(errorString+","+exception)
			 }
	 });
		
	}
	//alert(employee_code_input.length);
	
}
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
function showEmployee(){
	$("#dialog-Message").slideDown("slow"); 
	//$("#message_element").slideUp("slow");
	//  $( "#dialog-Message" ).dialog(  "open" );
	 /* $( "#dialog-Message" ).dialog({
		 
		modal: true,
		buttons: {
			"Ok": function() { 
				$( this ).dialog( "close" );
				 
			}
		}
	  });   */
}
function searchKPIResult(){
	/* $("#emp_code").val("53-145");
	$("#emp_name").val("วินัย ทองอยู่"); */
	$("#dialog-Message").slideDown("slow"); 
	distplayEmployee();
}
</script><%-- 
<div style="${display};padding-top:10px">
 <div class="alert alert-success" style="${display}">    
    <button class="close" data-dismiss="alert"><span style="font-size: 12px">x</span></button>
    <strong>${message}</strong> 
  </div>
  </div> --%>
 <!-- <div id="dialog-Message" title="Employee" style="display: none;"> -->
 
<!--  <div id="dialog-Message" title="Employee" style="display: none;">
	 <span>Employee Name: <input type="text"/> <button>Search</button></span> -->
	 <%--
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
     --%>
<!-- </div> -->
<fieldset style="font-family: sans-serif;padding-top:0px;width: 1048px">
<!-- <fieldset style="font-family: sans-serif;"> -->
<form class="form-horizontal"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px" action="" method="post" >
  
  <div class="control-group">
    <label class="control-label" for="inputEmail">Year:</label>
    <div class="controls" id="yearSelection">
    <!--  
     <select style="width: 75px" >
     	<option>2012</option>
     	<option>2013</option>
     </select>
     -->
    </div>
  </div> 
  <div class="control-group">
    <label class="control-label" for="inputEmail">Department:</label>
    <div class="controls" id="departmentSelection">
     <!-- 
     <select>
     	<option>ฝ่ายการตลาด-การขาย</option> 
     </select>
      -->
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="inputEmail">Position:</label>
    <div class="controls" id="positionSelection">
    <!--  <select>
     	<option>พนักงานขาย</option> 
     </select> -->
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="inputEmail">Employee:</label>
    <div class="controls" id="employeeSelection">
     <!-- <select>
     	<option>วิชัย เก่งอาจ</option> 
     </select> -->
     &nbsp; &nbsp;
     <a class="btn" onclick="searchKPIResult()">Search</a>
     
    </div> 
  </div>
   
   
  <!-- <div class="control-group">
    <div class="controls"> 
      <a class="btn btn-primary" ><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Submit</span></a>
    </div>
  </div> -->
</form>
 <div id="dialog-Message-alert" title="Message" style="display: none;background: ('images/ui-bg_highlight-soft_75_cccccc_1x100.png') repeat-x scroll 50% 50% rgb(204, 204, 204)">
	<span id="_message_show"></span>
</div>
<div id="dialog-Message" style="margin-top:-15px; display: none;height: 200px; overflow: auto;overflow-x:hidden" >
<form  class="well"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;" action="" method="post" >
<div title="Employee"> 
	 <div style="padding: 10px;" id="employee_section">
	 <%--
  <table class="table table-hover table-striped table-bordered table-condensed" border="1" style="font-size: 12px">
        	<thead>
          		<tr> 
          			<th width="20%"><div class="th_class">Period</div></th>
            		<th width="10%"><div class="th_class">Employee Code</div></th>
            		<th width="20%"><div class="th_class">Employee Name</div></th>
            		<th width="10%"><div class="th_class">Weight Percentage</div></th> 
            		<th width="10%"><div class="th_class">Adjust Percentage</div></th>
            		<th width="30%"><div class="th_class">AdjustmentReason</div></th>  
            		<th width="10%"><div class="th_class">Final Percentage</div></th>    
          		</tr>
        	</thead>
        	<tbody>   
          	<tr style="cursor: pointer;">
          		<td style="text-align: left;">การประเมิณผลงานครั้งที่ 1</td>    
            	<td style="text-align: left;">53-145</td>            	
            	<td>วินัย ทองอยู่</td> 
            	<td style="text-align: right;">79.05</td>
            	<td style="text-align: right;">1.00</td>
            	<td>ขยันตั้งใจทำงานที่ทำไม่ถึงเป้าเพราะสภาวะเศรษฐกิจไม่ดี</td> 
            	<td style="text-align: right;">80.05</td>  
          	</tr>  
  		 </tbody>
   </table>
    --%> 
    </div>
  </div>
  <div align="center"> 
 
      <a class="btn btn-primary"  onclick="adjust()"><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Adjust</span></a>
    </div>
  </form>
  </div>
</fieldset>