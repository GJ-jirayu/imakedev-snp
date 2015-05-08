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
 form {
margin: 0 0 0px;
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
</head> 
<body> 
<!--   <div class="row-fluid"  style="position:fixed;"> 
     	<div class="span7"> -->
     	<div id="_content"  style="margin-left:3px;padding-top: 3px;width: 1100px">
     	<table style="width: 1100px;"><tr><td>
      		 <!--  <fieldset style="font-family: sans-serif;padding-top:0px;width: 1048px"> -->  
      		  <form class="form-horizontal"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px" action="" method="post" >
 <div class="control-group">
    <label class="control-label">UOM Name:</label>
    <div class="controls">
      <input class="input_snp" type="text"  id="uomName"> <a class="btn btn-primary" onclick="searchUOM()"><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Search</span></a>
    </div> 
  </div> 
</form> 
<div id="dialog-confirmDelete" title="Delete UOM" style="display: none;background: ('images/ui-bg_highlight-soft_75_cccccc_1x100.png') repeat-x scroll 50% 50% rgb(204, 204, 204)">
	Are you sure you want to delete UOM ?
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
	 <div style="padding: 10px;overflow: auto;height: 450px;overflow-x:hidden" id="search_section">
	 
    </div>
  </div> 
  </form>
  </div>
  <div id="dialog-form"  style="display: none;">
<form class="form-horizontal"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px" action="" method="post" >
   <input type="hidden" id="mode" />
  <div class="control-group" id="id_element">
    <label class="control-label" for="inputEmail">UOM ID:</label>
    <div class="controls">
      <input class="input_snp" type="text" id="uomID_form" readonly="readonly">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">UOM Name:</label>
    <div class="controls">
      <input class="input_snp"  type="text" id="uomName_form" >
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
//var SCHEMA_G='mcic_kpi_app_test'; 
var _path='<%=request.getContextPath()%>'+'/'; 
var mail_toG;
var mail_subjectG;
var mail_messageG;
var mail_attachG;   
$(document).ready(function() {   
	$("#uomName").keypress(function(event) {
  if ( event.which == 13 ) {
     event.preventDefault();
     searchUOM();
   } 
});
	$( "#uomName" ).autocomplete({
		  source: function( request, response ) { 
				var query="SELECT uom_id,uom_name FROM "+SCHEMA_G+".uom where uom_name like '%"+request.term+"%'";
			   
				KPIAjax.listMaster(query,{
					callback:function(data){ 
						if(data!=null && data.length>0){
							response( $.map( data, function( item ) {
					          return {
					        	  label: item.name,
					        	  value: item.name
					            //label: item.name + (item.adminName1 ? ", " + item.adminName1 : "") + ", " + item.countryName,
					            //value: item.name 
					          }
					        }));
						}else{
							var xx=[];
							//alert("not have data")
							response( $.map(xx));
						}
					}
			 }); 
		  },
		  minLength: 2,
		  select: function( event, ui ) { 
			  this.value = ui.item.label;
			 // $("#employeeElement").val(ui.item.value);
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
		 $('#uomName').focus(); 
		}
	//searchUOM();
}); 
function searchUOM(){
	var uomName =jQuery.trim($("#uomName").val());
	var uomNameWhere="";
	if(uomName.length>0)
		uomNameWhere=" where uom_name like '%"+uomName+"%'";
	var query="SELECT * FROM "+SCHEMA_G+".uom "+uomNameWhere;
	KPIAjax.searchObject(query,{
		callback:function(data){
			var str="<div align=\"left\" style=\"padding-bottom: 4px\"> <a class=\"btn\" onclick=\"showForm('add','0')\"><i class=\"icon-plus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Add</span></a></div>"+
			 		"	  <table class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px\"> "+
			        "	<thead> 	"+
			        "  		<tr> "+
			        " 			<th width=\"10%\"><div class=\"th_class\">UOM ID</div></th>"+
			        "   		<th width=\"82%\"><div class=\"th_class\">UOM Name</div></th>"+ 
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
			   }else{
				   var str="<div align=\"left\" style=\"padding-bottom: 4px\"> <a class=\"btn\" onclick=\"showForm('add','0')\"><i class=\"icon-plus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Add</span></a></div>"+
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
function showForm(mode,id){
	 $("#uomID_form").val("");
     $("#uomName_form").val("");
     $("#mode").val(mode);
	if(mode=='add'){
		$("#id_element").hide();
		$( "#dialog-form" ).dialog({ 
			position: 'top',
			 height: 195,
			 width:727,
			modal: true,
			  hide: 'fold',
		      show: 'blind' 
		});
	}else{ //edit
		$("#id_element").show(); 
		var query="SELECT * FROM "+SCHEMA_G+".uom where uom_id="+id;
		KPIAjax.searchObject(query,{
			callback:function(data){
				//alert(data); 
               $("#uomID_form").val(data[0][0]);
               $("#uomName_form").val(data[0][1]);
				$( "#dialog-form" ).dialog({ 
					position: 'top',
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
    var uomID=$("#uomID_form").val();
    var uomName=jQuery.trim($("#uomName_form").val());
    if(!uomName.length>0){
    	alert("UOM Name must not empty.");
    	return false;
    }
	var mode=$("#mode").val();
	var query="";
	if(mode=='add'){
			query="insert into "+SCHEMA_G+".uom set uom_name='"+uomName+"', created_dt=now(),updated_dt=now()";
	}else {//edit
		  query="update  "+SCHEMA_G+".uom set uom_name='"+uomName+"',updated_dt=now() where uom_id="+uomID; 
	}
	KPIAjax.executeQuery(query,{
		callback:function(data){ 
			if(data!=0){
				searchUOM(); 
				$( "#dialog-form" ).dialog("close");
			}
		}
	});
	 
}
function doAction(id){ 
   var query="delete  FROM "+SCHEMA_G+".uom where uom_id="+id;
		KPIAjax.executeQuery(query,{
			callback:function(data){
				if(data==0)
					alert("Can not delete because this record is in use.");
				searchUOM();
			}
		}); 
}   
</script> 
</body>
</html>  