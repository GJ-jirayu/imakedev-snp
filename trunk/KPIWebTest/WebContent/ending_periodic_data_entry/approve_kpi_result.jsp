<%@ page  language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %> 
<%@ include file="/WEB-INF/jsp/includes.jsp" %> 
<%@ page language="java" 
    import="java.util.ArrayList,
            org.pentaho.platform.engine.core.system.PentahoSystem,
            org.pentaho.platform.api.engine.IPentahoSession,
            org.pentaho.platform.web.jsp.messages.Messages,
            org.pentaho.platform.web.http.WebTemplateHelper,
            org.pentaho.platform.api.engine.IUITemplater,
            org.pentaho.platform.util.messages.LocaleHelper,
            org.pentaho.platform.util.VersionHelper,
            org.pentaho.platform.api.ui.INavigationComponent,
            org.pentaho.platform.uifoundation.component.HtmlComponent,
            org.pentaho.platform.util.web.SimpleUrlFactory,
            org.pentaho.platform.engine.core.solution.SimpleParameterProvider,
            org.pentaho.platform.uifoundation.chart.ChartHelper,
      org.pentaho.platform.web.http.PentahoHttpSessionHelper" %>
      <% String remoteUser = request.getRemoteUser();%>
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
table > tbody{font-size: 12px}
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
<style type="text/css">
/*.th_class{font-family: Tahoma;font-size: 13px;text-align: center;*/
.th_class{text-align: center;
}
a{cursor: pointer;}
 .ui-autocomplete-loading {
    background: white url('<%=request.getContextPath() %>/resources/css/smoothness/images/ui-anim_basic_16x16.gif') right center no-repeat;
  } 
   #city { width: 140px; }
</style>
<!-- <style type="text/css"> 
th{ font-family:Tahoma; font-size:12px; font-weight:bold;
 color: #fff;background:url(/MISSExamBackOffice/resources/images/tr_back-theme1.gif) repeat-x scroll 0 0 #80838A;padding: 5px 8px;border:1px solid #fff; 
} 
</style> -->  

</head> 
<body> 
 <!--  <div class="row-fluid"  style="position:fixed;"> 
     	<div class="span7"> -->
     	<div id="_content" style="margin-left:3px;padding-top: 3px;width: 1100px">
      		 <!-- <fieldset style="font-family: sans-serif;padding-top:0px;width: 1048px">  -->
      		 <table style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;padding-bottom:15px;width: 1100px;"><tr><td>
	<!-- <form class="form-inline"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;padding-bottom:15px" action="" method="post" > --> 
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
     <input type="text" id="employeeSelection"/>
     <a id="distplayApproveKPIResultElement" class="btn btn-primary" style="font-size:12px;margin-top: -10px" onclick="distplayApproveKPIResult()"><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size: 12px;">Search</span></a>
    </span>  
   <!--  <span style="padding-left:20px;">
    	<a class="btn btn-primary" style="font-size:12px" onclick="distplayEmployee()"><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size: 12px;">Search</span></a>
    </span -->
<!-- </form> -->
   </td>
	</tr>
  </table> 
  </div>
<div id="dialog-Message-alert" title="Message" style="display: none;background: ('images/ui-bg_highlight-soft_75_cccccc_1x100.png') repeat-x scroll 50% 50% rgb(204, 204, 204)">
	<span id="_message_show"></span>
</div>
<div id="dialog-Message" style="display: none;width: 1098px;padding-left: 4px;padding-top:1px">
<table style="border:1px solid #B3D2EE;background: #F9F9F9;width: 1098px"> 
	<tr>
		<td> 
		<div style="display: block;padding-left: 3px;width: 1088px" >
<!-- <form  class="well"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;" action="" method="post" > -->
<div> 
	 <div style="padding: 10px; overflow: auto;height: 377px;overflow-x:hidden"  id="employee_section"> 
    </div>
  </div>
  <div align="center" id="approve_section"> 
      <a class="btn btn-primary" onclick="approve()"><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Approve</span></a>
    </div>
    </div>
  </td>
	</tr>
  </table>
 </div>  
  <div id="dialog-form"  style="display: none;">
<form class="form-horizontal"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;padding: 20px" action="" method="post" >
   <input type="hidden" id="mode" />
   <table>
   	<tr>
   		<td>Year:  </td>
   		<td><input type="text" id="year_input" class="input_number" readonly="readonly" /> </td> 
   		<td colspan="2" style="padding-left:20px">Period: <span style="padding-left: 10px"><input type="hidden" id="period_code_input" /><input type="text" id="period_input" style="width: 297px" readonly="readonly"  /></span></td>
   		<!-- <td><input type="text"/> </td> --> 
   		
   	</tr>
   	<tr>
   		<td>Employee Code:</td>
   		
   		<td colspan="3"><input type="text" id="employee_code_input" class="input_number" style="width: 118px" readonly="readonly" /><span style="padding-left: 2px"><input type="text" id="employee_name_input" class="input_text" readonly="readonly" /></span></td>
   	</tr>
   	<tr>
   		<td>KPI Code:</td>
   		 <td colspan="3"><input type="text" id="kpi_code_input" class="input_number" readonly="readonly" /><span style="padding-left: 20px"><input type="text" id="kpi_name_input" class="input_text" readonly="readonly" /></span></td> 
   	</tr>
   	<tr>
   		<td>Target Data:</td>
   		<td><input type="text" id="target_data_input" class="input_number" readonly="readonly" /> </td> 
   		<td style="padding-left:20px">Target Score:</td>
   		<td><input type="text"  id="target_score_input" class="input_number" readonly="readonly" /> </td>
   	</tr>
   	<tr>
   		<td style="">Actual Data:</td>
   		<td><input type="text" id="actual_data_input" class="input_number" readonly="readonly"/> </td> 
   		<td style="padding-left:20px;">Baseline Data:</td>
   		<td><input type="text" id="baseline_data_input" class="input_number" readonly="readonly"/> </td> 
   	</tr>
   	<tr>
   		<td>Actual Score:</td>
   		<td><input type="text" id="actual_score_input" class="input_number" readonly="readonly" /></td> 
   		<td style="padding-left:20px">% Actual vs Target:</td>
   		<td><input type="text" id="actual_vs_target_input" class="input_number" readonly="readonly" /> 
   		<input type="hidden" id="actual_vs_target_hidden_input" class="input_number" readonly="readonly" />
   		</td> 
   	</tr>
   	<tr>
   		<td>Weight:</td>
   		<td><input type="text" id="weight_input" class="input_number" readonly="readonly" /> </td> 
   		<td style="padding-left:20px">Weight Percentage:</td>
   		<td><input type="text" id="weight_percentage_input" class="input_number" readonly="readonly" /> 
   		<input type="hidden" id="weight_percentage_input_hidden" />
   		<input type="hidden" id="performance_percentage_input_hidden" />
   		  </td> 
   	</tr>
   <!-- 	<tr>
   		<td style="padding-top: 10px" align="center" colspan="4"> <a class="btn btn-primary" onclick="doSubmitAction()"><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Submit</span></a></td> 
   	</tr> -->
   </table>
 <!--  <div class="control-group" id="id_element">
    <label class="control-label" for="inputEmail">Data Source ID:</label>
    <div class="controls">
      <input class="input_snp" type="text" id="dataSourceID_form" readonly="readonly">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Data Source Name:</label>
    <div class="controls">
      <input class="input_snp"  type="text" id="dataSourceName_form" >
    </div>
  </div> 
  <div class="control-group">
    <div class="controls"> 
      <a class="btn btn-primary" onclick="doSubmitAction()"><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Submit</span></a>
    </div>
  </div> -->
</form> 
</div>
 <!--  </form>
  </div>
  
</fieldset>
      	</div>
     	</div>
     </div>  -->
  <%@ include file="/WEB-INF/jsp/schema.jsp" %>  
     <script type="text/javascript">
//var _path="/KPIWebTest/";
//var SCHEMA_G='mcic_kpi_app';
//var SCHEMA_G='FSD2';
var remoteUser ="<%=remoteUser%>";
var jobLevelG="unauthorized";
var department_codeG="";
var employee_codeG="";
//alert(remoteUser);
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
	var query="select emp_code from "+SCHEMA_G+".authen_user" +
		"   where username='"+remoteUser+"'";
		 KPIAjax.searchObject(query,{
				callback:function(data){ 
					if(data.length>0 && data[0]!=null && data[0].length>0){
						employee_codeG=data[0];
					  query="select department_code , job_level from "+SCHEMA_G+".employee" +
						"   where employee_code='"+data[0]+"'";
					  KPIAjax.searchObject(query,{
							callback:function(data1){
								jobLevelG= data1[0][1];
								department_codeG=data1[0][0];
								//listDepartment(data1[1],data1[0]);
								_initPage();
							}
					 });
					}else
						_initPage();
					
				}
		 });
	
}); 
function _initPage(){ 
	listYear();
	//getJobLevel();
	listDepartment();
if(jobLevelG!="unauthorized"){
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
   }else{
	   $("#employeeSelection").attr("readonly","readonly");
	   //$("#employeeSelection").val("Unauthorized");
	   $("#distplayApproveKPIResultElement").hide();
   }
	if ($.browser.msie){
		 $('#employeeSelection').focus(); 
		}
}
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
	var query="SELECT distinct result.year FROM "+SCHEMA_G+".kpi_result result order by result.year desc ";
	KPIAjax.listYears(query,{
		callback:function(data){
			//alert(data);
			   //var str="<select id=\"yearElement\" style=\"width: 75px\" onchange=\"listDepartment()\">";
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
			period_query=" where result.year=" +year;
		}
		 
	//var query="select period_no,period_desc  from "+SCHEMA_G+".period "+period_query;
	var query="SELECT distinct result.period_no ,pd.period_desc FROM "+SCHEMA_G+".kpi_result "+
	 " result inner join "+SCHEMA_G+".period   pd on ( result.period_no=pd.period_no  and result.year=pd.year ) "+
	// " where result.year=2012 "+
	period_query+
	" order by result.period_no desc  ";
	//" order by department_name";
	KPIAjax.listMaster(query,{
		callback:function(data){
			//alert(data); 
			 var str="<select id=\"periodElement\">";
			  //  str=str+"<option value=\"all\">All</option>";
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
function getJobLevel(){ 
	//remoteUser='jeeranun'; 
	var query="select emp_code from "+SCHEMA_G+".authen_user" +
	"   where username='"+remoteUser+"'";
	 KPIAjax.searchObject(query,{
			callback:function(data){
				//alert(data[0]); 
				if(data.length>0 && data[0]!=null && data[0].length>0){
				  query="select department_code , job_level from "+SCHEMA_G+".employee" +
					"   where employee_code='"+data[0]+"'";
				  KPIAjax.searchObject(query,{
						callback:function(data1){
							 
							//listDepartment(data1[1],data1[0]);
						}
				 });
				}else{
					listDepartment("unauthorized","");
				}
			}
	 });
	 
}
function listDepartment(){
	//var year=$("#yearElement").val();
	//alert(year) 
	  var where_department="";
	  var isAuthorized=false; 
	  if(jobLevelG=='Executive'){ 
		  isAuthorized=true;
	  }else  if(jobLevelG=='Manager'){
		  where_department=" where  department_code='"+department_codeG+"'";
		  isAuthorized=true;
	  } 
	 
   if(isAuthorized){ 
	var query="select distinct department_code, department_name  from "+SCHEMA_G+".employee " +where_department+
	" order by department_name";
	KPIAjax.listMaster(query,{
		callback:function(data){
			//alert(data);
			var str="<select id=\"departmentElement\" onchange=\"listPosition()\" >";
			 str=str+"<option value=\"all\">All</option>";
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
  }else{
	  var str="<select id=\"departmentElement\" >";
		 str=str+"<option value=\"unauthorized\">Unauthorized</option>"; 
		 str=str+"</select>";
		$("#departmentSelection").html(str); 
		var str="<select id=\"positionElement\"    onchange=\"clearEmployee()\">";
		str=str+"<option value=\"unauthorized\">Unauthorized</option>"; 
		str=str+"</select>";
		$("#positionSelection").html(str);
		clearEmployee(); 
  }
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
			//var str="<select id=\"positionElement\" onchange=\"listEmployee()\" >";
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
function listEmployee(){
	var position_value=$("#positionElement").val();
	//alert(position_value) 
	var department_value=$("#departmentElement").val();
	//alert(department_value)
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
	var query="select distinct employee_code, concat(employee_name,' ',employee_surname) " +
	" as emp_name ,department_code,position_code from "+SCHEMA_G+".employee  "+where_query+" order by emp_name";
	/* var query="select distinct employee_code, concat(employee_name,' ',employee_surname) " +
		" as emp_name ,department_code,position_code from "+SCHEMA_G+".employee where  department_code = '"+department_value+"'" +
		"  and   position_code = '"+position_value+"' order by emp_name"; */
	KPIAjax.listMaster(query,{
		callback:function(data){
			//alert(data);
			var str="<select id=\"employeeElement\" onchange=\"distplayApproveKPIResult()\">";
			str=str+"<option value=\"all\">All</option>";
			if(data!=null && data.length>0){ 
				for(var i=0;i<data.length;i++){
					str=str+"<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
				}
				//str=str+"</select> &nbsp; &nbsp;<a class=\"btn\" onclick=\"searchKPIResult()\">Search</a>"; 
			}
			str=str+"</select>"; 
			$("#employeeSelection").html(str);
			//distplayApproveKPIResult();
		}
 });
}
function distplayApproveKPIResult(){
	if(jobLevelG=="unauthorized"){
		alert("Unauthorized");
		return false;
	}
	 var year=jQuery.trim($("#yearElement").val());
	 var periodNo=jQuery.trim($("#periodElement").val());
	 var department_code=jQuery.trim($("#departmentElement").val());
	 var position_code=jQuery.trim($("#positionElement option:selected").text());
	 var employee_code=jQuery.trim($("#employeeElement").val());
	 var employee_name=jQuery.trim($("#employeeSelection").val()); 
	 
	 
	 var etl_flag='N';
	 var approved_flag='N';
	  
	 
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
	
	if(etl_flag.length>0){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and kpi.etl_flag='"+etl_flag+"'";
		else
			approveKPIWhere=approveKPIWhere+" where kpi.etl_flag='"+etl_flag+"'";
		haveWhere=true;
	} 
	
	if(approved_flag.length>0){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and result.approved_flag ='"+approved_flag+"'";
		else
			approveKPIWhere=approveKPIWhere+" where result.approved_flag = '"+approved_flag+"'";
		haveWhere=true;
	} 
	
	if(jobLevelG=='Manager'){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and result.employee_code !='"+employee_codeG+"'";
		else
			approveKPIWhere=approveKPIWhere+" where result.employee_code!= '"+employee_codeG+"'";
		haveWhere=true;
	}
	 
	// var position_code=$("#positionElement").val();
	var query ="select result.year,result.period_no,p.period_desc,result.employee_code" +
					"	,concat(em.employee_name,' ',em.employee_surname) as emp_name , result.kpi_code ,kpi.kpi_name " +
					"  ,result.target_score,result.actual_score from "+SCHEMA_G+".kpi_result result inner join "+SCHEMA_G+".kpi kpi " +
					" on result.kpi_code=kpi.kpi_code inner join	"+SCHEMA_G+".employee em on result.employee_code=em.employee_code  inner join "+SCHEMA_G+".period p  on" +
					" (result.period_no=p.period_no and result.year =p.year) "+approveKPIWhere;
					
	 
	/*  if(thresholdName.length>0)
		approveKPIWhere=" where threshold_name like '%"+thresholdName+"%'";
	var query="SELECT * FROM "+SCHEMA_G+".threshold "+thresholdNameWhere; */
	 
	//alert("a") 
	//KPIAjax.searchKPI(SCHEMA_G,year,  periodNo,employeeCode, etl_flag, approved_flag,{
	KPIAjax.searchObject(query,{
		callback:function(data){
			//alert(data);
			 
			if(data!=null && data.length>0){
			    var str="<table class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px\">"+
			    		"<thead>"+
			    		"<tr> "+ 
	            		"<th width=\"5%\"><div class=\"th_class\"><input type=\"checkbox\"  name=\"chkAll2\" onClick=\"togleChk(this,'kpi_result_id')\"/></div></th>"+
	            		"<th width=\"10%\"><div class=\"th_class\">Employee Code</div></th>"+
	            		"<th width=\"25%\"><div class=\"th_class\">Employee Name</div></th>"+
	            		"<th width=\"10%\"><div class=\"th_class\">KPI Code</div></th>"+ 
	            		"<th width=\"30%\"><div class=\"th_class\">KPI Name</div></th>"+
	            		"<th width=\"10%\"><div class=\"th_class\">Target</div></th>  "+
	            		"<th width=\"10%\"><div class=\"th_class\">Actual</div></th>    "+
	          		"</tr>"+
	        	"</thead>"+
	        	"<tbody>";
	        	
				for(var i=0;i<data.length;i++){ 
					str=str+
					"<tr style=\"cursor: pointer;\">"+
	          		"<td align=\"center\" style=\"text-align: center;\">"+
	          		"<input type=\"hidden\" name=\"year_input\" value=\""+data[i][0]+"\" />"+
	          		"<input type=\"hidden\" name=\"period_no_input\" value=\""+data[i][1]+"\" />"+
	          		"<input type=\"hidden\" name=\"employee_code_input\" value=\""+data[i][3]+"\" />"+
	          		"<input type=\"hidden\" name=\"kpi_code_input\" value=\""+data[i][5]+"\" />"+ 
	          		"<input type=\"checkbox\" name=\"kpi_result_id\" value=\""+data[i][0]+"_"+data[i][1]+"_"+data[i][3]+"_"+data[i][5]+"\" />"+
	          		"</td>"+
	            	"<td style=\"text-align: left;\">"+data[i][3]+"</td>"+
	            	"<td>"+data[i][4]+"</td> "+ 
	            	"<td style=\"text-align: left;text-decoration:underline;\" onclick=\"showForm('edit','"+data[i][0]+"','"+data[i][1]+"','"+data[i][3]+"','"+data[i][5]+"')\" style=\"cursor: pointer;\">"+data[i][5]+"</td>"+
	            	"<td>"+data[i][6]+"</td> "+
	            	"<td style=\"text-align: right;\">"+(data[i][7]!=null?data[i][7]:"")+"</td>  "+
	            	"<td style=\"text-align: right;\">"+(data[i][8]!=null?data[i][8]:"")+"</td>  "+
	          	"</tr>  ";
				}
				  
				var approve_str="<a class=\"btn btn-primary\" onclick=\"approve()\"><i class=\"icon-ok icon-white\"></i>&nbsp;<span style=\"color: white;font-weight: bold;\">Approve</span></a>";
			$("#approve_section").html(approve_str);  
			}else{ 
				str="<table class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px;width:1070px\">"+
	    		"<thead>"+
	    		"<tr> "+
      			"<th colspan=\"7\" width=\"100%\"><div class=\"th_class\">No Data</div></th>"+ 
      		"</tr>"+
    	"</thead>"+
    	"<tbody>";  
				
				$("#approve_section").html("");  
			}
			str=str+"</tbody> </table>";
			
			$("#employee_section").html(str);  
			$("#dialog-Message").slideDown("slow");
			 
		}
			
});		 
}
 
function approve (){
	/* 	var employee_code_input=document.getElementsByName("employee_code_input"); // period_no_input , year_input , adjustPercentage_input , weightPercentage_input
		var period_no_input=document.getElementsByName("period_no_input");
		var year_input=document.getElementsByName("year_input");
		var kpi_code_input=document.getElementsByName("kpi_code_input"); */ 
		var kpi_result_ids=document.getElementsByName("kpi_result_id");
		
		var valueArray=[];
		var value="";
		var yearArray=[];
		var period_noArray=[];
		var employee_codeArray=[];
		var kpi_codeArray=[];
		if(kpi_result_ids!=null && kpi_result_ids.length>0){  
			for(var i=0;i<kpi_result_ids.length;i++){
				if(kpi_result_ids[i].checked){
					value=kpi_result_ids[i].value; 
					//alert(value);
					valueArray= value.split("_");
					yearArray.push(parseInt(valueArray[0]));
					period_noArray.push(parseInt(valueArray[1]));
					employee_codeArray.push(valueArray[2]);
					kpi_codeArray.push(valueArray[3]);
				}
			}  
		}
		//alert(yearArray.length)
		//if(false)
		if(yearArray.length>0){ 
			KPIAjax.approveKPIResult(SCHEMA_G,yearArray
					,period_noArray,employee_codeArray,kpi_codeArray,"Y",{
				callback:function(data){
					//alert("return adjust="+data);
					if(data!=null && data!=0){
						$("#_message_show").html("Approve Success."); 
					}else{
						$("#_message_show").html("Approve not Success."); 
					}
					$( "#dialog-Message-alert" ).dialog({
						/* height: 140, */
						modal: true,
						buttons: {
							"Ok": function() { 
								$( this ).dialog( "close" );
								distplayApproveKPIResult();
							}
						} 
					}); 
				},
				 errorHandler:function(errorString, exception) { 
					 alert(errorString+","+exception)
				 }
		 });
		}  
	}  
function searchKPIResult(){
	/* $("#emp_code").val("53-145");
	$("#emp_name").val("วินัย ทองอยู่"); */
	$("#dialog-Message").slideDown("slow"); 
	distplayApproveKPIResult();
}
function showForm(mode,year_input,period_no_input,employee_code_input,kpi_code_input){ 
	//	$("#id_element").show();  
		  
		var query="SELECT result.year,result.period_no,p.period_desc,result.employee_code"+
		" ,concat(em.employee_name,' ',em.employee_surname) as emp_name ,result.kpi_code,kpi.kpi_name,"+
		" result.kpi_order,result.kpi_weight,result.target_data ,"+
		" result.target_score,result.actual_data,result.actual_score,result.lookup_baseline_value,result.performance_percentage,result.weight_percentage, "+
		//"result.approved_flag,result.created_dt,result.updated_dt FROM "+SCHEMA_G+".kpi_result result inner join "+SCHEMA_G+".kpi kpi " +
		"result.approved_flag  FROM "+SCHEMA_G+".kpi_result result inner join "+SCHEMA_G+".kpi kpi " +
		" on result.kpi_code=kpi.kpi_code inner join	"+SCHEMA_G+".employee em on result.employee_code=em.employee_code  inner join "+SCHEMA_G+".period p  on" +
		" (result.period_no=p.period_no and result.year =p.year) where  result.year="+year_input+
		" and result.period_no="+period_no_input+" and result.employee_code='"+employee_code_input+"' and result.kpi_code='"+kpi_code_input+"'";
		KPIAjax.searchObject(query,{
			callback:function(data){
				//alert(data); 
				/*   8. 
9. เมื่อทำการใส่ข้อมูล Baseline Data (บันทึกลง field lookup_baseline_value) ให้ระบบคำนวณ 
เอา kpi code กับ baseline data ไปหา actual score ที่ table kpi_baseline 

select actual_score 
from kpi_baseline
where kpi_code = ${kpi_code} ของ record ที่แก้ไขข้อมูล
and ${baseline_data} between begin_baseline and end_baseline  
% Actual vs Target = (Actual Score*100)/Target Score ได้เกิน 100% ก็ปรับให้เหลือ 100%
Weight Percentage = KPI Weighting * Performance Percentage 
 55*44
10. เมื่อทำการบันทึกข้อมูล ให้ระบบเซ็ตค่า field approved_flag = 'N' */
				$("#year_input").val(data[0][0]);
				$("#period_code_input").val(data[0][1]);
				$("#period_input").val(data[0][2]);
				$("#employee_code_input").val(data[0][3]);
				$("#employee_name_input").val(data[0][4]);
				$("#kpi_code_input").val(data[0][5]);
				$("#kpi_name_input").val(data[0][6]);
				$("#target_data_input").val(data[0][9]);
				$("#target_score_input").val(data[0][10]);
				$("#actual_data_input").val(data[0][11]);
				$("#baseline_data_input").val(data[0][13]);
				$("#actual_score_input").val(data[0][12]);
				//alert(parseInt($("#actual_score_input").val()));
				var actual_score_value_init=0;
					if($("#actual_score_input").val()!=null && jQuery.trim($("#actual_score_input").val()).length>0)
						actual_score_value_init=parseFloat($("#actual_score_input").val()).toFixed(2);
				//var Actual_vs_Target=((actual_score_value_init)*100)/(parseFloat($("#target_score_input").val()).toFixed(2));
				var Actual_vs_Target=parseFloat(((actual_score_value_init)*100)/(parseFloat($("#target_score_input").val()))).toFixed(2);
				if(Actual_vs_Target>100)
					Actual_vs_Target=100;
				if(Actual_vs_Target!=0)
					$("#actual_vs_target_input").val(Actual_vs_Target+"%"); 
				$("#actual_vs_target_hidden_input").val(Actual_vs_Target);
				
				$("#weight_input").val(data[0][8]);
				//alert("data[0][15]="+data[0][15])
				if(data[0][15]!=null && data[0][15]!='null'){
					$("#weight_percentage_input").val(data[0][15]+"%");
					$("#weight_percentage_input_hidden").val(data[0][15]);
				}else{
					$("#weight_percentage_input").val("0%"); 
					$("#weight_percentage_input_hidden").val("0");
				}
				if(data[0][14]!=null && data[0][14]!='null'){ 
					$("#performance_percentage_input_hidden").val(data[0][14]);
				}else
					$("#performance_percentage_input_hidden").val("0");
				  
				
				$( "#dialog-form" ).dialog({ 
					position: 'top',
					 height: 360,
					 width:650,
					modal: true,
					 hide: 'fold',
				     show: 'blind' 
				});
				//
				/*  $("#actual_data_input").keypress(function(event) {
						  if ( event.which == 13 ) {
							     event.preventDefault();
							     var txtVal = this.value;
							     var baseline_data_input=jQuery.trim($("#baseline_data_input").val());
							    // alert(actual_data_input);
							   //  alert(index); 
							     if(!(intRegex.test(txtVal) || floatRegex.test(txtVal))) {
							        alert('Please fill Number !!!');  
							     }else  if(!(intRegex.test(baseline_data_input) || floatRegex.test(baseline_data_input))) {
							    	 alert('Please fill Number !!!');
							     }else{ 
							    	 var query2="select actual_score from "+SCHEMA_G+".kpi_baseline  where kpi_code ='"+$("#kpi_code_input").val()+"' and "+$("#baseline_data_input").val()+" between begin_baseline and end_baseline ";
							    	  
							    	 KPIAjax.searchObject(query2,{ 
							    				callback:function(data2){
							    				//	alert(data2); 
							    					var actual_score_value=0;
							    					var performance_percentage_value=0; 
							    					if(data2!=null && data2.length>0){
							    						$("#actual_score_input").val(data2);  
							    					   actual_score_value=parseFloat(data2).toFixed(2);
							    					   
							    					 }
							    					//Actual_vs_Target=((actual_score_value)*100)/(parseFloat($("#target_score_input").val()).toFixed(2));
							    					Actual_vs_Target=parseFloat(((actual_score_value)*100)/(parseFloat($("#target_score_input").val()))).toFixed(2);
							    					if(Actual_vs_Target>100)
						    							Actual_vs_Target=100;
						    						if(Actual_vs_Target!=0)
						    							$("#actual_vs_target_input").val(Actual_vs_Target+"%"); 
						    						$("#actual_vs_target_hidden_input").val(Actual_vs_Target);
						    						
						    						if($("#performance_percentage_input_hidden").val()!=null){
						    							if(jQuery.trim($("#performance_percentage_input_hidden").val()).length>0){
						    								performance_percentage_value=parseFloat($("#performance_percentage_input_hidden").val()).toFixed(2);
						    							}
						    						}
						    						$("#performance_percentage_input_hidden").val(performance_percentage_value);
							    					
							    						var weight_percentage_value=parseFloat((parseFloat($("#weight_input").val())*Actual_vs_Target)/100).toFixed(2);
							    					 
							    						if(weight_percentage_value!=0)
							    							$("#weight_percentage_input").val(weight_percentage_value+"%");
							    						$("#weight_percentage_input_hidden").val(weight_percentage_value);
							    						
							    				}
							    			});
							     }
							   } 
							}); 
					$("#baseline_data_input").keypress(function(event) {
						  if ( event.which == 13 ) {
							     event.preventDefault();
							     var txtVal = this.value;
							     var actual_data_input=jQuery.trim($("#actual_data_input").val());
							    // alert(actual_data_input);
							   //  alert(index); 
							     if(!(intRegex.test(txtVal) || floatRegex.test(txtVal))) {
							        alert('Please fill Number !!!');  
							     }else  if(!(intRegex.test(actual_data_input) || floatRegex.test(actual_data_input))) {
							    	 alert('Please fill Number !!!');
							     }else{ 
							    	 var query2="select actual_score from "+SCHEMA_G+".kpi_baseline  where kpi_code ='"+$("#kpi_code_input").val()+"' and "+$("#baseline_data_input").val()+" between begin_baseline and end_baseline ";
							    	  
							    	 KPIAjax.searchObject(query2,{ 
							    				callback:function(data2){
							    					  //alert(data2) 
							    					var actual_score_value=0;
							    					var performance_percentage_value=0; 
							    					if(data2!=null && data2.length>0){
							    						$("#actual_score_input").val(data2);  
							    					   actual_score_value=parseFloat(data2).toFixed(2);
							    					   
							    					 }else{
							    						 alert("ค่าของ baseline ไม่ได้ถูก set ไว้.");
							    						 return false;
							    					 }
							    					Actual_vs_Target=parseFloat(((actual_score_value)*100)/(parseFloat($("#target_score_input").val()))).toFixed(2);
						    						if(Actual_vs_Target>100)
						    							Actual_vs_Target=100;
						    						if(Actual_vs_Target!=0)
						    							$("#actual_vs_target_input").val(Actual_vs_Target+"%"); 
						    						$("#actual_vs_target_hidden_input").val(Actual_vs_Target);
						    						
						    						if($("#performance_percentage_input_hidden").val()!=null){
						    							if(jQuery.trim($("#performance_percentage_input_hidden").val()).length>0){
						    								performance_percentage_value=parseFloat($("#performance_percentage_input_hidden").val()).toFixed(2);
						    							}
						    						}
						    						$("#performance_percentage_input_hidden").val(performance_percentage_value);
							    						//var weight_percentage_value=parseFloat(((parseFloat($("#weight_input").val()).toFixed(2))*(Actual_vs_Target))/100).toFixed(2);
							    						var weight_percentage_value=parseFloat((parseFloat($("#weight_input").val())*Actual_vs_Target)/100).toFixed(2);
							    						 
							    						if(weight_percentage_value!=0)
							    							$("#weight_percentage_input").val(weight_percentage_value+"%");
							    						$("#weight_percentage_input_hidden").val(weight_percentage_value);
							    				 
							    				}
							    			});
							     }
							   } 
							});  */
				
			}
		}); 
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
</script> 
</body>
</html>  