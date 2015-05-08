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
        	<style>
 .ui-datepicker-trigger{
 cursor: pointer;
 }
</style>
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
.input_number{
width:50px;
text-align: right;
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
</style>
<!-- <style type="text/css"> 
th{ font-family:Tahoma; font-size:12px; font-weight:bold;
 color: #fff;background:url(/MISSExamBackOffice/resources/images/tr_back-theme1.gif) repeat-x scroll 0 0 #80838A;padding: 5px 8px;border:1px solid #fff; 
} 
</style> -->  

</head> 
<body> <!-- 
  <div class="row-fluid"  style="position:fixed;"> 
     	<div class="span7"> -->
     	<div id="_content" style="margin-left:3px;padding-top: 3px;width: 1100px"> 
      		 <!-- <fieldset style="font-family: sans-serif;padding-top:0px;width: 1048px">   -->
      		 <table style="width: 1100px;">
     			<tr>
     				<td>
<form class="form-inline"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;padding-bottom:15px" action="" method="post" >
 <div  style="padding-left:20px"> 
  	<span style="padding-left:10px;">
    Year: <input type="text" id="year" class="input_number" />
    </span> 
     <span style="padding-left:10px;">
    Period No: <input type="text" id="periodNo" class="input_number"/>
    </span> 
     <span style="padding-left:10px;">
    Description: <input type="text" id="periodDesc" style="width: 300px"/>
    </span> 
    <span style="padding-left:10px;">
     <input type="hidden" id="periodNo_hidden"/>
     <input type="hidden" id="periodDesc_hidden"/>
    <!--  <input type="text" id="periodDesc_result" readonly="readonly" style="width: 300px"/> -->
    </span>
     <span style="padding-left:20px;">
    	<a class="btn btn-primary" style="font-size:12px" onclick="distPlayPeriod()"><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size: 12px;">Search</span></a>
    </span>   
  </div>  
</form> 
<div id="dialog-confirmDelete" title="Delete Appraisal Period" style="display: none;background: ('images/ui-bg_highlight-soft_75_cccccc_1x100.png') repeat-x scroll 50% 50% rgb(204, 204, 204)">
	Are you sure you want to delete Appraisal Period ?
</div>
<div id="dialog-Message-alert" title="Message" style="display: none;background: ('images/ui-bg_highlight-soft_75_cccccc_1x100.png') repeat-x scroll 50% 50% rgb(204, 204, 204)">
	<span id="_message_show"></span>
</div>
</td>
				</tr>
  			</table>
 </div>
  <div style="">
<table style="width: 1100px">
	<tr>
		<td>
<!-- <div id="dialog-Message" style="margin-top:-15px; display: block;height: 300px; overflow: auto;overflow-x:hidden" >
<form  class="well"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;" action="" method="post" > -->
<div id="dialog-Message" style="display: block;padding-left: 3px;width: 1098px" >
<form     style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:0px;padding-bottom:8px" action="" method="post" >
<div> 
	 <div style="padding: 10px;overflow: auto;height: 430px;overflow-x:hidden" id="search_section">
	 
    </div>
  </div> 
  </form>
  </div>
  <div id="dialog-form"  style="display: none;">
<form class="form-horizontal"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px" action="" method="post" >
   <input type="hidden" id="mode" />
  <div class="control-group" id="id_element">
    <label class="control-label">Year:</label>
    <div class="controls">
      <input class="input_number" type="text"   id="year_input" />
    </div>
  </div>
  <div class="control-group">
    <label class="control-label"> Period No:</label>
    <div class="controls">
      <input class="input_number"  type="text"  id="period_no_input" />
    </div>
  </div> 
  <div class="control-group">
    <label class="control-label"> Description:</label>
    <div class="controls">
      <input class="input_snp"  type="text"  id="period_desc_input" style="width: 400px"/>
    </div>
  </div>
   <div class="control-group">
    <label class="control-label">Start Date:</label>
    <div class="controls">
      <input type="text" id="start_date" name="start_date" readonly="readonly" style="width: 100px"/>
    </div>
  </div> 
   <div class="control-group">
    <label class="control-label">End Date:</label>
    <div class="controls">
      <input type="text" id="end_date" name="end_date" readonly="readonly"  style="width: 100px"/>
    </div>
  </div> 
  <div class="control-group">
    <div class="controls"> 
      <a class="btn btn-primary" onclick="doSubmitAction()"><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Submit</span></a>
    </div>
  </div>
</form> 
</div>
<!-- </fieldset> -->
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
	
	$( "#periodDesc" ).autocomplete({
		  source: function( request, response ) {  
			  var periodWhere=""; 
				var periodNo =jQuery.trim($("#periodNo").val());
				var year =jQuery.trim($("#year").val());
			    if(year.length>0)
			    	periodWhere=periodWhere+" and year like  '%"+year+"%'   ";	
			    if(periodNo.length>0)
			    	periodWhere=periodWhere+" and period_no like  '%"+periodNo+"%'   ";	
				var query="SELECT period_no,period_desc  FROM "+SCHEMA_G+".period where period_desc like '%"+request.term+"%'   "+periodWhere;		
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
			   $("#periodDesc").val(ui.item.label);
			  /*  $("#employeeCode").val("");
			   
			   $("#employeeCode_hidden").val(ui.item.value);
			   $("#employeeName_hidden").val(ui.item.label);  */
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
		 $('#year').focus(); 
		}
}); 
  
function distPlayPeriod(){ 

	var year =jQuery.trim($("#year").val());
	var periodNo =jQuery.trim($("#periodNo").val());
	var periodDesc =jQuery.trim($("#periodDesc").val()); 
	var periodWhere=""; 
	var haveWhere=false;
	if(year.length>0){
		if(haveWhere)
			periodWhere=periodWhere+" and  year like '%"+year+"%'";
		else
			periodWhere=periodWhere+" where  year like '%"+year+"%'";
		haveWhere=true; 
	}
	if(periodNo.length>0){
		if(haveWhere)
			periodWhere=periodWhere+" and  period_no like '%"+periodNo+"%'";
		else
			periodWhere=periodWhere+" where  period_no like '%"+periodNo+"%'";
		haveWhere=true; 
	} 
	if(periodDesc.length>0){
		if(haveWhere)
			periodWhere=periodWhere+" and  period_desc like '%"+periodDesc+"%'";
		else
			periodWhere=periodWhere+" where  period_desc like '%"+periodDesc+"%'";
		haveWhere=true; 
	}  
	var query="SELECT year,period_no,period_desc,start_date,end_date FROM "+SCHEMA_G+".period "+periodWhere;
	KPIAjax.searchObject(query,{
		callback:function(data){
			var str="<div align=\"left\" style=\"padding-bottom: 4px\"> <a class=\"btn\" onclick=\"showForm('add','0')\"><i class=\"icon-plus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Add</span></a></div>"+
			 		"	  <table class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px\"> "+
			        "	<thead> 	"+
			        "  		<tr> "+
			        " 			<th width=\"5%\"><div class=\"th_class\">Year</div></th>"+
			        "   		<th width=\"8%\"><div class=\"th_class\">Period No</div></th>"+
			        //"   		<th width=\"32%\"><div class=\"th_class\">Period Name</div></th>"+ 
			        "   		<th width=\"61%\"><div class=\"th_class\">Description</div></th>"+
			        "   		<th width=\"8%\"><div class=\"th_class\">Start Date</div></th>"+ 
			        "   		<th width=\"8%\"><div class=\"th_class\">End Date</div></th>"+ 
			        "    		<th width=\"5%\"><div class=\"th_class\"></div></th>     "+
			        " 		</tr>"+
			        "	</thead>"+
			        "	<tbody>   "; 
			        
			   if(data!=null && data.length>0){
				   for(var i=0;i<data.length;i++){
					   str=str+ "  	<tr style=\"cursor: pointer;\">"+
				        "  		<td style=\"text-align: center;\"> "+data[i][0]+" </td>"+    
				        "    	<td style=\"text-align: center;\">"+data[i][1]+"</td>  "+
				        "    	<td style=\"text-align: left;\">"+data[i][2]+"</td>  "+   
				        "    	<td style=\"text-align: center;\">"+$.datepicker.formatDate('dd/mm/yy', data[i][3])+"</td>  "+   
				        "    	<td style=\"text-align: center;\">"+$.datepicker.formatDate('dd/mm/yy', data[i][4])+"</td>  "+   
				        "    	<td style=\"text-align: center;\">"+
				        "    	<i title=\"Edit\" onclick=\"showForm('edit','"+data[i][0]+"','"+data[i][1]+"')\" style=\"cursor: pointer;\" class=\"icon-edit\"></i>&nbsp;&nbsp;"+
				        "    	<i title=\"Delete\" onclick=\"confirmDelete('"+data[i][0]+"','"+data[i][1]+"')\" style=\"cursor: pointer;\" class=\"icon-trash\"></i>"+
				        "    	</td> "+
				        "  	</tr>  ";
				   }
			   }else{
				   var str="<div align=\"left\" style=\"padding-bottom: 4px\"> <a class=\"btn\" onclick=\"showForm('add','0','0')\"><i class=\"icon-plus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Add</span></a></div>"+
			    "<table class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px;width:1070px\">"+
		    		"<thead>"+
		    		"<tr> "+
	      			"<th colspan=\"3\" width=\"100%\"><div class=\"th_class\">No Data</div></th>"+ 
	      		"</tr>"+
	    	"</thead>"+
	    	"<tbody>"; 
			   }
			        str=str+  " </tbody>"+
					   "</table> "; 
			$("#search_section").html(str);
		}
	}); 
}
function showForm(mode,id_year,id_period){
	//year_input period_no_input period_desc_input start_date end_date
	 $("#year_input").val("");
     $("#period_no_input").val("");
     $("#period_desc_input").val("");
     $("#start_date").val("");
     $("#end_date").val("");
     $('#year_input').attr('readonly', false);
     $('#period_no_input').attr('readonly', false);
     $("#mode").val(mode);
     var height_dialog=382;
     if ($.browser.msie)
    	 height_dialog=420;
     
	if(mode=='add'){
		//$("#id_element").hide();
		$( "#dialog-form" ).dialog({ 
			position: 'top',
			 //height: 382,
			 height:height_dialog,
			 width:727,
			modal: true,
			  hide: 'fold',
		      show: 'blind' 
		});
	}else{ //edit
		//$("#id_element").show(); 
		 $('#year_input').attr('readonly', true);
	     $('#period_no_input').attr('readonly', true);
	     // var query="SELECT year,period_no,period_desc,start_date,end_date FROM "+SCHEMA_G+".period "+periodWhere;
		var query="SELECT year,period_no,period_desc,start_date,end_date FROM "+SCHEMA_G+".period where year="+id_year+" and period_no="+id_period;
		KPIAjax.searchObject(query,{
			callback:function(data){
				 $("#year_input").val(data[0][0]);
			     $("#period_no_input").val(data[0][1]);
			     $("#period_desc_input").val(data[0][2]);
			     $("#start_date").val($.datepicker.formatDate('dd/mm/yy', data[0][3]));
			     $("#end_date").val($.datepicker.formatDate('dd/mm/yy', data[0][4]));
			     
				$( "#dialog-form" ).dialog({ 
					position: 'top',
					// height: 382,
					height:height_dialog,
					 width:727,
					modal: true,
					 hide: 'fold',
				     show: 'blind' 
				});
			}
		});
	}
	 
}
function confirmDelete(id_year,id_period){
	$( "#dialog-confirmDelete" ).dialog({
		/* height: 140, */
		modal: true,
		buttons: {
			"Yes": function() { 
				$( this ).dialog( "close" );
				$("#mode").val('delete');
				doAction(id_year,id_period);
			},
			"No": function() {
				$( this ).dialog( "close" );
				return false;
			}
		}
	});
}
function doSubmitAction(){ 
	var year_input= jQuery.trim($("#year_input").val());
    var period_no_input= jQuery.trim($("#period_no_input").val());
    var period_desc_input=jQuery.trim( $("#period_desc_input").val());
    var start_date=jQuery.trim( $("#start_date").val());
    var end_date= jQuery.trim($("#end_date").val());
	var mode=$("#mode").val();
	
	if(!(intRegex.test(year_input) || floatRegex.test(year_input))) {
        alert('Please fill Number !!!'); 
        return false;
     }
	if(year_input.length!=4) {
        alert('Please fill Number 4 digits !!!'); 
        return false;
     }
	if(!(intRegex.test(period_no_input) || floatRegex.test(period_no_input))) {
        alert('Please fill Number !!!'); 
        return false;
     }
	if(start_date.length==0) {
        alert('Please fill Start Date !!!'); 
        return false;
     }
	if(end_date.length==0) {
        alert('Please fill End Date !!!'); 
        return false;
     } 
	var start_date_array=start_date.split("/");
	var end_date_array=end_date.split("/");
	var start_date_formated=start_date_array[2]+"-"+start_date_array[1]+"-"+start_date_array[0];
	var end_date_formated=end_date_array[2]+"-"+end_date_array[1]+"-"+end_date_array[0];
	
	var  startDate = new Date(start_date_array[2], start_date_array[1]-1, start_date_array[0]);
	var  endDate = new Date(end_date_array[2], end_date_array[1] -1, end_date_array[0]);
	//alert("startDate="+startDate)
	// alert("endDate="+endDate)
    if(endDate<startDate){
    	alert(' End Date must greater than Start Date !!!'); 
    	return false;
    }
	//alert(start_date_formated);
	//return false;
	var query="";
	 var queryCheck="SELECT * FROM "+SCHEMA_G+".period where ('"+start_date_formated+"' BETWEEN start_date AND end_date  "+
	 " or  '"+end_date_formated+"' BETWEEN start_date AND end_date ) ";   
	var queryCheckDuplicate=""; 
	if(mode=='add'){
			query="insert into "+SCHEMA_G+".period set year="+year_input+",period_no="+period_no_input+",period_desc='"+period_desc_input+"',"+
			" start_date='"+start_date_formated+"', end_date='"+end_date_formated+"', created_dt=now(),updated_dt=now()";
			 queryCheck=queryCheck+"  and year ="+year_input; 
			 queryCheckDuplicate=" SELECT * FROM "+SCHEMA_G+".period    where year ="+year_input+" and period_no="+period_no_input;
	}else {//edit
		  query="update  "+SCHEMA_G+".period set period_desc='"+period_desc_input+"' ,start_date='"+start_date_formated+"', end_date='"+end_date_formated+"'"+
		  ",updated_dt=now() where year="+year_input+" and period_no="+period_no_input; 
		  queryCheck=queryCheck+"  and year ="+year_input+" and period_no!="+period_no_input; 
	}
	if(queryCheckDuplicate.length>0){
		KPIAjax.searchObject(queryCheckDuplicate,{
			callback:function(data){ 
				 if(data!=null && data.length>0){
						alert("ไม่สามารถเพิ่มข้อมูลได้เนื่องจาก key ซ้ำ ");
				 }else{
					 doSubmit(queryCheck,query);
				 } 
			}
		});
	}else{
		doSubmit(queryCheck,query);
	}
	
	 
}
function doSubmit(queryCheck,query){
	KPIAjax.searchObject(queryCheck,{
		callback:function(data){ 
			 if(data!=null && data.length>0){
				 alert("Start Date และ End Date \n overlap กับข้อมูลที่มีในฐานข้อมูล");
			 }else{
				 KPIAjax.executeQuery(query,{
						callback:function(data){ 
							if(data!=0){
								distPlayPeriod(); 
								$( "#dialog-form" ).dialog("close");
							}
						}
					});
			 } 
		}
	});
}
function doAction(id_year,id_period){ 
   var query="delete  FROM "+SCHEMA_G+".period where year="+id_year+" and period_no="+id_period;
		KPIAjax.executeQuery(query,{
			callback:function(data){
				if(data==0)
					alert("Can not delete because this record is in use.");
				distPlayPeriod();
			}
		}); 
}   
  
 
</script> 
</body>
</html>  
 