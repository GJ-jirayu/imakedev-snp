<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %> 
<%@ include file="/WEB-INF/jsp/includes.jsp" %>  
<html> 
<head>
<title>BackOffice</title>
<!--  <meta charset="UTF-8" />   --> 
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<script  src="<%=request.getContextPath() %>/resources/js/jquery-1.8.3.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/smoothness/jquery-ui-1.9.2.custom.min.js"></script>
 <script type="text/javascript" src="<%=request.getContextPath() %>/resources/ckeditor/ckeditor.js"></script>
 <script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
<link href="<%=request.getContextPath() %>/resources/css/smoothness/jquery-ui-1.9.2.custom.css" type="text/css"  rel="stylesheet" /> 
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"  type="text/css"/>
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet"  type="text/css"/>    
 
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
label, input, button, select, textarea {
font-size: 12px;
font-weight: normal;
line-height: 20px;
}
table > tbody{font-size: 12px}
input {
font-size: 12px;
font-weight: normal;
line-height: normal;
}
 form {
margin: 0 0 0px;
}
 .ui-autocomplete-loading {
    background: white url('<%=request.getContextPath() %>/resources/css/smoothness/images/ui-anim_basic_16x16.gif') right center no-repeat;
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
     	<div id="_content"   style="margin-left:3px;padding-top: 3px;width: 1100px"> 
      		  <table style="width: 1100px;">
     			<tr>
     				<td>
<form class="form-inline"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;padding-bottom:15px" action="" method="post" >
 <div  style="padding-left:20px">
  <span style="padding-left:10px;">
    Employee Code: <input type="text" id="employeeCode" style="width: 120px;text-align: right;"/>
    </span> 
     <span style="padding-left:10px;">
    Employee Name: <input type="text" id="employeeName" style="width: 280px"/>
    </span> 
    <span style="padding-left:10px;">
     <input type="hidden" id="employeeCode_hidden"/>
     <input type="hidden" id="employeeName_hidden"/>
     <input type="text" id="employeeName_result" readonly="readonly" style="width: 280px"/>
    </span>
     <span style="padding-left:20px;">
    	<a class="btn btn-primary" style="font-size:12px" onclick="getJobLevel()"><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size: 12px;">Search</span></a>
    </span>   
  </div>  
</form> 
</td>
				</tr>
  			</table>
 
</div>
 <div style="">
<table style="width: 1100px">
<tr>
		<td>
		 <div id="dialog-Message" style="display: block;padding-left: 3px;width: 1098px" >
  <form style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:0px;padding-bottom:8px" action="" method="post" >
<div> 
	 <div style="padding: 10px;padding-left:30px;padding-top:25px; overflow: auto;height: 50px;overflow-x:hidden" id="search_section">
	 <span>Job Level:</span>
	 <span>
	 <select id="job_level_selection">
      	<option value="0">---</option>
      	<option value="Staff">Staff</option> 
      	<option value="Manager">Manager</option>
      	<option value="Executive">Executive</option>
      	
      </select>
	 </span>
	 <span>
	  <a style="margin-top: -10px" class="btn btn-primary" onclick="setjobLevel()"><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Submit</span></a>
	 </span>
    
    </div>
  </div>
  </form>
  </div>
</td>
	</tr>
  </table>
      	</div> 
<%@ include file="/WEB-INF/jsp/schema_test.jsp" %> 
     <script type="text/javascript">
//var _path="/KPIWebTest/";
//var SCHEMA_G='mcic_kpi_app_test';
//var SCHEMA_G='FSD2';
var _path='<%=request.getContextPath()%>'+'/'; 
var mail_toG;
var mail_subjectG;
var mail_messageG;
var mail_attachG;    
$(document).ready(function() {  
	$( "#employeeCode" ).autocomplete({
		  source: function( request, response ) { 
				var query="SELECT employee_code,concat(employee_name,' ',employee_surname) as emp_name  FROM "+SCHEMA_G+".employee where employee_code like '%"+request.term+"%'   ";		      
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
			  $("#employeeName_result").val(ui.item.value);
			  $("#employeeName").val("");
			  
			  $("#employeeCode_hidden").val(ui.item.label);
			  $("#employeeName_hidden").val(ui.item.value); 
			 
		      return false;
		  },
		  open: function() {
		    $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
		  },
		  close: function() {
		    $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
		  }
		}); 
	$( "#employeeName" ).autocomplete({
		  source: function( request, response ) {  
				var query="SELECT employee_code,concat(employee_name,' ',employee_surname) as emp_name  FROM "+SCHEMA_G+".employee where concat(employee_name,' ',employee_surname) like '%"+request.term+"%'   ";		
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
			   $("#employeeName_result").val(ui.item.label);
			   $("#employeeCode").val("");
			   
			   $("#employeeCode_hidden").val(ui.item.value);
			   $("#employeeName_hidden").val(ui.item.label); 
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
		 $('#employeeCode').focus(); 
		 $('#employeeName').css("width","250px");
		 $('#employeeName_result').css("width","250px"); 
		}
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
   
function getJobLevel(){
 	var employeeName =jQuery.trim($("#employeeName_hidden").val());
 	var employeeCode =jQuery.trim($("#employeeCode_hidden").val());
 	//alert(kpiCode+","+employeeName);
 	if(employeeName.length==0 && employeeCode.length==0){
 		alert("Please fill Employee Code or Employee Name.")
 	}
 		
 	//return false;
  
 	 var query="SELECT employee_code,concat(employee_name,' ',employee_surname) as emp_name,job_level  FROM "+SCHEMA_G+".employee where concat(employee_name,' ',employee_surname) ='"+employeeName+"' "+ 
 	 " and employee_code='"+employeeCode+"'"; 
 	KPIAjax.searchObject(query,{
 		callback:function(data){  
 			  		
 			   if(data!=null && data.length>0){
 				  $("#job_level_selection").val(data[0][2]); 
 			   } 
 		}
 	}); 
 }
function setjobLevel(){
	  var employeeCode_hidden_value= $("#employeeCode_hidden").val();
	  var employeeName_hidden_value=$("#employeeName_hidden").val(); 
	  
	 	//alert(kpiCode+","+employeeName);
	 	if(employeeCode_hidden_value.length==0 && employeeName_hidden_value.length==0){
	 		alert("Please fill Employee Code or Employee Name.");
	 		return false;
	 	}
	//  var query="SELECT employee_code,concat(employee_name,' ',employee_surname) as emp_name  FROM "+SCHEMA_G+".employee where concat(employee_name,' ',employee_surname) like '%"+request.term+"%'   ";
	var job_level_selection_value=$("#job_level_selection").val();
	if(job_level_selection_value=='0'){
		alert("Please select Job Level");
		return false;
	}
	var query="update  "+SCHEMA_G+".employee set job_level='"+job_level_selection_value+"' ,updated_dt=now() "+
	" where employee_code='"+employeeCode_hidden_value+"' and concat(employee_name,' ',employee_surname)='"+employeeName_hidden_value+"'";
	KPIAjax.executeQuery(query,{
		callback:function(data){
			if(data==0)
				alert("Can not update Job Level.");
			else
				alert("Updated Job Level.");
			//distplayKPIBaseline();
		}
	}); 
}
</script> 
</body>
</html> 
 
 
