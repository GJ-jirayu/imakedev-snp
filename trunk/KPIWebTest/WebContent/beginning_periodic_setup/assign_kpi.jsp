<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %> 
<%@ include file="/WEB-INF/jsp/includes.jsp" %>  
<html> 
<head>
<title>BackOffice</title>
<!--  <meta charset="UTF-8" />   --> 
 <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
 <meta http-equiv="X-UA-Compatible" content="IE=9" />
   <script  src="<%=request.getContextPath() %>/resources/js/jquery-1.8.3.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/smoothness/jquery-ui-1.9.2.custom.min.js"></script>
 <script type="text/javascript" src="<%=request.getContextPath() %>/resources/ckeditor/ckeditor.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="<%=request.getContextPath() %>/resources/css/smoothness/jquery-ui-1.9.2.custom.css" type="text/css"  rel="stylesheet" /> 
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"  type="text/css"/>    
 
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
textarea,fieldset ,select,a{font-size: 12px
}
table > tbody{font-size: 12px;
}
table th, .table td {
line-height: 10px;
}
input {
font-size: 12px;
font-weight: normal;
line-height: normal;
}
 form {
margin: 0 0 0px;
}
.input_number{
width: 100px;
text-align:right;
}
.input_text{
width: 350px;
}
 
 </style>
 <style>
 .ui-datepicker-trigger{
 cursor: pointer;
 }
  
</style>
<style type="text/css">
/*.th_class{font-family: Tahoma;font-size: 13px;text-align: center;*/
.th_class{text-align: center;
}
a{cursor: pointer;}
.ui-autocomplete-loading {
    background: white url('<%=request.getContextPath() %>/resources/css/smoothness/images/ui-anim_basic_16x16.gif') right center no-repeat;
  } 
.input_kpi{
 height: 20px;
 line-height: 20px;
 }
</style>
<!-- <style type="text/css"> 
th{ font-family:Tahoma; font-size:12px; font-weight:bold;
 color: #fff;background:url(/MISSExamBackOffice/resources/images/tr_back-theme1.gif) repeat-x scroll 0 0 #80838A;padding: 5px 8px;border:1px solid #fff; 
} 
</style> -->  

</head> 
<body> 
<!--   <div class="row-fluid"  style="position:fixed;">
     	<div class="span7"> -->
     	<div id="_content" style="margin-left:3px;padding-top: 3px;width: 1100px">
      		<!--   <fieldset style="font-family: sans-serif;padding-top:0px;width: 1048px"> --> 
      		<table style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;padding-bottom:15px;width: 1100px;"><tr><td>
<!-- <form class="form-horizontal"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px" action="" method="post" >
   -->
  <div style="padding-left:20px;padding-top: 5px">
     Year:
    <span   id="yearSelection"> 
    </span>  
     <span style="padding-left:10px;">
    Period:
    </span>
    <span   id="periodSelection"> 
    </span>
     <span style="padding-left:10px;">
    Department:
    </span>
    <span   id="departmentSelection"> 
    </span>
   
     <span style="padding-left:10px;">
    Position:
    </span>
    <span   id="positionSelection"> 
    </span> 
  
   
   <!--  <span> <input id="city" /></span> -->
   
    </div>
    </td></tr>
    <tr><td> 
     <span style="padding-left:20px;">
    Employee:
    </span>
     <span>  
     <input type="hidden" id="employeeElement" />
     <input type="text" id="employeeSelection" />
     <!-- <a class="btn btn-primary" style="font-size:12px;margin-top: -10px" onclick="distplayKPI()"><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size: 12px;">Search</span></a> -->
    </span>  
     <span style="padding-left:20px;">
    	<a class="btn btn-primary" style="font-size:12px;margin-top: -10px" onclick="showPage('1')"><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size: 12px;">Assign KPI</span></a>
    </span>
     <span style="padding-left:20px;">
    	<a class="btn btn-primary" style="font-size:12px;margin-top: -10px" onclick="showPage('2')"><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size: 12px;">Manage KPI</span></a>
    </span>
     <span style="padding-left:20px;">
    	<a class="btn btn-primary" style="font-size:12px;margin-top: -10px" onclick="showPage('3')"><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size: 12px;">Search KPI</span></a>
    </span>
<!-- </form> -->
   </td>
	</tr>
  </table> 
  </div>
  <div id="dialog-Message"  style="display: none;width: 1098px;padding-left: 4px;padding-top:1px">
  <table style="border:1px solid #B3D2EE;background: #F9F9F9;width: 1098px"> 
	<tr>
		<td> 
		<div style="display: block;padding-left: 3px;width: 1088px" >
<!-- <form  class="well"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;" action="" method="post" > -->
<div> 
	 <div style="padding: 10px; overflow: auto;height: 377px;overflow-x:hidden"  id="employee_section"> 
    </div>
    <div align="center" id="assign_kpi_section">  
      <a class="btn btn-primary"  onclick="assignKPI()"><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size:12px">Submit</span></a>
    </div>
  </div> 
  <!-- </form> -->
  </div> 
<div id="dialog-form"  style="display: none;margin-left:3px;padding-top: 3px;width: 1100px">
      		   <!-- <fieldset style="font-family: sans-serif;padding-top:0px;width: 1048px"> -->  
      		   <table style="width: 1100px;">
     			<tr>
     				<td>
<form class="form-inline"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;padding-bottom:15px" action="" method="post" >
 <div  style="padding-left:20px">
  <span style="padding-left:10px;">
    KPI Code: <input type="text" id="kpiCode" style="width: 90px"/>
    </span> 
     <span style="padding-left:10px;">
    KPI Name: <input type="text" id="kpiName" style="width: 300px"/>
    </span> 
   </div>
   <div  style="padding-left:20px;padding-top: 10px">
    <span style="padding-left:10px;">
     <input type="hidden" id="kpiCode_hidden"/>
     <input type="hidden" id="kpiName_hidden"/>
     <input type="text" id="kpiName_result" readonly="readonly" style="width: 410px"/>
    </span>
     <span style="padding-left:20px;">
    	<a class="btn btn-primary" style="font-size:12px" onclick="selectKPI()"><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size: 12px;">Get KPI</span></a>
    </span>   
  </div> 
   
  <!-- <div class="control-group">
    <div class="controls"> 
      <a class="btn btn-primary" ><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Submit</span></a>
    </div>
  </div> -->
</form>
<div id="dialog-confirmDelete" title="Delete KPI Result" style="display: none;background: ('images/ui-bg_highlight-soft_75_cccccc_1x100.png') repeat-x scroll 50% 50% rgb(204, 204, 204)">
	Are you sure you want to delete KPI Result ?
</div>
</td>
				</tr>
  			</table>
 </div>
  
   </td>
	</tr>
  </table>
 </div>  
 <div id="dialog-Message2"  style="display: none;width: 1098px;padding-left: 4px;padding-top:1px">
  <table style="border:1px solid #B3D2EE;background: #F9F9F9;width: 1098px"> 
	<tr>
		<td> 
		<div style="display: block;padding-left: 3px;width: 1088px" >
<!-- <form  class="well"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;" action="" method="post" > -->
<div> 
	 <div style="padding: 10px; overflow: auto;height: 377px;overflow-x:hidden"  id="employee_section2"> 
    </div>
    <div align="center" id="assign_kpi_section2">  
      <a class="btn btn-primary"  onclick="assignKPI2()"><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size:12px">Submit</span></a>
    </div>
  </div> 
  <!-- </form> -->
  </div> 
<div id="dialog-form2"  style="display: none;margin-left:3px;padding-top: 3px;width: 1100px">
      		   <!-- <fieldset style="font-family: sans-serif;padding-top:0px;width: 1048px"> -->  
      		   <table style="width: 1100px;">
     			<tr>
     				<td>
<form  id="form-input" class="form-inline"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;padding-bottom:15px" action="" method="post" >
 <div  style="padding-left:20px">
  <span style="padding-left:10px;">
    KPI Code : <input type="text" id="kpiCode2" style="width: 90px"/>
    </span> 
     <span style="padding-left:10px;">
    KPI Name : <input type="text" id="kpiName2" style="width: 300px"/>
    </span> 
   </div>
   <div  style="padding-left:20px;padding-top: 10px">
    <span style="padding-left:10px;">
     <input type="hidden" id="kpiCode_hidden2"/>
     <input type="hidden" id="kpiName_hidden2"/>
     <input type="text" id="kpiName_result2" readonly="readonly" style="width: 410px"/>
    </span>
    <!--  <span style="padding-left:20px;">
    	<a class="btn btn-primary" style="font-size:12px" onclick="selectKPI2()"><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size: 12px;">Get KPI</span></a>
    </span> -->   
  </div> 
   
  <!-- <div class="control-group">
    <div class="controls"> 
      <a class="btn btn-primary" ><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Submit</span></a>
    </div>
  </div> -->
</form>
<div>
<div style="padding-top: 10px">
<form class="form-inline"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;padding-bottom:15px" action="" method="post" >
 <input type="hidden" id="mode"/>
 <div  style="padding-left:20px">
 	<span> KPI Order: <input type="text"  id="kpiOrder2"  style="width:30px;"/></span>
 <input type="hidden" id="year_input2"/>
 <input type="hidden" id="period_no_input2"/>
 <input type="hidden" id="employee_code_input2"/>
 <input type="hidden" id="kpi_code_input2"/>	
 	<span style="padding-left: 3px">KPI Weight:  <input type="text"  id="kpiWeight2"  style="width:80px;"/></span>
 	<span style="padding-left: 3px">Target Data: <input type="text"  id="targetData2"  style="width:100px;"/></span>
 	<span style="padding-left: 3px">Target Score: <input type="text"  id="targetScore2" style="width:80px;"/></span>
  </div>
  
  <div style="padding-top: 20px" align="center"><a class="btn btn-primary" onclick="doSubmitAction()"><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Get KPI</span></a></div>
  
  </form>
  </div>
  </div> 
</td>
				</tr>
  			</table>
 </div>
  
   </td>
	</tr>
  </table>
  <table style="width: 1100px;">
     			<tr>
     				<td>

  </td>
  </tr>
  </table> 
 </div>  
  <div id="dialog-Message3"  style="display: none;width: 1098px;padding-left: 4px;padding-top:1px">
  <table style="border:1px solid #B3D2EE;background: #F9F9F9;width: 1098px"> 
	<tr>
		<td> 
		<div style="display: block;padding-left: 3px;width: 1088px" >
<!-- <form  class="well"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;" action="" method="post" > -->
<div> 
	 <div style="padding: 10px; overflow: auto;height: 377px;overflow-x:hidden"  id="employee_section3"> 
    </div>
   <!--  <div align="center" id="assign_kpi_section">  
      <a class="btn btn-primary"  onclick="assignKPI()"><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size:12px">Submit</span></a>
    </div> -->
  </div> 
  <!-- </form> -->
  </div> 
  
   </td>
	</tr>
  </table>
 </div> 
  <div id="dialog-Message4"  style="display: none;width: 1098px;padding-left: 4px;padding-top:1px">
  <table style="border:1px solid #B3D2EE;background: #F9F9F9;width: 1098px"> 
	<tr>
		<td> 
		<div style="display: block;padding-left: 3px;width: 1088px" >
<!-- <form  class="well"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;" action="" method="post" > -->
<div> 
	 <div style="padding: 10px; overflow: auto;height: 377px;overflow-x:hidden"  id="employee_section4"> 
    </div>
   <!--  <div align="center" id="assign_kpi_section">  
      <a class="btn btn-primary"  onclick="assignKPI()"><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size:12px">Submit</span></a>
    </div> -->
  </div> 
  <!-- </form> -->
  </div> 
  
   </td>
	</tr>
  </table>
 </div> 
 <%@ include file="/WEB-INF/jsp/schema.jsp" %>  
     <script type="text/javascript">
//var _path="/KPIWebTest/";
//var SCHEMA_G='mcic_kpi_app_test';
//var SCHEMA_G='FSD2';
var _path='<%=request.getContextPath()%>'+'/'; 
var mail_toG;
var mail_subjectG;
var mail_messageG;
var mail_attachG; 
var intRegex = /^\d+$/;
//var floatRegex = /^((\d+(\.\d *)?)|((\d*\.)?\d+))$/;
var floatRegex = /^((\d+(\.\d *)?)|((\d*\.)?\d+)|(-\d+(\.\d *)?)|((-\d*\.)?\d+))$/;

$(document).ready(function() {  
	listYear();
	listDepartment();
	$( "#kpiCode" ).autocomplete({
		  source: function( request, response ) { 
				var query="SELECT kpi_code,kpi_name FROM "+SCHEMA_G+".kpi where kpi_code like '%"+request.term+"%'";// and etl_flag = 'Y' ";		      
				KPIAjax.searchObject(query,{
					callback:function(data){ 
						if(data!=null && data.length>0){
							response( $.map( data, function( item ) {
					          return {
					        	  label: item[0],
					        	  value: item[1] 
					          }
					        }));
						}else{
							var xx=[]; 
							response( $.map(xx));
						}
					}
			 });		  
		  },
		  minLength: 2,
		  select: function( event, ui ) { 
			  this.value = ui.item.label;
			  $("#kpiName_result").val(ui.item.label+" "+ui.item.value);
			  $("#kpiName").val("");
			  
			  $("#kpiCode_hidden").val(ui.item.label);
			  $("#kpiName_hidden").val(ui.item.value); 
			 
		      return false;
		  },
		  open: function() {
		    $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
		  },
		  close: function() {
		    $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
		  }
		}); 
	$( "#kpiName" ).autocomplete({
		  source: function( request, response ) { 
				var query="SELECT kpi_code,kpi_name FROM "+SCHEMA_G+".kpi where kpi_name like '%"+request.term+"%' ";// and etl_flag = 'Y' ";		      
				KPIAjax.searchObject(query,{
					callback:function(data){ 
						if(data!=null && data.length>0){
							response( $.map( data, function( item ) {
					          return {
					        	  label: item[1],
					        	  value: item[0] 
					          }
					        }));
						}else{
							var xx=[]; 
							response( $.map(xx));
						}
					}
			 });		  
		  },
		  minLength: 2,
		  select: function( event, ui ) { 
			  this.value = ui.item.label;
			   $("#kpiName_result").val(ui.item.value+" "+ui.item.label);
			   $("#kpiCode").val("");
			   
			   $("#kpiCode_hidden").val(ui.item.value);
			   $("#kpiName_hidden").val(ui.item.label); 
		      return false;
		  },
		  open: function() {
		    $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
		  },
		  close: function() {
		    $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
		  }
		});
	$( "#employeeSelection" ).autocomplete({
		  source: function( request, response ) {
			  var position_value=$("#positionElement").val();
				var department_value=$("#departmentElement").val();
				var where_query="";
				var haveWhere=false;
				if(department_value!='all'){
					if(haveWhere)
						where_query=where_query+" and department_code ='"+department_value+"'";
					else
						where_query=where_query+" where department_code ='"+department_value+"'";
					haveWhere=true;
				}
				if(position_value!='all'){
					if(haveWhere)
						where_query=where_query+" and position_code ='"+position_value+"'";
					else
						where_query=where_query+" where position_code ='"+position_value+"'";
					haveWhere=true;
				}
			  var query="select * from (select distinct employee_code, concat(employee_name,' ',employee_surname) " +
				" as emp_name ,department_code,position_code from "+SCHEMA_G+".employee  "+where_query+" order by emp_name "+
				") as xx where emp_name like '%"+request.term+"%'";
			  
				KPIAjax.listMaster(query,{
					callback:function(data){
						 
						if(data!=null && data.length>0){
							response( $.map( data, function( item ) {
					          return {
					        	  label: item.name,
					        	  value: item.id 
					          }
					        }));
						}else{
							var xx=[]; 
							response( $.map(xx));
						}
					}
			 });
		  
		  },
		  minLength: 2,
		  select: function( event, ui ) { 
			  this.value = ui.item.label;
			  $("#employeeElement").val(ui.item.value);
		      return false;
		  },
		  open: function() {
		    $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
		  },
		  close: function() {
		    $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
		  }
		}); 
	$( "#kpiCode2" ).autocomplete({
		  source: function( request, response ) { 
				var query="SELECT kpi_code,kpi_name FROM "+SCHEMA_G+".kpi where kpi_code like '%"+request.term+"%'";// and etl_flag = 'Y' ";		      
				KPIAjax.searchObject(query,{
					callback:function(data){ 
						if(data!=null && data.length>0){
							response( $.map( data, function( item ) {
					          return {
					        	  label: item[0],
					        	  value: item[1] 
					          }
					        }));
						}else{
							var xx=[]; 
							response( $.map(xx));
						}
					}
			 });		  
		  },
		  minLength: 2,
		  select: function( event, ui ) { 
			  this.value = ui.item.label;
			  $("#kpiName_result2").val(ui.item.label+" "+ui.item.value);
			  $("#kpiName2").val("");
			  
			  $("#kpiCode_hidden2").val(ui.item.label);
			  $("#kpiName_hidden2").val(ui.item.value); 
			 
		      return false;
		  },
		  open: function() {
		    $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
		  },
		  close: function() {
		    $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
		  }
		}); 
	$( "#kpiName2" ).autocomplete({
		  source: function( request, response ) { 
				var query="SELECT kpi_code,kpi_name FROM "+SCHEMA_G+".kpi where kpi_name like '%"+request.term+"%' ";// and etl_flag = 'Y' ";		      
				KPIAjax.searchObject(query,{
					callback:function(data){ 
						if(data!=null && data.length>0){
							response( $.map( data, function( item ) {
					          return {
					        	  label: item[1],
					        	  value: item[0] 
					          }
					        }));
						}else{
							var xx=[]; 
							response( $.map(xx));
						}
					}
			 });		  
		  },
		  minLength: 2,
		  select: function( event, ui ) { 
			  this.value = ui.item.label;
			   $("#kpiName_result2").val(ui.item.value+" "+ui.item.label);
			   $("#kpiCode2").val("");
			   
			   $("#kpiCode_hidden2").val(ui.item.value);
			   $("#kpiName_hidden2").val(ui.item.label); 
		      return false;
		  },
		  open: function() {
		    $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
		  },
		  close: function() {
		    $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
		  }
		});
	if ($.browser.msie){
		 $('#employeeSelection').focus(); 
		}
	//distplayKPI();
}); 

function listYear(){

	var query="SELECT distinct result.year FROM "+SCHEMA_G+".period result order by result.year desc ";
	KPIAjax.listYears(query,{
		callback:function(data){
			//alert(data);
			  // var str="<select id=\"yearElement\" style=\"width: 75px\" onchange=\"listDepartment()\">";
			   var str="<select id=\"yearElement\" style=\"width: 75px\" onchange=\"listPeriod()\">";
			  // str=str+"<option value=\"all\">All</option>";
			if(data!=null && data.length>0){ 
				for(var i=0;i<data.length;i++){
					str=str+"<option value=\""+data[i]+"\">"+data[i]+"</option>";
				}  
			}
			str=str+"</select>";
			$("#yearSelection").html(str); 
			listPeriod();
		}
    });
}
function listPeriod(){
	 var year=$("#yearElement").val();
	 var period_query="";
		if(year!='all'){
			period_query=" where year=" +year;
		}
		 
	var query="select period_no,period_desc  from "+SCHEMA_G+".period "+period_query;
	//" order by department_name";
	KPIAjax.listMaster(query,{
		callback:function(data){
			//alert(data);
			 var str="<select id=\"periodElement\">";
			 //   str=str+"<option value=\"all\">All</option>";
			if(data!=null && data.length>0){ 
				for(var i=0;i<data.length;i++){
					str=str+"<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
				}
			} 
			str=str+"</select>";
			$("#periodSelection").html(str); 
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
			var str="<select id=\"departmentElement\" onchange=\"listPosition()\">";
			// str=str+"<option value=\"all\">All</option>";
			if(data!=null && data.length>0){ 
				for(var i=0;i<data.length;i++){
					str=str+"<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
				} 
			}
			str=str+"</select>";
			$("#departmentSelection").html(str);
			listPosition(); 
		}
    });
}
function listPosition(){
	var department_value=$("#departmentElement").val();
	//alert(department_value)
	var department_code_query="";
	if(department_value!='all'){
		department_code_query=" where department_code ='"+department_value+"'";
	}
	 var query="select distinct position_code, position_name  from "+SCHEMA_G+".employee" +
	 		department_code_query+"   order by position_name";
	KPIAjax.listMaster(query,{
		callback:function(data){
			//alert(data);
			//var str="<select id=\"positionElement\" onchange=\"listEmployee()\">";
			var str="<select id=\"positionElement\"    onchange=\"clearEmployee()\">";
			str=str+"<option value=\"all\">All</option>";
			if(data!=null && data.length>0){ 
				for(var i=0;i<data.length;i++){
					str=str+"<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
				} 
			}
			str=str+"</select>";
			$("#positionSelection").html(str);
			clearEmployee(); 
		}
    });
}
function clearEmployee(){
	$("#employeeElement").val("");
	$("#employeeSelection").val("");
} 
function distplayKPI(){  
			//alert(data);  
				var str="<div align=\"left\" style=\"padding-bottom: 4px;width:1070px\"> <a class=\"btn\" onclick=\"showForm('dataTable')\"><i class=\"icon-plus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Add KPI</span></a>"+
					"<span  style=\"padding-left: 4px\"><a class=\"btn\" onclick=\"deleteRow('dataTable')\"><i class=\"icon-minus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Delete KPI</span></a></span></div>";
					
				    str=str+"<table id=\"dataTable\" class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px\">"+
		    		"<thead>"+
		    		"<tr> "+ 
		    		"<th width=\"5%\"><div class=\"th_class\"><input type=\"checkbox\"  name=\"chkAll\" onClick=\"togleChk(this,'chk_input')\"/></div></th>"+
         		"<th width=\"10%\"><div class=\"th_class\">KPI Order</div></th>"+
         		"<th width=\"35%\"><div class=\"th_class\">KPI Name</div></th>"+
         		"<th width=\"10%\"><div class=\"th_class\">KPI Weight</div></th>"+ 
         		"<th width=\"20%\"><div class=\"th_class\">Target Data</div></th>"+
         		"<th width=\"20%\"><div class=\"th_class\">Target Score</div></th>"+ 
         		
       		"</tr>"+
     	"</thead>"+
     	"<tbody>";
	        	
				/* for(var i=0;i<data.length;i++){  
						str=str+
					"<tr style=\"cursor: pointer;\">"+ 
					"<td style=\"text-align: center;\">"+
					"<input type=\"checkbox\"  name=\"chk\"/>"+
	          		"<input type=\"hidden\" name=\"year_input\" value=\""+data[i][0]+"\" />"+
	          		"<input type=\"hidden\" name=\"period_no_input\" value=\""+data[i][1]+"\" />"+
	          		"<input type=\"hidden\" name=\"employee_code_input\" value=\""+data[i][3]+"\" />"+
	          		"<input type=\"hidden\" name=\"kpi_code_input\" value=\""+data[i][5]+"\" />"+ 
	          		"<input type=\"hidden\" name=\"kpi_result_id\" value=\""+data[i][0]+"_"+data[i][1]+"_"+data[i][3]+"_"+data[i][5]+"\" />"+
	          		 
	          		"</td>"+
	            	"<td style=\"text-align: left;\">"+data[i][3]+"</td>"+
	            	"<td>"+data[i][4]+"</td> "+
	            	"<td style=\"text-align: left;\">"+data[i][5]+"</td>"+
	            	"<td>"+data[i][6]+"</td> "+
	            	"<td>"+data[i][6]+"</td> "+
	            	
	          		"</tr>  ";
				} */
				 
			 
			str=str+"</tbody> </table>";
			
			$("#employee_section").html(str);
			$("#dialog-Message2").slideUp("slow");
			$("#dialog-Message3").slideUp("slow");
			$("#dialog-Message4").slideUp("slow"); 
			$("#dialog-Message").slideDown("slow"); 
}  
function distplayKPI2(){
		 var year=jQuery.trim($("#yearElement").val());
		 var periodNo=jQuery.trim($("#periodElement").val());
		 var department_code=jQuery.trim($("#departmentElement").val());
		 var position_code=jQuery.trim($("#positionElement option:selected").text());
		 var employee_code=jQuery.trim($("#employeeElement").val());
		 var employee_name=jQuery.trim($("#employeeSelection").val()); 
		 
		 if(periodNo=='all' ){
			 alert("Please select Period.");
			 return false;
		 }
		 if(department_code=='all' ){
			 alert("Please select Department.");
			 return false;
		 }
			 
		/*  var etl_flag='N';
		 var approved_flag='0';  */
		  
		 var approveKPIWhere=""; 
		 var haveWhere=false;
		// alert(jQuery.trim(employee_name).length)
		  if(jQuery.trim(employee_name).length==0){
			 employee_code='';
		 }   
		  if(employee_code=='' ){
				 alert("Please fill Employee.");
				 return false;
			 }
		if(year.length>0){		
			if(haveWhere)
				approveKPIWhere=approveKPIWhere+" and result.year ="+year+"";
			else
				approveKPIWhere=approveKPIWhere+" where result.year ="+year+"";
			haveWhere=true;
		}
		if(periodNo.length>0 && periodNo!='all'){		
			if(haveWhere)
				approveKPIWhere=approveKPIWhere+" and result.period_no="+periodNo+"";
			else
				approveKPIWhere=approveKPIWhere+" where result.period_no="+periodNo+"";
			haveWhere=true;
		}
		if(department_code.length>0 && department_code!='all'){		
			if(haveWhere)
				approveKPIWhere=approveKPIWhere+" and em.department_code ='"+department_code+"'";
			else
				approveKPIWhere=approveKPIWhere+" where em.department_code = '"+department_code+"'";
			haveWhere=true;
		}
		if(position_code.length>0 && position_code!='All'){		
			if(haveWhere)
				approveKPIWhere=approveKPIWhere+" and em.position_name ='"+position_code+"'";
			else
				approveKPIWhere=approveKPIWhere+" where em.position_name = '"+position_code+"'";
			haveWhere=true;
		}
		if(employee_code.length>0){		
			if(haveWhere)
				approveKPIWhere=approveKPIWhere+" and em.employee_code='"+employee_code+"'";
			else
				approveKPIWhere=approveKPIWhere+" where em.employee_code ='"+employee_code+"'";
			haveWhere=true;
		}
		if(employee_name.length>0){
			if(haveWhere)
				approveKPIWhere=approveKPIWhere+" and  concat(em.employee_name,' ',em.employee_surname)='"+employee_name+"' ";
			else
				approveKPIWhere=approveKPIWhere+" where  concat(em.employee_name,' ',em.employee_surname)='"+employee_name+"' ";
			haveWhere=true;
		}
		
		var query ="select result.year,result.period_no,p.period_desc,result.employee_code" +
						"	,concat(em.employee_name,' ',em.employee_surname) as emp_name , result.kpi_code ,kpi.kpi_name " +
						"  ,result.target_score,result.actual_score,result.kpi_order,result.kpi_weight,result.target_data,result.target_score , kpi.etl_flag from "+SCHEMA_G+".kpi_result result inner join "+SCHEMA_G+".kpi kpi " +
						" on result.kpi_code=kpi.kpi_code inner join	"+SCHEMA_G+".employee em on result.employee_code=em.employee_code  inner join "+SCHEMA_G+".period p  on" +
						//" (result.period_no=p.period_no and result.year =p.year) "+approveKPIWhere +" order by em.employee_code, kpi.kpi_code,result.kpi_order";
						" (result.period_no=p.period_no and result.year =p.year) "+approveKPIWhere +" order by em.employee_code,  result.kpi_order";
		
		KPIAjax.searchObject(query,{ 
		callback:function(data){
			//alert(data); 
			if(data!=null && data.length>0){
				
				//var str="<div align=\"left\" style=\"padding-bottom: 4px;width:1070px\"> <a class=\"btn\" onclick=\"showForm('dataTable')\"><i class=\"icon-plus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Add KPI</span></a>"+
				//var str="<span  style=\"padding-left: 4px\"><a class=\"btn\" onclick=\"deleteRow('dataTable')\"><i class=\"icon-minus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Delete KPI</span></a></span></div>";
				var str="<div align=\"left\" style=\"padding-bottom: 4px\">"+
					"<span><a class=\"btn\" onclick=\"showForm3('add','"+year+"','"+periodNo+"','"+employee_code+"')\"\"><i class=\"icon-plus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Add KPI</span></a></span>"+
					//"<span  style=\"padding-left: 4px\"><a class=\"btn\" onclick=\"deleteRow('dataTable2')\"><i class=\"icon-minus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Delete KPI</span></a></span></div>";
					"</div>";
				str=str+"<table id=\"dataTable2\" class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px\">"+
		    		"<thead>"+
		    		"<tr> "+  
		    		//"<th width=\"4%\"><div class=\"th_class\"><input type=\"checkbox\"  name=\"chkAll3\" onClick=\"togleChk(this,'chk_input2')\"/></div></th>"+
		    		"<th width=\"9%\"><div class=\"th_class\">Employee Code</div></th>"+
	         		"<th width=\"18%\"><div class=\"th_class\">Employee Name</div></th>"+
	         		"<th width=\"7%\"><div class=\"th_class\">KPI Order</div></th>"+ 
	         		"<th width=\"7%\"><div class=\"th_class\">KPI Code</div></th>"+ 
	         		"<th width=\"22%\"><div class=\"th_class\">KPI Name</div></th>"+ 
	         		"<th width=\"7%\"><div class=\"th_class\">KPI Weight</div></th>"+ 
	         		"<th width=\"9%\"><div class=\"th_class\">Target Data</div></th>"+
	         		"<th width=\"9%\"><div class=\"th_class\">Target Score</div></th>"+ 
	         		"<th width=\"2%\"><div class=\"th_class\"></div></th>"+
         		
       		"</tr>"+
     	"</thead>"+
     	"<tbody>";
	        	
				for(var i=0;i<data.length;i++){  
					 var kpi_order_inner=data[i][9];
		            	var kpi_weight_inner=data[i][10];
		            	var target_data_inner=data[i][11];
		            	var target_score_inner=data[i][12];
				
		            	
		            	    
		         		
						str=str+
					"<tr style=\"cursor: pointer;\">"+ 
					/* "<td style=\"text-align: center;\">"+
					"<input type=\"checkbox\"  name=\"chk_input2\" value=\""+data[i][0]+"|"+data[i][1]+"|"+data[i][3]+"|"+data[i][5]+"\" />"+
	          		"<input type=\"hidden\" name=\"year_input\" value=\""+data[i][0]+"\" />"+
	          		"<input type=\"hidden\" name=\"period_no_input\" value=\""+data[i][1]+"\" />"+
	          		"<input type=\"hidden\" name=\"employee_code_input\" value=\""+data[i][3]+"\" />"+
	          		"<input type=\"hidden\" name=\"kpi_code_input\" value=\""+data[i][5]+"\" />"+ 
	          		"<input type=\"hidden\" name=\"kpi_result_id\" value=\""+data[i][0]+"_"+data[i][1]+"_"+data[i][3]+"_"+data[i][5]+"\" />"+
	          		"<input type=\"hidden\" name=\"kpiCode_add2\" value=\""+data[i][5]+"\" />"+
	          		"</td>"+ */
	            	"<td style=\"text-align: left;\">"+
	            	"<input type=\"hidden\" name=\"year_input\" value=\""+data[i][0]+"\" />"+
	          		"<input type=\"hidden\" name=\"period_no_input\" value=\""+data[i][1]+"\" />"+
	          		"<input type=\"hidden\" name=\"employee_code_input\" value=\""+data[i][3]+"\" />"+
	          		"<input type=\"hidden\" name=\"kpi_code_input\" value=\""+data[i][5]+"\" />"+ 
	          		"<input type=\"hidden\" name=\"kpi_result_id\" value=\""+data[i][0]+"_"+data[i][1]+"_"+data[i][3]+"_"+data[i][5]+"\" />"+
	          		"<input type=\"hidden\" name=\"kpiCode_add2\" value=\""+data[i][5]+"\" />"+
	          		"<input type=\"hidden\" name=\"etl_flag2\" value=\""+data[i][13]+"\" />"+
	          		
	            	data[i][3]+"</td>"+
	            	"<td>"+data[i][4]+"</td> "+
	            	"<td style=\"text-align: left;\"><input type=\"text\"  name=\"kpiOrder2\"  value=\""+kpi_order_inner+"\" class=\"input_kpi\" style=\"width:30px;height: 20px;line-height: 20px;\"/></td>"+
	            	"<td style=\"text-align: left;\">"+data[i][5]+"</td>"+
	            	"<td style=\"text-align: left;\">"+data[i][6]+"</td>"+
	            	"<td style=\"text-align: left;\"><input type=\"text\"  name=\"kpiWeight2\"  value=\""+kpi_weight_inner+"\" class=\"input_kpi\" style=\"width:130px;height: 20px;line-height: 20px;\"/></td>"+
	            	"<td style=\"text-align: left;\"><input type=\"text\"  name=\"targetData2\"   value=\""+target_data_inner+"\" class=\"input_kpi\" style=\"width:130px;height: 20px;line-height: 20px;\"/></td>"+
	            	"<td style=\"text-align: left;\"><input type=\"text\"  name=\"targetScore2\" value=\""+target_score_inner+"\"  class=\"input_kpi\" style=\"width:130px;height: 20px;line-height: 20px;\"/></td>"+
	            	  "<td>"+
	            	//result.kpi_order,result.kpi_weight,result.target_data,result.target_score
	       		 
	            	// " <i title=\"Add KPI\" onclick=\"showForm2('add','"+data[i][0]+"','"+data[i][1]+"','"+data[i][3]+"','"+data[i][5]+"','"+kpi_order_inner+"','"+kpi_weight_inner+"','"+target_data_inner+"','"+target_score_inner+"')\" style=\"cursor: pointer;\" class=\"icon-plus\"></i>&nbsp;&nbsp;"+
	          		// " <i title=\"Edit KPI\" onclick=\"showForm2('edit','"+data[i][0]+"','"+data[i][1]+"','"+data[i][3]+"','"+data[i][5]+"','"+kpi_order_inner+"','"+kpi_weight_inner+"','"+target_data_inner+"','"+target_score_inner+"')\" style=\"cursor: pointer;\" class=\"icon-edit\"></i>&nbsp;&nbsp;"+
	          		 "    	<i title=\"Delete KPI\" onclick=\"confirmDelete('"+data[i][0]+"','"+data[i][1]+"','"+data[i][3]+"','"+data[i][5]+"')\" style=\"cursor: pointer;\" class=\"icon-trash\"></i>"+
	            	"</td> "+ 
	            	
	          		"</tr>  ";
				}
				/* str=str+"</tbody> </table>";
				
				$("#employee_section").html(str);  
				$("#dialog-Message").slideDown("slow"); */
				$("#assign_kpi_section2").slideDown("slow");
			}else{
			   // $("#dialog-Message").slideUp("slow");
			   //str="<div align=\"left\" style=\"padding-bottom: 4px\"> <a class=\"btn\" onclick=\"showForm('add')\"><i class=\"icon-plus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Add KPI</span></a></div>";
			//   str=str+"<div align=\"left\" style=\"padding-bottom: 4px;width:1070px\"> <a class=\"btn\" onclick=\"showForm('add')\"><i class=\"icon-minus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Delete KPI</span></a></div>";
			  
			str="<table id=\"dataTable2\" class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px;width:1070px\">"+
	    		"<thead>"+
	    		"<tr> "+
      			"<th colspan=\"5\" width=\"100%\"><div class=\"th_class\">No Data</div></th>"+ 
      		"</tr>"+
    	"</thead>"+
    	"<tbody>";  
    	$("#assign_kpi_section2").slideUp("slow"); 
			//	$("#approve_section").html("");  
		 
			}
			str=str+"</tbody> </table>";
			
			$("#employee_section2").html(str);  
			$("#dialog-Message").slideUp("slow");
			$("#dialog-Message3").slideUp("slow");
			$("#dialog-Message4").slideUp("slow");  
			$("#dialog-Message2").slideDown("slow");
			
			 
		}
			
});		 
}  
function distplayKPI3(){
	 var year=jQuery.trim($("#yearElement").val());
	 var periodNo=jQuery.trim($("#periodElement").val());
	 var department_code=jQuery.trim($("#departmentElement").val());
	 var position_code=jQuery.trim($("#positionElement option:selected").text());
	 var employee_code=jQuery.trim($("#employeeElement").val());
	 var employee_name=jQuery.trim($("#employeeSelection").val()); 
	 
	 if(periodNo=='all' ){
		 alert("Please select Period.");
		 return false;
	 }
	 if(department_code=='all' ){
		 alert("Please select Department.");
		 return false;
	 }
		 
	/*  var etl_flag='N';
	 var approved_flag='0';  */
	  
	 var approveKPIWhere=""; 
	 var haveWhere=false;
	// alert(jQuery.trim(employee_name).length)
	  if(jQuery.trim(employee_name).length==0){
		 employee_code='';
	 }   
	if(year.length>0){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and result.year ="+year+"";
		else
			approveKPIWhere=approveKPIWhere+" where result.year ="+year+"";
		haveWhere=true;
	}
	if(periodNo.length>0 && periodNo!='all'){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and result.period_no="+periodNo+"";
		else
			approveKPIWhere=approveKPIWhere+" where result.period_no="+periodNo+"";
		haveWhere=true;
	}
	if(department_code.length>0 && department_code!='all'){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and em.department_code ='"+department_code+"'";
		else
			approveKPIWhere=approveKPIWhere+" where em.department_code = '"+department_code+"'";
		haveWhere=true;
	}
	if(position_code.length>0 && position_code!='All'){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and em.position_name ='"+position_code+"'";
		else
			approveKPIWhere=approveKPIWhere+" where em.position_name = '"+position_code+"'";
		haveWhere=true;
	}
	if(employee_code.length>0){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and em.employee_code='"+employee_code+"'";
		else
			approveKPIWhere=approveKPIWhere+" where em.employee_code ='"+employee_code+"'";
		haveWhere=true;
	}
	if(employee_name.length>0){
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and  concat(em.employee_name,' ',em.employee_surname)='"+employee_name+"' ";
		else
			approveKPIWhere=approveKPIWhere+" where  concat(em.employee_name,' ',em.employee_surname)='"+employee_name+"' ";
		haveWhere=true;
	}
	
	var query ="select result.year,result.period_no,p.period_desc,result.employee_code" +
					"	,concat(em.employee_name,' ',em.employee_surname) as emp_name , result.kpi_code ,kpi.kpi_name " +
					"  ,result.target_score,result.actual_score,result.kpi_order,result.kpi_weight,result.target_data,result.target_score from "+SCHEMA_G+".kpi_result result inner join "+SCHEMA_G+".kpi kpi " +
					" on result.kpi_code=kpi.kpi_code inner join	"+SCHEMA_G+".employee em on result.employee_code=em.employee_code  inner join "+SCHEMA_G+".period p  on" +
					//" (result.period_no=p.period_no and result.year =p.year) "+approveKPIWhere +" order by em.employee_code, kpi.kpi_code,result.kpi_order";
					" (result.period_no=p.period_no and result.year =p.year) "+approveKPIWhere +" order by em.employee_code,result.kpi_order";
	
	KPIAjax.searchObject(query,{ 
//KPIAjax.searchKPI(year,  periodNo,employeeCode, etl_flag, approved_flag,{
	callback:function(data){
		//alert(data); 
		if(data!=null && data.length>0){
			//var str="<div align=\"left\" style=\"padding-bottom: 4px;width:1070px\"> <a class=\"btn\" onclick=\"showForm('dataTable')\"><i class=\"icon-plus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Add KPI</span></a>"+
			//var str="<span  style=\"padding-left: 4px\"><a class=\"btn\" onclick=\"deleteRow('dataTable')\"><i class=\"icon-minus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Delete KPI</span></a></span></div>";
			var str="<div align=\"left\" style=\"padding-bottom: 4px\"><span><a class=\"btn\" onclick=\"deleteRow('dataTable3')\"><i class=\"icon-minus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Delete KPI</span></a></span></div>";
			str=str+"<table id=\"dataTable3\" class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px\">"+
	    		"<thead>"+
	    		"<tr> "+  
	    		"<th width=\"5%\"><div class=\"th_class\"><input type=\"checkbox\"  name=\"chkAll2\" onClick=\"togleChk(this,'chk')\"/></div></th>"+
	    		"<th width=\"10%\"><div class=\"th_class\">Employee Code</div></th>"+
        		"<th width=\"29%\"><div class=\"th_class\">Employee Name</div></th>"+
        		"<th width=\"7%\"><div class=\"th_class\">KPI Order</div></th>"+
        		"<th width=\"7%\"><div class=\"th_class\">KPI Weight</div></th>"+ 
        		"<th width=\"7%\"><div class=\"th_class\">KPI Code</div></th>"+ 
        		"<th width=\"35%\"><div class=\"th_class\">KPI Name</div></th>"+ 
        	//	"<th width=\"5%\"><div class=\"th_class\"></div></th>"+
    		
  		"</tr>"+
	"</thead>"+
	"<tbody>";
       	
			for(var i=0;i<data.length;i++){  
				 var kpi_order_inner=data[i][9];
	            	var kpi_weight_inner=data[i][10];
	            	var target_data_inner=data[i][11];
	            	var target_score_inner=data[i][12];
			
					str=str+
				"<tr style=\"cursor: pointer;\">"+ 
				"<td style=\"text-align: center;\">"+
				"<input type=\"checkbox\"  name=\"chk\" value=\""+data[i][0]+"|"+data[i][1]+"|"+data[i][3]+"|"+data[i][5]+"\" />"+
         		"<input type=\"hidden\" name=\"year_input\" value=\""+data[i][0]+"\" />"+
         		"<input type=\"hidden\" name=\"period_no_input\" value=\""+data[i][1]+"\" />"+
         		"<input type=\"hidden\" name=\"employee_code_input\" value=\""+data[i][3]+"\" />"+
         		"<input type=\"hidden\" name=\"kpi_code_input\" value=\""+data[i][5]+"\" />"+ 
         		"<input type=\"hidden\" name=\"kpi_result_id\" value=\""+data[i][0]+"_"+data[i][1]+"_"+data[i][3]+"_"+data[i][5]+"\" />"+
         		
         		"</td>"+
           	"<td style=\"text-align: left;\">"+data[i][3]+"</td>"+
           	"<td>"+data[i][4]+"</td> "+
           	"<td style=\"text-align: left;\">"+kpi_order_inner+"</td>"+
           	"<td style=\"text-align: left;\">"+kpi_weight_inner+"</td>"+
           	"<td style=\"text-align: left;\">"+data[i][5]+"</td>"+
           	"<td>"+data[i][6]+"</td> "+
         /*   	"<td>"+
           	//result.kpi_order,result.kpi_weight,result.target_data,result.target_score
      		 
           	 " <i title=\"Add KPI\" onclick=\"showForm2('add','"+data[i][0]+"','"+data[i][1]+"','"+data[i][3]+"','"+data[i][5]+"','"+kpi_order_inner+"','"+kpi_weight_inner+"','"+target_data_inner+"','"+target_score_inner+"')\" style=\"cursor: pointer;\" class=\"icon-plus\"></i>&nbsp;&nbsp;"+
         		 " <i title=\"Edit KPI\" onclick=\"showForm2('edit','"+data[i][0]+"','"+data[i][1]+"','"+data[i][3]+"','"+data[i][5]+"','"+kpi_order_inner+"','"+kpi_weight_inner+"','"+target_data_inner+"','"+target_score_inner+"')\" style=\"cursor: pointer;\" class=\"icon-edit\"></i>&nbsp;&nbsp;"+
         		
           	"</td> "+ */
           	
         		"</tr>  ";
			}
			/* str=str+"</tbody> </table>";
			
			$("#employee_section").html(str);  
			$("#dialog-Message").slideDown("slow"); */
		}else{
		   // $("#dialog-Message").slideUp("slow");
		   //str="<div align=\"left\" style=\"padding-bottom: 4px\"> <a class=\"btn\" onclick=\"showForm('add')\"><i class=\"icon-plus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Add KPI</span></a></div>";
		//   str=str+"<div align=\"left\" style=\"padding-bottom: 4px;width:1070px\"> <a class=\"btn\" onclick=\"showForm('add')\"><i class=\"icon-minus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Delete KPI</span></a></div>";
		  
		str="<table id=\"dataTable3\" class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px;width:1070px\">"+
   		"<thead>"+
   		"<tr> "+
 			"<th colspan=\"5\" width=\"100%\"><div class=\"th_class\">No Data</div></th>"+ 
 		"</tr>"+
	"</thead>"+
	"<tbody>";  
			
		//	$("#approve_section").html("");  
	 
		}
		str=str+"</tbody> </table>";
		
		$("#employee_section3").html(str);  
		$("#dialog-Message").slideUp("slow");
		$("#dialog-Message2").slideUp("slow");
		$("#dialog-Message4").slideUp("slow");  
		$("#dialog-Message3").slideDown("slow");
		
		 
	}
		
});		 
}  
function distplayKPI4(data){
	/*  var year=jQuery.trim($("#yearElement").val());
	 var periodNo=jQuery.trim($("#periodElement").val());
	 var department_code=jQuery.trim($("#departmentElement").val());
	 var position_code=jQuery.trim($("#positionElement option:selected").text());
	 var employee_code=jQuery.trim($("#employeeElement").val());
	 var employee_name=jQuery.trim($("#employeeSelection").val()); 
	 
	 if(periodNo=='all' ){
		 alert("Please select Period.");
		 return false;
	 }
	 if(department_code=='all' ){
		 alert("Please select Department.");
		 return false;
	 }
		 
	 var approveKPIWhere=""; 
	 var haveWhere=false;
	// alert(jQuery.trim(employee_name).length)
	  if(jQuery.trim(employee_name).length==0){
		 employee_code='';
	 }   
	  if(employee_code=='' ){
			 alert("Please fill Employee.");
			 return false;
		 }
	if(year.length>0){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and result.year ="+year+"";
		else
			approveKPIWhere=approveKPIWhere+" where result.year ="+year+"";
		haveWhere=true;
	}
	if(periodNo.length>0 && periodNo!='all'){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and result.period_no="+periodNo+"";
		else
			approveKPIWhere=approveKPIWhere+" where result.period_no="+periodNo+"";
		haveWhere=true;
	}
	if(department_code.length>0 && department_code!='all'){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and em.department_code ='"+department_code+"'";
		else
			approveKPIWhere=approveKPIWhere+" where em.department_code = '"+department_code+"'";
		haveWhere=true;
	}
	if(position_code.length>0 && position_code!='All'){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and em.position_name ='"+position_code+"'";
		else
			approveKPIWhere=approveKPIWhere+" where em.position_name = '"+position_code+"'";
		haveWhere=true;
	}
	if(employee_code.length>0){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and em.employee_code='"+employee_code+"'";
		else
			approveKPIWhere=approveKPIWhere+" where em.employee_code ='"+employee_code+"'";
		haveWhere=true;
	}
	if(employee_name.length>0){
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and  concat(em.employee_name,' ',em.employee_surname)='"+employee_name+"' ";
		else
			approveKPIWhere=approveKPIWhere+" where  concat(em.employee_name,' ',em.employee_surname)='"+employee_name+"' ";
		haveWhere=true;
	}
	
	var query ="select result.year,result.period_no,p.period_desc,result.employee_code" +
					"	,concat(em.employee_name,' ',em.employee_surname) as emp_name , result.kpi_code ,kpi.kpi_name " +
					"  ,result.target_score,result.actual_score,result.kpi_order,result.kpi_weight,result.target_data,result.target_score from "+SCHEMA_G+".kpi_result result inner join "+SCHEMA_G+".kpi kpi " +
					" on result.kpi_code=kpi.kpi_code inner join	"+SCHEMA_G+".employee em on result.employee_code=em.employee_code  inner join "+SCHEMA_G+".period p  on" +
					" (result.period_no=p.period_no and result.year =p.year) "+approveKPIWhere +" order by em.employee_code, kpi.kpi_code";
	
	KPIAjax.searchObject(query,{ 
	callback:function(data){ */
		 var str="";
		if(data!=null && data.length>0){
			
			//var str="<div align=\"left\" style=\"padding-bottom: 4px;width:1070px\"> <a class=\"btn\" onclick=\"showForm('dataTable')\"><i class=\"icon-plus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Add KPI</span></a>"+
			//var str="<span  style=\"padding-left: 4px\"><a class=\"btn\" onclick=\"deleteRow('dataTable')\"><i class=\"icon-minus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Delete KPI</span></a></span></div>";
			 str="<table id=\"dataTable4\" class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px\">"+
	    		"<thead>"+
	    		"<tr> "+  
	    		"<th width=\"9%\"><div class=\"th_class\">Employee Code</div></th>"+
        		"<th width=\"18%\"><div class=\"th_class\">Employee Name</div></th>"+
        		"<th width=\"7%\"><div class=\"th_class\">KPI Order</div></th>"+ 
        		"<th width=\"7%\"><div class=\"th_class\">KPI Code</div></th>"+ 
        		"<th width=\"20%\"><div class=\"th_class\">KPI Name</div></th>"+ 
        		"<th width=\"7%\"><div class=\"th_class\">KPI Weight</div></th>"+ 
        		"<th width=\"9%\"><div class=\"th_class\">Target Data</div></th>"+
        		"<th width=\"9%\"><div class=\"th_class\">Target Score</div></th>"+ 
        		//"<th width=\"4%\"><div class=\"th_class\"></div></th>"+
    		
  		"</tr>"+
	"</thead>"+
	"<tbody>";
       	
			for(var i=0;i<data.length;i++){  
				 var kpi_order_inner=data[i][9];
	            	var kpi_weight_inner=data[i][10];
	            	var target_data_inner=data[i][11];
	            	var target_score_inner=data[i][12];
			
	            	
	            	    
	         		
					str=str+
				"<tr style=\"cursor: pointer;\">"+ 
				
           	"<td style=\"text-align: left;\">"+data[i][0]+"</td>"+
           	"<td>"+data[i][1]+"</td> "+
           	"<td style=\"text-align: left;\">"+data[i][2]+"</td>"+
           	"<td style=\"text-align: left;\">"+data[i][3]+"</td>"+
           	"<td style=\"text-align: left;\">"+data[i][4]+"</td>"+
           	"<td style=\"text-align: left;\">"+data[i][5]+"</td>"+
           	"<td style=\"text-align: left;\">"+data[i][6]+"</td>"+
           	"<td style=\"text-align: left;\">"+data[i][7]+"</td>"+
           	/* "<td>"+
           	//result.kpi_order,result.kpi_weight,result.target_data,result.target_score
      		 
           	 " <i title=\"Add KPI\" onclick=\"showForm2('add','"+data[i][0]+"','"+data[i][1]+"','"+data[i][3]+"','"+data[i][5]+"','"+kpi_order_inner+"','"+kpi_weight_inner+"','"+target_data_inner+"','"+target_score_inner+"')\" style=\"cursor: pointer;\" class=\"icon-plus\"></i>&nbsp;&nbsp;"+
         		 " <i title=\"Edit KPI\" onclick=\"showForm2('edit','"+data[i][0]+"','"+data[i][1]+"','"+data[i][3]+"','"+data[i][5]+"','"+kpi_order_inner+"','"+kpi_weight_inner+"','"+target_data_inner+"','"+target_score_inner+"')\" style=\"cursor: pointer;\" class=\"icon-edit\"></i>&nbsp;&nbsp;"+
         		
           	"</td> "+ */
           	
         		"</tr>  ";
			}
			/* str=str+"</tbody> </table>";
			
			$("#employee_section").html(str);  
			$("#dialog-Message").slideDown("slow"); */
			$("#assign_kpi_section4").slideDown("slow");
		}else{
		   // $("#dialog-Message").slideUp("slow");
		   //str="<div align=\"left\" style=\"padding-bottom: 4px\"> <a class=\"btn\" onclick=\"showForm('add')\"><i class=\"icon-plus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Add KPI</span></a></div>";
		//   str=str+"<div align=\"left\" style=\"padding-bottom: 4px;width:1070px\"> <a class=\"btn\" onclick=\"showForm('add')\"><i class=\"icon-minus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Delete KPI</span></a></div>";
		  
		str="<table id=\"dataTable4\" class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px;width:1070px\">"+
   		"<thead>"+
   		"<tr> "+
 			"<th colspan=\"5\" width=\"100%\"><div class=\"th_class\">No Data Inserted</div></th>"+ 
 		"</tr>"+
	"</thead>"+
	"<tbody>";  
	$("#assign_kpi_section4").slideUp("slow"); 
		//	$("#approve_section").html("");  
	 
		}
		str=str+"</tbody> </table>";
		
		$("#employee_section4").html(str);  
		$("#dialog-Message").slideUp("slow");
		$("#dialog-Message3").slideUp("slow");  
		$("#dialog-Message2").slideUp("slow");
		$("#dialog-Message4").slideDown("slow");
		
		 
/* 	}
		
});	 */	 
}  
function showForm2(mode,year_input,period_no_input,employee_code_input,kpi_code_input,kpi_order_input,kpi_weight_input,target_data_input,target_score_input){ 
	//	$("#id_element").show();  
	$("#year_input2").val(year_input);
	$("#period_no_input2").val(period_no_input);
	$("#employee_code_input2").val(employee_code_input);
	$("#kpi_code_input2").val(kpi_code_input);
	
	$("#kpiOrder2").val(""); 
	$("#kpiWeight2").val("");
	$("#targetData2").val("");
	$("#targetScore2").val(""); 
	
	$("#kpiCode2").val(""); 
	$("#kpiName2").val(""); 
	$("#kpiCode_hidden2").val(""); 
	$("#kpiName_hidden2").val(""); 
	$("#kpiName_result2").val(""); 
	    
	$("#mode").val(mode);
		var height=299;	
		$("#form-input").css("display","block");		
		 if(mode=='edit'){
			 height=189;
			 $("#form-input").css("display","none"); 
			 $("#year_input2").val(year_input);
				$("#period_no_input2").val(period_no_input);
				$("#employee_code_input2").val(employee_code_input);
				$("#kpi_code_input2").val(kpi_code_input);
				
					$("#kpiOrder2").val(kpi_order_input); 
					$("#kpiWeight2").val(kpi_weight_input);
					$("#targetData2").val(target_data_input);
					$("#targetScore2").val(target_score_input); 
		 
 		 }
				$( "#dialog-form2" ).dialog({ 
					position: 'top',
					 height: height,
					 width:650,
					modal: true,
					 hide: 'fold',
				     show: 'blind' 
				}); 
			 
}
function showForm3(mode,year_input,period_no_input,employee_code_input){ 
	//	$("#id_element").show();  
	$("#year_input2").val(year_input);
	$("#period_no_input2").val(period_no_input);
	$("#employee_code_input2").val(employee_code_input);
	//$("#kpi_code_input2").val(kpi_code_input);
	
	$("#kpiOrder2").val(""); 
	$("#kpiWeight2").val("");
	$("#targetData2").val("");
	$("#targetScore2").val(""); 
	
	$("#kpiCode2").val(""); 
	$("#kpiName2").val(""); 
	$("#kpiCode_hidden2").val(""); 
	$("#kpiName_hidden2").val(""); 
	$("#kpiName_result2").val(""); 
	    
	$("#mode").val(mode);
		var height=299;	
		$("#form-input").css("display","block");		
		 if(mode=='edit'){
			 height=189;
			 $("#form-input").css("display","none"); 
			 $("#year_input2").val(year_input);
				$("#period_no_input2").val(period_no_input);
				$("#employee_code_input2").val(employee_code_input);
				//$("#kpi_code_input2").val(kpi_code_input);
				
					$("#kpiOrder2").val(kpi_order_input); 
					$("#kpiWeight2").val(kpi_weight_input);
					$("#targetData2").val(target_data_input);
					$("#targetScore2").val(target_score_input); 
		 
 		 }
				$( "#dialog-form2" ).dialog({ 
					position: 'top',
					 height: height,
					 width:650,
					modal: true,
					 hide: 'fold',
				     show: 'blind' 
				}); 
			 
}
function showForm(mode){ 
	//	$("#id_element").show(); 
	 var year=jQuery.trim($("#yearElement").val());
	 var periodNo=jQuery.trim($("#periodElement").val());
	 var department_code=jQuery.trim($("#departmentElement").val());
	 var position_code=jQuery.trim($("#positionElement option:selected").text());
	 var employee_code=jQuery.trim($("#employeeElement").val());
	 var employee_name=jQuery.trim($("#employeeSelection").val()); 
	 
	 if(periodNo=='all' ){
		 alert("Please select Period.");
		 return false;
	 }
	 if(department_code=='all' ){
		 alert("Please select Department.");
		 return false;
	 }
	 
	$("#kpiCode").val("");
	$("#kpiName").val("");
	$("#kpiCode_hidden").val("");
	$("#kpiName_hidden").val("");
	$("#kpiName_result").val("");
	
	$( "#dialog-form" ).dialog({ 
		position: 'top',
		 height: 163,
		 width:650,
		modal: true,
		 hide: 'fold',
	     show: 'blind' 
	}); 
}
function doSubmitAction(){  
	/* alert("doAdd")
	return false; */
	var year_input2 =$("#year_input2").val();
	var period_no_input2 =$("#period_no_input2").val();
	var employee_code_input2 =$("#employee_code_input2").val();
	var kpi_code_input2 =$("#kpiCode_hidden2").val(); 
	var kpiName_hidden2 =$("#kpiName_hidden2").val(); 
	var kpiOrder2=$("#kpiOrder2").val(); 
	var kpiWeight2=$("#kpiWeight2").val();
	var targetData2=$("#targetData2").val();
	var targetScore2=$("#targetScore2").val();  
		var mode=$("#mode").val();
	var queryEtlFlag="SELECT  kpi.etl_flag,kpi_code  FROM "+SCHEMA_G+".kpi kpi where kpi_code='"+kpi_code_input2+"'";
	
		KPIAjax.searchObject(queryEtlFlag,{
			callback:function(data){ 
				addRowManageKPI('dataTable2',kpiName_hidden2,kpi_code_input2,kpiOrder2,kpiWeight2,targetData2,targetScore2,data[0][0]);
			}
		});
		
	/*
		var query="";
		var queryCheckDuplicate="";  
		if(mode=='add'){
				kpi_code_input2=$("#kpiCode_hidden2").val();
				query="insert into "+SCHEMA_G+".kpi_result set approved_flag='0', kpi_order="+kpiOrder2+",kpi_weight="+kpiWeight2+",target_data='"+targetData2+"',target_score="+targetScore2+", created_dt=now(),updated_dt=now()"+
				",year="+year_input2+",period_no="+period_no_input2+",employee_code='"+employee_code_input2+"',kpi_code='"+kpi_code_input2+"'";
				queryCheckDuplicate=" SELECT * FROM "+SCHEMA_G+".kpi_result  where year="+year_input2+" and period_no="+period_no_input2+" and employee_code='"+employee_code_input2+"' and kpi_code='"+kpi_code_input2+"'";
		}else {//edit
			  query="update  "+SCHEMA_G+".kpi_result set approved_flag='0', kpi_order="+kpiOrder2+",kpi_weight="+kpiWeight2+",target_data='"+targetData2+"',target_score="+targetScore2+", updated_dt=now() "+
			  " where year="+year_input2+" and period_no="+period_no_input2+" and employee_code='"+employee_code_input2+"' and kpi_code='"+kpi_code_input2+"'";
		}
		if(queryCheckDuplicate.length>0){
			KPIAjax.searchObject(queryCheckDuplicate,{
				callback:function(data){ 
					 if(data!=null && data.length>0){
							alert("ไม่สามารถเพิ่มข้อมูลได้เนื่องจาก key ซ้ำ ");
					 }else{
						 doSubmit(query);
					 } 
				}
			});
		}else
			doSubmit(query);
		
		*/ 
	}
function doSubmit(query){ 
	KPIAjax.executeQuery(query,{
		callback:function(data){ 
			if(data!=0){					
				showPage('2'); 
				$( "#dialog-form2" ).dialog("close");
			}
		}
	});
		 
}

function doAction(ids,tableID){ 
	 /* alert(tableID)
	 alert(ids.length); */
	if(ids.length>0){
		var whereStr="";
		for(var i=0;i<ids.length;i++){
			var id_array=ids[i].split("|");
			whereStr=whereStr+"( year="+id_array[0]+" and period_no="+id_array[1]+" and employee_code='"+id_array[2]+"' and kpi_code='"+id_array[3]+"' ) ";
			if((i+1)!=ids.length)
				whereStr=whereStr+" or ";
		}
	   //alert(whereStr)	;
	   //return false;
	   var query="delete  FROM "+SCHEMA_G+".kpi_result where "+whereStr;
		KPIAjax.executeQuery(query,{
			callback:function(data){
				if(data==0)
					alert("Can not delete because this record is in use.");
				if(tableID=='dataTable2'){
					showPage('2');
				}else if(tableID=='dataTable3'){
					showPage('3');
				}
				
			}
		}); 
	}
}   
	function doDelete(year_input,period_no_input,employee_code_input,kpi_code_input){ 
	  
	 var whereStr=" year="+year_input+" and period_no="+period_no_input+" and employee_code='"+employee_code_input+"' and kpi_code='"+kpi_code_input+"' ";
	   var query="delete  FROM "+SCHEMA_G+".kpi_result where "+whereStr;
		KPIAjax.executeQuery(query,{
			callback:function(data){
				if(data==0){
					alert("Can not delete because this record is in use.");
				}else
					showPage('2'); 
			}
		}); 
	 
}  
function confirmDelete(id1,id2,id3,id4){
	$( "#dialog-confirmDelete" ).dialog({
		/* height: 140, */
		modal: true,
		buttons: {
			"Yes": function() { 
				$( this ).dialog( "close" );
				$("#mode").val('delete');
				doDelete(id1,id2,id3,id4);
			},
			"No": function() {
				$( this ).dialog( "close" );
				return false;
			}
		}
	});
}
function assignKPI(){
	 var year=jQuery.trim($("#yearElement").val());
	 var periodNo=jQuery.trim($("#periodElement").val());
	 var department_code=jQuery.trim($("#departmentElement").val());
	 var position_code=jQuery.trim($("#positionElement option:selected").text());
	 var employee_code=jQuery.trim($("#employeeElement").val());
	 var employee_name=jQuery.trim($("#employeeSelection").val()); 
	 if(employee_name.length==0)
		 employee_code=""; 
	 
	 var kpiCode_add=document.getElementsByName("kpiCode_add");
	 var kpiOrder=document.getElementsByName("kpiOrder");
	 var kpiWeight=document.getElementsByName("kpiWeight");
	 var targetData=document.getElementsByName("targetData");
	 var targetScore=document.getElementsByName("targetScore");
	 var etl_flag=document.getElementsByName("etl_flag");
	 var sum=0;
	 var isBreak=false;
	 
	 
	 var kpiCode_add_array=[];
	 if(kpiCode_add!=null && kpiCode_add.length>0){
		 for(var i=0;i<kpiCode_add.length;i++){ 
			 kpiCode_add_array.push(jQuery.trim(kpiCode_add[i].value));
		 }
	 }
	 
	 var etl_flag_array=[];
	 if(etl_flag!=null && etl_flag.length>0){
		 for(var i=0;i<etl_flag.length;i++){ 
			 etl_flag_array.push(jQuery.trim(etl_flag[i].value));
		 }
	 }
	 
	 var kpiOrders_array=[];
	 if(kpiOrder!=null && kpiOrder.length>0){
		 for(var i=0;i<kpiOrder.length;i++){
			 var isBank=checkBank(jQuery.trim(kpiOrder[i].value));
			 if(isBank){
				 alert("Please fill Data. kpiOrder");
				 isBreak=true;
				 break;
			 } 
			 var isNumber=checkNumber(jQuery.trim(kpiOrder[i].value));
			 if(isNumber){
				 alert('Please fill Number kpiOrder !!!');  
				 isBreak=true; 
				 break;				 
			 }
			 kpiOrders_array.push(jQuery.trim(kpiOrder[i].value));
		 }
	 }
	 if(isBreak)
		 return false;
	 var kpiWeight_array=[];
	 if(kpiWeight!=null && kpiWeight.length>0){
		 for(var i=0;i<kpiWeight.length;i++){
			 var isBank=checkBank(jQuery.trim(kpiWeight[i].value));
			 if(isBank){
				 alert("Please fill Data. kpiWeight");
				 isBreak=true;
				 break;
			 } 
			 var isNumber=checkNumber(jQuery.trim(kpiWeight[i].value));
			 if(isNumber){
				 alert('Please fill Number kpiWeight !!!');  
				 isBreak=true; 
				 break;
				 
			 }
			 var weigth=parseFloat(kpiWeight[i].value);
			 sum=sum+weigth;
			 kpiWeight_array.push(jQuery.trim(kpiWeight[i].value));
		 }
	 }
	 if(isBreak)
		 return false;
	 
	var targetData_array=[];
	 if(targetData!=null && targetData.length>0){
		 for(var i=0;i<targetData.length;i++){
			 var isBank=checkBank(jQuery.trim(targetData[i].value));
			 if(isBank){
				 alert("Please fill Data. targetData");
				 isBreak=true;
				 break;
			 } 
			 var isNumber=checkNumber(jQuery.trim(targetData[i].value));
			 if(isNumber){
				 alert('Please fill Number targetData!!!');  
				 isBreak=true; 
				 break;
				 
			 }
			 targetData_array.push(jQuery.trim(targetData[i].value));
			 
		 }
	 }
	 if(isBreak)
		 return false;
	 
	 var targetScore_array=[]
	 if(targetScore!=null && targetScore.length>0){
		 for(var i=0;i<targetScore.length;i++){
			 var isBank=checkBank(jQuery.trim(targetScore[i].value));
			 if(isBank){
				 alert("Please fill Data.targetScore");
				 isBreak=true;
				 break;
			 } 
			 var isNumber=checkNumber(jQuery.trim(targetScore[i].value));
			 if(isNumber){
				 alert('Please fill Number targetScore!!!');  
				 isBreak=true; 
				 break;
				 
			 } 
			 targetScore_array.push(jQuery.trim(targetScore[i].value));
			 
		 }
	 }
	 if(isBreak)
		 return false;
	 
	 if(sum!=100){
		 alert("Total KPI Weight must be 100.");
		 return false;
	 }
	 var year=jQuery.trim($("#yearElement").val());
	 var periodNo=jQuery.trim($("#periodElement").val());
	 var department_code=jQuery.trim($("#departmentElement").val());
	 var position_code=jQuery.trim($("#positionElement option:selected").text());
	 var employee_code=jQuery.trim($("#employeeElement").val());
	 var employee_name=jQuery.trim($("#employeeSelection").val()); 
	 
	 if(periodNo=='all' ){
		 alert("Please select Period.");
		 return false;
	 }
	 if(department_code=='all' ){
		 alert("Please select Department.");
		 return false;
	 }
		 
	/*  var etl_flag='N';*/
	 var approved_flag='0';  
	  
	 var approveKPIWhere=""; 
	 var haveWhere=false;
	// alert(jQuery.trim(employee_name).length)
	  if(jQuery.trim(employee_name).length==0){
		 employee_code='';
	 }   
	/* if(year.length>0){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and result.year ="+year+"";
		else
			approveKPIWhere=approveKPIWhere+" where result.year ="+year+"";
		haveWhere=true;
	}
	if(periodNo.length>0 && periodNo!='all'){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and result.period_no="+periodNo+"";
		else
			approveKPIWhere=approveKPIWhere+" where result.period_no="+periodNo+"";
		haveWhere=true;
	} */
	if(department_code.length>0 && department_code!='all'){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and em.department_code ='"+department_code+"'";
		else
			approveKPIWhere=approveKPIWhere+" where em.department_code = '"+department_code+"'";
		haveWhere=true;
	}
	if(position_code.length>0 && position_code!='All'){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and em.position_name ='"+position_code+"'";
		else
			approveKPIWhere=approveKPIWhere+" where em.position_name = '"+position_code+"'";
		haveWhere=true;
	}
	if(employee_code.length>0){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and em.employee_code='"+employee_code+"'";
		else
			approveKPIWhere=approveKPIWhere+" where em.employee_code ='"+employee_code+"'";
		haveWhere=true;
	}
	if(employee_name.length>0){
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and  concat(em.employee_name,' ',em.employee_surname)='"+employee_name+"' ";
		else
			approveKPIWhere=approveKPIWhere+" where  concat(em.employee_name,' ',em.employee_surname)='"+employee_name+"' ";
		haveWhere=true;
	}
	
	/* if(etl_flag.length>0){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and kpi.etl_flag='"+etl_flag+"'";
		else
			approveKPIWhere=approveKPIWhere+" where kpi.etl_flag='"+etl_flag+"'";
		haveWhere=true;
	}  */
	
	/* if(approved_flag.length>0){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and result.approved_flag ='"+approved_flag+"'";
		else
			approveKPIWhere=approveKPIWhere+" where result.approved_flag = '"+approved_flag+"'";
		haveWhere=true;
	}   */
	var query ="select em.employee_code" +
	"	,concat(em.employee_name,' ',em.employee_surname) as emp_name from  "+SCHEMA_G+".employee em  "+approveKPIWhere +" order by em.employee_code ";
	KPIAjax.assignKPI(SCHEMA_G,query,year,periodNo,kpiCode_add_array,kpiOrders_array,kpiWeight_array,targetData_array,targetScore_array,etl_flag_array,	
			//Integer periodNo, String[] kpiCodes,String[] kpiOrders,String[] kpiWeight,String[] targetData,String[] targetScore, String approved_flag) {
		{
			callback:function(data){ 
				/* if(data.length==0){
					alert("Can not assign KPI 1.");
					return false;
				} */
				 distplayKPI4(data);
				// alert(data.length);
			}
   });	
}
function assignKPI2(){
	 var year=jQuery.trim($("#yearElement").val());
	 var periodNo=jQuery.trim($("#periodElement").val());
	 var department_code=jQuery.trim($("#departmentElement").val());
	 var position_code=jQuery.trim($("#positionElement option:selected").text());
	 var employee_code=jQuery.trim($("#employeeElement").val());
	 var employee_name=jQuery.trim($("#employeeSelection").val()); 
	 if(employee_name.length==0)
		 employee_code=""; 
	 
	 var kpiCode_add=document.getElementsByName("kpiCode_add2");
	 var kpiOrder=document.getElementsByName("kpiOrder2");
	 var kpiWeight=document.getElementsByName("kpiWeight2");
	 var targetData=document.getElementsByName("targetData2");
	 var targetScore=document.getElementsByName("targetScore2");
	 var etl_flag=document.getElementsByName("etl_flag2");
	 var sum=0;
	 var isBreak=false;
	 
	 
	 var kpiCode_add_array=[];
	 if(kpiCode_add!=null && kpiCode_add.length>0){
		 for(var i=0;i<kpiCode_add.length;i++){ 
			 kpiCode_add_array.push(jQuery.trim(kpiCode_add[i].value));
		 }
	 }
	 var etl_flag_array=[];
	 if(etl_flag!=null && etl_flag.length>0){
		 for(var i=0;i<etl_flag.length;i++){ 
			 etl_flag_array.push(jQuery.trim(etl_flag[i].value));
		 }
	 }
	 var kpiOrders_array=[];
	 if(kpiOrder!=null && kpiOrder.length>0){
		 for(var i=0;i<kpiOrder.length;i++){
			 var isBank=checkBank(jQuery.trim(kpiOrder[i].value));
			 if(isBank){
				 alert("Please fill Data. kpiOrder");
				 isBreak=true;
				 break;
			 } 
			 var isNumber=checkNumber(jQuery.trim(kpiOrder[i].value));
			 if(isNumber){
				 alert('Please fill Number kpiOrder !!!');  
				 isBreak=true; 
				 break;				 
			 }
			 kpiOrders_array.push(jQuery.trim(kpiOrder[i].value));
		 }
	 }
	 if(isBreak)
		 return false;
	 var kpiWeight_array=[];
	 if(kpiWeight!=null && kpiWeight.length>0){
		 for(var i=0;i<kpiWeight.length;i++){
			 var isBank=checkBank(jQuery.trim(kpiWeight[i].value));
			 if(isBank){
				 alert("Please fill Data. kpiWeight");
				 isBreak=true;
				 break;
			 } 
			 var isNumber=checkNumber(jQuery.trim(kpiWeight[i].value));
			 if(isNumber){
				 alert('Please fill Number kpiWeight !!!');  
				 isBreak=true; 
				 break;
				 
			 }
			 var weigth=parseFloat(kpiWeight[i].value);
			 sum=sum+weigth;
			 kpiWeight_array.push(jQuery.trim(kpiWeight[i].value));
		 }
	 }
	 if(isBreak)
		 return false;
	 
	var targetData_array=[];
	 if(targetData!=null && targetData.length>0){
		 for(var i=0;i<targetData.length;i++){
			 var isBank=checkBank(jQuery.trim(targetData[i].value));
			 if(isBank){
				 alert("Please fill Data. targetData");
				 isBreak=true;
				 break;
			 } 
			 var isNumber=checkNumber(jQuery.trim(targetData[i].value));
			 if(isNumber){
				 alert('Please fill Number targetData!!!');  
				 isBreak=true; 
				 break;
				 
			 }
			 targetData_array.push(jQuery.trim(targetData[i].value));
			 
		 }
	 }
	 if(isBreak)
		 return false;
	 
	 var targetScore_array=[]
	 if(targetScore!=null && targetScore.length>0){
		 for(var i=0;i<targetScore.length;i++){
			 var isBank=checkBank(jQuery.trim(targetScore[i].value));
			 if(isBank){
				 alert("Please fill Data.targetScore");
				 isBreak=true;
				 break;
			 } 
			 var isNumber=checkNumber(jQuery.trim(targetScore[i].value));
			 if(isNumber){
				 alert('Please fill Number targetScore!!!');  
				 isBreak=true; 
				 break;
				 
			 } 
			 targetScore_array.push(jQuery.trim(targetScore[i].value));
			 
		 }
	 }
	 if(isBreak)
		 return false;
	 
	 if(sum!=100){
		 alert("Total KPI Weight must be 100.");
		 return false;
	 }
	 var year=jQuery.trim($("#yearElement").val());
	 var periodNo=jQuery.trim($("#periodElement").val());
	 var department_code=jQuery.trim($("#departmentElement").val());
	 var position_code=jQuery.trim($("#positionElement option:selected").text());
	 var employee_code=jQuery.trim($("#employeeElement").val());
	 var employee_name=jQuery.trim($("#employeeSelection").val()); 
	 
	 if(periodNo=='all' ){
		 alert("Please select Period.");
		 return false;
	 }
	 if(department_code=='all' ){
		 alert("Please select Department.");
		 return false;
	 }
		 
	/*  var etl_flag='N';*/
	 var approved_flag='0';  
	  
	 var approveKPIWhere=""; 
	 var haveWhere=false;
	  if(jQuery.trim(employee_name).length==0){
		 employee_code='';
	 }   

	if(department_code.length>0 && department_code!='all'){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and em.department_code ='"+department_code+"'";
		else
			approveKPIWhere=approveKPIWhere+" where em.department_code = '"+department_code+"'";
		haveWhere=true;
	}
	if(position_code.length>0 && position_code!='All'){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and em.position_name ='"+position_code+"'";
		else
			approveKPIWhere=approveKPIWhere+" where em.position_name = '"+position_code+"'";
		haveWhere=true;
	}
	if(employee_code.length>0){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and em.employee_code='"+employee_code+"'";
		else
			approveKPIWhere=approveKPIWhere+" where em.employee_code ='"+employee_code+"'";
		haveWhere=true;
	}
	if(employee_name.length>0){
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and  concat(em.employee_name,' ',em.employee_surname)='"+employee_name+"' ";
		else
			approveKPIWhere=approveKPIWhere+" where  concat(em.employee_name,' ',em.employee_surname)='"+employee_name+"' ";
		haveWhere=true;
	}
	
	var query ="select em.employee_code" +
	"	,concat(em.employee_name,' ',em.employee_surname) as emp_name from  "+SCHEMA_G+".employee em  "+approveKPIWhere +" order by em.employee_code ";
	KPIAjax.assignKPIUpdate(SCHEMA_G,query,year,periodNo,kpiCode_add_array,kpiOrders_array,kpiWeight_array,targetData_array,targetScore_array,etl_flag_array,	
			//Integer periodNo, String[] kpiCodes,String[] kpiOrders,String[] kpiWeight,String[] targetData,String[] targetScore, String approved_flag) {
		{
			callback:function(data){ 
				if(data==0){
					alert("Can not assign KPI.");
					return false;
				}else{
					alert("Manage KPI has been done.");
				 	showPage('2');
				}
				
				// alert(data.length);
			}
    });	
}
function addRow(tableID,kpiName,kpiCode,etlFlag) {
	 
    var table = document.getElementById(tableID);

    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);

    var colCount = table.rows[0].cells.length;
    var newcell1 = row.insertCell(0);
    newcell1.setAttribute("style","text-align: center; align=\"center\""); 
    
    newcell1.innerHTML="<input type=\"checkbox\"  name=\"chk_input\" class=\"input_kpi\"/>";
    var newcell2 = row.insertCell(1);
     newcell2.innerHTML="<input type=\"text\"  name=\"kpiOrder\"  class=\"input_kpi\" style=\"width:30px;height: 20px;line-height: 20px;\"/> "+
     					"<input type=\"hidden\"  name=\"kpiCode_add\"  value=\""+kpiCode+"\"/>"+
     					"<input type=\"hidden\"  name=\"etl_flag\"  value=\""+etlFlag+"\"/>";
    var newcell3 = row.insertCell(2);
    newcell3.innerHTML=kpiName;
    var newcell4 = row.insertCell(3);
    newcell4.innerHTML="<input type=\"text\"  name=\"kpiWeight\"  class=\"input_kpi\" style=\"width:130px;height: 20px;line-height: 20px;\"/> ";
    var newcell5 = row.insertCell(4);
    newcell5.innerHTML="<input type=\"text\"  name=\"targetData\"  class=\"input_kpi\" style=\"width:130px;height: 20px;line-height: 20px;\"/> ";
    var newcell6 = row.insertCell(5);
    newcell6.innerHTML="<input type=\"text\"  name=\"targetScore\" class=\"input_kpi\" style=\"width:130px;height: 20px;line-height: 20px;\"/> ";
    $( "#dialog-form" ).dialog("close");
    /*  
    for(var i=0; i<colCount; i++) {

        var newcell = row.insertCell(i);

        newcell.innerHTML = table.rows[0].cells[i].innerHTML;
        //alert(newcell.childNodes);
     switch(newcell.childNodes[0].type) {
            case "text":
                    newcell.childNodes[0].value = "";
                    break;
            case "checkbox":
                    newcell.childNodes[0].checked = false;
                    break;
            case "select-one":
                    newcell.childNodes[0].selectedIndex = 0;
                    break;
        } 
    }
    */
}

function deleteRow(tableID) {
//	alert(tableID) 
    try {
    var table = document.getElementById(tableID);
    var rowCount = table.rows.length;
 //alert("rowCount="+rowCount)
 var ids=[];
    for(var i=1; i<rowCount; i++) {
        var row = table.rows[i];
        var chkbox = row.cells[0].childNodes[0];
        if(null != chkbox && true == chkbox.checked) {
            if(rowCount <= 1) {
                alert("Cannot delete all the rows.");
                break;
            }
            if(tableID=='dataTable2' || tableID=='dataTable3'){
            	//alert(chkbox.value)
            	ids.push(chkbox.value);
            }
            table.deleteRow(i);
            rowCount--;
            i--;
        } 
    }
    if(tableID=='dataTable2' || tableID=='dataTable3')
    	doAction(ids,tableID);
    }catch(e) {
        alert(e);
    }
}
function selectKPI2(){
 	var kpiName =jQuery.trim($("#kpiName_hidden2").val());
 	var kpiCode =jQuery.trim($("#kpiCode_hidden2").val());
 	//alert(kpiCode+","+kpiName);
 	if(kpiName.length==0 && kpiCode.length==0){
 		alert("Please fill KPI Code or KPI Name.")
 		return false;
 	}
 	//addRow('dataTable',kpiName,kpiCode)
 		//alert(kpiName);
 	
 }
function selectKPI(){
 	var kpiName =jQuery.trim($("#kpiName_hidden").val());
 	var kpiCode =jQuery.trim($("#kpiCode_hidden").val());
 	//alert(kpiCode+","+kpiName); 
 	if(kpiName.length==0 && kpiCode.length==0){
 		alert("Please fill KPI Code or KPI Name.")
 		return false;
 	}
 	var queryEtlFlag="SELECT  kpi.etl_flag,kpi_code  FROM "+SCHEMA_G+".kpi kpi where kpi_code='"+kpiCode+"'";
	
	KPIAjax.searchObject(queryEtlFlag,{
		callback:function(data){ 
			addRow('dataTable',kpiName,kpiCode,data[0][0]) ; 
		}
	});
 	
 		//alert(kpiName);
 	
 }
 function checkNumber(txtVal){
	// alert(txtVal) 
	 if(!(intRegex.test(txtVal) || floatRegex.test(txtVal))) {
	      //  alert('Please fill Number !!!');
	      return true;
	    }
	 return false;
 } 
 function checkBank(txtVal){
	 if(txtVal.length==0){
	      //  alert('Please fill Number !!!');
	      return true;
	    }
	 return false;
 }
 function showPage(page){
	 if(page=='1'){
		 distplayKPI();
	 }else if(page=='2'){
		 // dialog-Message2
		 distplayKPI2();
	 }else if(page=='3'){
		 // dialog-Message2
		 distplayKPI3();
	 }/* else if(page=='4')
		 distplayKPI4(); */
 }
 function togleChk(obj,name){
	 
  //  alert(obj.checked);
	var checkElments= document.getElementsByName(name);
	if(checkElments!=null && checkElments.length>0){
		for(var i=0;i<checkElments.length;i++){
			checkElments[i].checked=obj.checked;
		}
	}
	
 }
 function addRowManageKPI(tableID,kpiName,kpiCode,kpiOrder,kpiWeight,targetData,targetScore,etl_flag) {
	 
		
		var year_input=$("#year_input2").val();
		var period_no_input=$("#period_no_input2").val();
		var employee_code_input=$("#employee_code_input2").val();
	    var table = document.getElementById(tableID);
        var kpiCode_add2_array=document.getElementsByName("kpiCode_add2");
      /*   alert(kpiCode_add2_array)
        alert(kpiCode_add2_array.length)
         alert(kpiCode) */
        if(kpiCode_add2_array!=null && kpiCode_add2_array.length>0){
        	for(var i=0;i<kpiCode_add2_array.length;i++){
        		 if(kpiCode==kpiCode_add2_array[i].value){
        			 alert(" kpi code ซ้ำ.");
        			 return false;
        		 }
        	}
        }
	    var rowCount = table.rows.length;
	    var row = table.insertRow(rowCount);

	    var colCount = table.rows[0].cells.length;
	  //  var newcell1 = row.insertCell(0);
	   // newcell1.setAttribute("style","text-align: center; align=\"center\""); 
	    
		//var year_input=$("#year_input2").val();
		//var period_no_input=$("#period_no_input2").val();
		//var employee_code_input=$("#employee_code_input2").val();
		 var employee_name=jQuery.trim($("#employeeSelection").val()); 
	   // newcell1.innerHTML=""+
	    // <input type=\"checkbox\"  name=\"chk_input2\" value=\""+year_input+"|"+period_no_input+"|"+employee_code_input+"|"+kpiCode+"\" />"+
		//"<input type=\"checkbox\"  name=\"chk_input2\" value=\""+year_input+"|"+period_no_input+"|"+employee_code_input+"|"+kpiCode+"\" />"+
		
	    var newcell2 = row.insertCell(0);
	     newcell2.innerHTML=employee_code_input+"<input type=\"hidden\" name=\"year_input\" value=\""+year_input+"\" />"+
			"<input type=\"hidden\" name=\"period_no_input\" value=\""+period_no_input+"\" />"+
			"<input type=\"hidden\" name=\"employee_code_input\" value=\""+employee_code_input+"\" />"+
			"<input type=\"hidden\" name=\"kpi_code_input\" value=\""+kpiCode+"\" />"+ 
			"<input type=\"hidden\" name=\"kpi_result_id\" value=\""+year_input+"_"+period_no_input+"_"+employee_code_input+"_"+kpiCode+"\" />"+
			"<input type=\"hidden\" name=\"kpiCode_add2\" value=\""+kpiCode+"\" />"+
		 	"<input type=\"hidden\" name=\"etl_flag2\" value=\""+etl_flag+"\" />";
	     newcell2.setAttribute("style","text-align: left"); 
	     					
	    var newcell3 = row.insertCell(1);
	    newcell3.innerHTML=employee_name; 
	 		 
	    var newcell4 = row.insertCell(2);
	    newcell4.innerHTML= "<input type=\"text\"  name=\"kpiOrder2\"  value=\""+kpiOrder+"\" class=\"input_kpi\" style=\"width:30px;height: 20px;line-height: 20px;\"/> "
		newcell4.setAttribute("style","text-align: left"); 	
		
		  var newcell5 = row.insertCell(3);
		 newcell5.innerHTML=kpiCode; 
		 newcell5.setAttribute("style","text-align: left"); 
		 
		 var newcell6 = row.insertCell(4);
		 newcell6.innerHTML=kpiName; 
		 newcell6.setAttribute("style","text-align: left"); 
	    	//"<input type=\"text\"  name=\"kpiWeight2\" value=\""+kpiWeight+"\" class=\"input_kpi\" style=\"width:130px;height: 20px;line-height: 20px;\"/> ";
	     var newcell7 = row.insertCell(5);
	     newcell7.innerHTML="<input type=\"text\"  name=\"kpiWeight2\"  value=\""+kpiWeight+"\" class=\"input_kpi\" style=\"width:130px;height: 20px;line-height: 20px;\"/> ";
	     newcell7.setAttribute("style","text-align: left"); 
	     
	    var newcell8 = row.insertCell(6);
	    newcell8.innerHTML="<input type=\"text\"  name=\"targetData2\"  value=\""+targetData+"\" class=\"input_kpi\" style=\"width:130px;height: 20px;line-height: 20px;\"/> ";
	    newcell8.setAttribute("style","text-align: left"); 
	    
	    var newcell9 = row.insertCell(7);
	    newcell9.innerHTML="<input type=\"text\"  name=\"targetScore2\" value=\""+targetScore+"\"  class=\"input_kpi\" style=\"width:130px;height: 20px;line-height: 20px;\"/> ";
	    newcell9.setAttribute("style","text-align: left"); 
	    $( "#dialog-form2" ).dialog("close"); 
	}
</script> 
</body>
</html>  
