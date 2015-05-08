<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %> 
<%@ include file="/WEB-INF/jsp/includes.jsp" %>  
<html> 
<head>
<title>BackOffice</title>
<!--  <meta charset="UTF-8" />   --> 
 <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <script  src="../resources/js/jquery-1.8.3.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="../resources/js/smoothness/jquery-ui-1.9.2.custom.min.js"></script>
 <script type="text/javascript" src="../resources/ckeditor/ckeditor.js"></script>
<script src="../resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="../resources/css/smoothness/jquery-ui-1.9.2.custom.css" type="text/css"  rel="stylesheet" /> 
<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"  type="text/css"/>
<link href="../resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet"  type="text/css"/>   
 <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="../resources/js/html5shiv.js"></script>
    <![endif]-->  
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
 form {
margin: 0 0 0px;
}
 </style>
<style type="text/css">
/*.th_class{font-family: Tahoma;font-size: 13px;text-align: center;*/
.th_class{text-align: center;
}
a{cursor: pointer;}
</style> 
</head> 
<body> 
  <!-- <div class="row-fluid"  style="position:fixed;"> 
     	<div class="span7"> --> 
     	<div id="_content"style="margin-left:3px;padding-top: 3px;width: 1100px"> 
     	<table style="width: 1100px;"><tr><td>
      		 <!--  <fieldset style="font-family: sans-serif;padding-top:0px;width: 1100px">   -->
      		  <form class="form-horizontal"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px" action="" method="post" >
 <div class="control-group">
    <label class="control-label">Data Source Name:</label>
    <div class="controls">
      <input class="input_snp" type="text"  id="dataSourceName"> <a class="btn btn-primary" onclick="searchDataSource()"><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size: 12px;">Search</span></a>
    </div> 
  </div> 
</form> 
<div id="dialog-confirmDelete" title="Delete Data Source" style="display: none;background: ('images/ui-bg_highlight-soft_75_cccccc_1x100.png') repeat-x scroll 50% 50% rgb(204, 204, 204)">
	Are you sure you want to delete Data Source ?
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
<!-- <div id="dialog-Message" style="margin-top:-15px; padding-top: 17px;display: block;height: 380px; overflow: auto;overflow-x:hidden" > -->
<!-- <div id="dialog-Message" style="display: none;padding-left: 3px;width: 1098px" >
<form  class="well"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;" action="" method="post" > -->
<div id="dialog-Message" style="display: block;padding-left: 3px;width: 1098px" >
<form     style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:0px;padding-bottom:8px" action="" method="post" >
<div title="Employee"> 
	 <div style="padding: 10px;overflow: auto;height: 350px;overflow-x:hidden" id="search_section">
	 
    </div>
  </div> 
  </form>
  </div>
  <div id="dialog-form"  style="display: none;">
<form class="form-horizontal"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px" action="" method="post" >
   <input type="hidden" id="mode" />
  <div class="control-group" id="id_element">
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
  </div>
</form> 
</div>
<!-- </fieldset> -->
</td>
	</tr>
  </table>
      	</div>
     	<!-- </div>
     </div>  -->
<%@ include file="/WEB-INF/jsp/schema.jsp" %> 
     <script type="text/javascript"> 
var _path='<%=request.getContextPath()%>'+'/'; 
var mail_toG;
var mail_subjectG;
var mail_messageG;
var mail_attachG;   
$(document).ready(function() {   
	$("#dataSourceName").keypress(function(event) {
  if ( event.which == 13 ) {
     event.preventDefault();
     searchDataSource();
   } 
});
	searchDataSource();
}); 
function searchDataSource(){
	var dataSourceName =jQuery.trim($("#dataSourceName").val());
	var dataSourceNameWhere="";
	if(dataSourceName.length>0)
		dataSourceNameWhere=" where data_source_name like '%"+dataSourceName+"%'";
	var query="SELECT * FROM "+SCHEMA_G+".data_source "+dataSourceNameWhere;
	KPIAjax.searchObject(query,{
		callback:function(data){
			var str="<div align=\"left\" style=\"padding-bottom: 4px;width:1070px\"> <a class=\"btn\" onclick=\"showForm('add','0')\"><i class=\"icon-plus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Add</span></a></div>"+
			 		"	  <table class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px;width:1070px\"> "+
			        "	<thead> 	"+
			        "  		<tr> "+
			        " 			<th width=\"10%\"><div class=\"th_class\">Data Source ID</div></th>"+
			        "   		<th width=\"82%\"><div class=\"th_class\">Data Source Name</div></th>"+ 
			        "    		<th width=\"8%\"><div class=\"th_class\"></div></th>     "+
			        " 		</tr>"+
			        "	</thead>"+
			        "	<tbody>   "; 
			  		
			   if(data!=null && data.length>0){
				   for(var i=0;i<data.length;i++){
					   str=str+ "  	<tr style=\"cursor: pointer;\">"+
				        "  		<td style=\"text-align: left;\"> "+data[i][0]+" </td>"+    
				        "    	<td style=\"text-align: left;\">"+data[i][1]+"</td>  "+   
				        "    	<td style=\"text-align: center;\">"+
				        "    	<i title=\"Edit\" onclick=\"showForm('edit','"+data[i][0]+"')\" style=\"cursor: pointer;\" class=\"icon-edit\"></i>&nbsp;&nbsp;"+
				        "    	<i title=\"Delete\" onclick=\"confirmDelete('"+data[i][0]+"')\" style=\"cursor: pointer;\" class=\"icon-trash\"></i>"+
				        "    	</td> "+
				        "  	</tr>  ";
				   }
			   }
			        str=str+  " </tbody>"+
					   "</table> "; 
			$("#search_section").html(str);
		}
	}); 
}
function showForm(mode,id){
	 $("#dataSourceID_form").val("");
     $("#dataSourceName_form").val("");
     $("#mode").val(mode);
	if(mode=='add'){
		$("#id_element").hide();
		$( "#dialog-form" ).dialog({ 
			 height: 195,
			 width:727,
			modal: true,
			  hide: 'fold',
		      show: 'blind' 
		});
	}else{ //edit
		$("#id_element").show(); 
		var query="SELECT * FROM "+SCHEMA_G+".data_source where data_source_id="+id;
		KPIAjax.searchObject(query,{
			callback:function(data){
				//alert(data); 
               $("#dataSourceID_form").val(data[0][0]);
               $("#dataSourceName_form").val(data[0][1]);
				$( "#dialog-form" ).dialog({ 
					 height: 245,
					 width:727,
					modal: true,
					 hide: 'fold',
				     show: 'blind' 
				});
			}
		});
	}
	 
}
function confirmDelete(id){
	$( "#dialog-confirmDelete" ).dialog({
		/* height: 140, */
		modal: true,
		buttons: {
			"Yes": function() { 
				$( this ).dialog( "close" );
				$("#mode").val('delete');
				doAction(id);
			},
			"No": function() {
				$( this ).dialog( "close" );
				return false;
			}
		}
	});
}
function doSubmitAction(){ 
    var dataSourceID=$("#dataSourceID_form").val();
    var dataSourceName=$("#dataSourceName_form").val();
	var mode=$("#mode").val();
	var query="";
	if(mode=='add'){
			query="insert into "+SCHEMA_G+".data_source set data_source_name='"+dataSourceName+"', created_dt=now(),updated_dt=now()";
	}else {//edit
		  query="update  "+SCHEMA_G+".data_source set data_source_name='"+dataSourceName+"',updated_dt=now() where data_source_id="+dataSourceID; 
	}
	KPIAjax.executeQuery(query,{
		callback:function(data){ 
			if(data!=0){
				searchDataSource(); 
				$( "#dialog-form" ).dialog("close");
			}
		}
	});
	 
}
function doAction(id){ 
   var query="delete  FROM "+SCHEMA_G+".data_source where data_source_id="+id;
		KPIAjax.executeQuery(query,{
			callback:function(data){
				searchDataSource();
			}
		}); 
}   
</script> 
</body>
</html>  