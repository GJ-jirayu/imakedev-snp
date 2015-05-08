<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/jsp/includes.jsp" %>  
<html> 
<head>
<title>BackOffice</title>
 <meta charset="UTF-8" />   
   <script  src="../resources/js/jquery-1.8.3.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="../resources/js/smoothness/jquery-ui-1.9.2.custom.min.js"></script>
 <script type="text/javascript" src="../resources/ckeditor/ckeditor.js"></script>
<script src="../resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="../resources/css/smoothness/jquery-ui-1.9.2.custom.css" type="text/css"  rel="stylesheet" /> 
<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"  type="text/css"/>  
 <!-- 
	DWR
	-->
	<script type="text/javascript"
        	src="<%=request.getContextPath() %>/dwr/interface/KPIAjax.js"></script>
	<script type="text/javascript"
        	src="<%=request.getContextPath() %>/dwr/engine.js"></script> 
	<script type="text/javascript"
        	src="<%=request.getContextPath() %>/dwr/util.js"></script>
 <style type="text/css">
 /*  fieldset { width: 100%; }
  fieldset legend { width: 100%; }
  fieldset legend div { margin: 0.3em 0.5em; }
  fieldset .field { margin: 0.5em; padding: 0.5em; }
  fieldset .field label { margin-right: 0.4em; } */
</style>
<style>
.ui-widget { font-family: Trebuchet MS, Tahoma, Verdana,
 Arial, sans-serif; font-size: 12px; }
input[type=text] {
	height: 30px;
	line-height: 30px
}
 </style>
<style type="text/css">
/*.th_class{font-family: Tahoma;font-size: 13px;text-align: center;*/
.th_class{text-align: center;
}
a{cursor: pointer;}
</style>
<!-- <style type="text/css"> 
th{ font-family:Tahoma; font-size:12px; font-weight:bold;
 color: #fff;background:url(/MISSExamBackOffice/resources/images/tr_back-theme1.gif) repeat-x scroll 0 0 #80838A;padding: 5px 8px;border:1px solid #fff; 
} 
</style> -->  

</head> 
<body> 
  <div class="row-fluid"  style="position:fixed;">
     	<div class="span7"> 
              <div class="navbar" style="padding-top: 8px;padding-left: 10px;padding-right: 10px;height: 22px;width: 1029px">
              <div class="navbar-inner" style="width: 1029px">
                <div class="container"> 
                  <div class="nav-collapse collapse navbar-responsive-collapse">
                    <ul class="nav">
                      <li id="roadpump_link"><a onclick="togle_page('appraisal_adjustment','roadpump_link')">Appraisal Adjustment</a></li>
                    </ul>  
                  </div>
                </div>
              </div>
            </div> 
     	</div>
     	<div class="span7">
     	<div id="_content" class="span7" style="margin-left:-8px;padding-top: 3px;">
      		<fieldset style="font-family: sans-serif;padding-top:0px;width: 1048px"> 
<form class="form-horizontal"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px" action="" method="post" >
  
  <div class="control-group">
    <label class="control-label" for="inputEmail">Year:</label>
    <div class="controls" id="yearSelection"> 
    </div>
  </div> 
  <div class="control-group">
    <label class="control-label" for="inputEmail">Department:</label>
    <div class="controls" id="departmentSelection"> 
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="inputEmail">Position:</label>
    <div class="controls" id="positionSelection"> 
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="inputEmail">Employee:</label>
    <div class="controls" id="employeeSelection">  
    </div> 
  </div> 
</form>
 <div id="dialog-Message-alert" title="Message" style="display: none;background: ('images/ui-bg_highlight-soft_75_cccccc_1x100.png') repeat-x scroll 50% 50% rgb(204, 204, 204)">
	<span id="_message_show"></span>
</div>
<div id="dialog-Message" style="margin-top:-15px; display: none;height: 200px; overflow: auto;overflow-x:hidden" >
<form  class="well"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;" action="" method="post" >
<div title="Employee"> 
	 <div style="padding: 10px;" id="employee_section">
	  
    </div>
  </div>
  <div align="center"> 
 
      <a class="btn btn-primary"  onclick="adjust()"><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Adjust</span></a>
    </div>
  </form>
  </div>
</fieldset>
      	</div>
     	</div>
     </div> 
     <script type="text/javascript">
//var _path="/KPIWebTest/";
//var SCHEMA_G='mcic_kpi_app';
var SCHEMA_G='FSD2';
var _path='<%=request.getContextPath()%>'+'/'; 
var mail_toG;
var mail_subjectG;
var mail_messageG;
var mail_attachG;   
$(document).ready(function() { 
	/* $('#togle_emp').click(function() {
		 //$("#dialog-Message").slideDown("slow"); 
		     $('#dialog-Message').toggle('slow', function() { 
 
		  });  
		}); */
	listYear();
	listDepartment();
}); 
function loadDynamicPage(pageId){  
	pageId=_path+"ending_periodic_data_entry/template/"+pageId+".jsp";  
			$.ajax({
				  type: "get",
				  url: pageId,
				  cache: false 
				}).done(function( data ) {
					if(data!=null){
						  appendContent(data);
					  }
				});
}
function togle_page(pageId,id_active){  
	$("ul[class=nav] > li").removeClass("active"); 
	    $("#"+id_active).addClass("active");
		loadDynamicPage(pageId);
}
function appendContentWithId(data,contentId){
	if(data.indexOf("j_username")!=-1 || data.indexOf("loginform")!=-1){ 
		  window.location.href="<c:url value='/logout'/>"; 
	  }else{ 
			  $("#"+contentId).html(data); 
	  }
	
}
function appendContent(data){ 
	appendContentWithId(data,"_content"); 
}
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
</script> 
</body>
</html> 

