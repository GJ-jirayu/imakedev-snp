<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %> 
<%@ include file="/WEB-INF/jsp/includes.jsp" %>  
<html> 
<head>
<title>BackOffice</title>
<!--  <meta charset="UTF-8" />   --> 
 <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
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
                     <li id="maintenance_link"><a onclick="togle_page('kpi','maintenance_link')">KPI</a></li>
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
    <label class="control-label" for="inputEmail">KPI Code:</label>
    <div class="controls">
      <input class="input_snp" type="text" >
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">KPI Name:</label>
    <div class="controls">
      <input class="input_snp" type="text" >
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Objective:</label>
    <div class="controls">
      <input class="input_snp" type="text" >
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Formula:</label>
    <div class="controls">
      <input class="input_snp" type="text" >
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Perspective Name:</label>
    <div class="controls">
      <select>
      	<option>ด้านการเงิน</option>
      </select>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">UOM:</label>
    <div class="controls">
       <select>
      	<option>เปอร์เซ็น</option>
      </select>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Data Source:</label>
    <div class="controls">
       <select>
      	<option>Business Plus</option>
      </select>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label"><input type="checkbox"/> ETL Flag</label>
    <div class="controls">
     <!--  <input class="input_snp" type="text"> -->
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Query:</label>
    <div class="controls">
      <textarea cols="10" rows="4"></textarea>
    </div>
  </div>
  <div class="control-group">
    <div class="controls"> 
      <a class="btn btn-primary" ><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Submit</span></a>
    </div>
  </div>
</form> 
</fieldset>
      	</div>
     	</div>
     </div> 
     <script type="text/javascript">
//var _path="/KPIWebTest/";
var SCHEMA_G='mcic_kpi_app_test';
//var SCHEMA_G='FSD2';
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
	//listYear();
	//listDepartment();
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
			   var str="<select id=\"yearElement\" style=\"width: 75px\" onchange=\"listDepartment()\">";
			   str=str+"<option value=\"all\">All</option>";
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
			    str=str+"<option value=\"all\">All</option>";
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
			var str="<select id=\"positionElement\" onchange=\"listEmployee()\">";
			str=str+"<option value=\"all\">All</option>";
			if(data!=null && data.length>0){ 
				for(var i=0;i<data.length;i++){
					str=str+"<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
				} 
			}
			str=str+"</select>";
			$("#positionSelection").html(str);
			listEmployee(); 
		}
    });
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
			distplayApproveKPIResult();
		}
 });
}
function distplayApproveKPIResult(){
	 var year=$("#yearElement").val();
	 var employeeCode=$("#employeeElement").val();
	 var periodNo=$("#periodElement").val();
	 var etl_flag='N';
	 var approved_flag='N';
	//alert("a") 
	KPIAjax.searchKPI(year,  periodNo,employeeCode, etl_flag, approved_flag,{
		callback:function(data){
			//alert(data);
			 
			if(data!=null && data.length>0){
			    var str="<table class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px\">"+
			    		"<thead>"+
			    		"<tr> "+ 
	            		"<th width=\"5%\"><div class=\"th_class\"></div></th>"+
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
				//for(var z=0;z<10;z++){
					//var i=0;
					str=str+
					"<tr style=\"cursor: pointer;\">"+
	          		"<td style=\"text-align: left;\">"+
	          		"<input type=\"hidden\" name=\"year_input\" value=\""+data[i].year+"\" />"+
	          		"<input type=\"hidden\" name=\"period_no_input\" value=\""+data[i].periodNo+"\" />"+
	          		"<input type=\"hidden\" name=\"employee_code_input\" value=\""+data[i].employeeCode+"\" />"+
	          		"<input type=\"hidden\" name=\"kpi_code_input\" value=\""+data[i].kpiCode+"\" />"+ 
	          		"<input type=\"checkbox\" name=\"kpi_result_id\" value=\""+data[i].year+"_"+data[i].periodNo+"_"+data[i].employeeCode+"_"+data[i].kpiCode+"\" />"+
	          		"</td>"+
	            	"<td style=\"text-align: left;\">"+data[i].employeeCode+"</td>"+
	            	"<td>"+data[i].empName+"</td> "+
	            	"<td style=\"text-align: left;\">"+data[i].kpiCode+"</td>"+
	            	"<td>"+data[i].kpiName+"</td> "+
	            	"<td style=\"text-align: right;\">"+(data[i].targetScore!=null?data[i].targetScore:"")+"</td>  "+
	            	"<td style=\"text-align: right;\">"+(data[i].actualScore!=null?data[i].actualScore:"")+"</td>  "+
	          	"</tr>  ";
				}
				str=str+"</tbody> </table>";
				
				$("#employee_section").html(str);  
				$("#dialog-Message").slideDown("slow");
			}else{
			    $("#dialog-Message").slideUp("slow");
			}
			 
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
			KPIAjax.approveKPIResult(yearArray
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
 
</script> 
</body>
</html>    
