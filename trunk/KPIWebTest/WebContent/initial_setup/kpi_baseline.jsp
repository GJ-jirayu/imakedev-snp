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
        	src="<%=request.getContextPath()%>/dwr/interface/KPIAjax.js"></script>
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
 <!--  <div class="row-fluid"  style="position:fixed;"> 
     	<div class="span7"> -->
     	<div id="_content"  style="margin-left:3px;padding-top: 3px;width: 1100px">
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
    KPI Name: <input type="text" id="kpiName" style="width: 250px"/>
    </span> 
    <span style="padding-left:10px;">
     <input type="hidden" id="kpiCode_hidden"/>
     <input type="hidden" id="kpiName_hidden"/>
     <input type="text" id="kpiName_result" readonly="readonly" style="width: 400px"/>
    </span>
     <span style="padding-left:20px;">
    	<a class="btn btn-primary" style="font-size:12px" onclick="distplayKPIBaseline()"><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size: 12px;">Search</span></a>
    </span>   
  </div> 
   
  <!-- <div class="control-group">
    <div class="controls"> 
      <a class="btn btn-primary" ><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Submit</span></a>
    </div>
  </div> -->
</form>
<div id="dialog-confirmDelete" title="Delete UOM" style="display: none;background: ('images/ui-bg_highlight-soft_75_cccccc_1x100.png') repeat-x scroll 50% 50% rgb(204, 204, 204)">
	Are you sure you want to delete KPI Baseline ?
</div>
</td>
				</tr>
  			</table>
 </div>
 <div style="">
<table style="width: 1100px">
	<tr>
		<td>
<!-- <form id="dialog-Message_1"  class="well"  style="border:2px solid #B3D2EE;background: #F9F9F9;padding-top:20px;display: none;" action="" method="post" >
<div>
	 <div>KPI Name: <input class="input_snp" type="text"/>&nbsp;<a class="btn" style="position:absolute" >Search</a></div>  
	 <div style="padding: 10px">
  <table class="table table-hover table-striped table-bordered table-condensed" border="1" style="font-size: 12px">
        	<thead>
          		<tr> 
            		<th width="20%"><div class="th_class">KPI Code</div></th>
            		<th width="80%"><div class="th_class">KPI Name</div></th> 
          		</tr>
        	</thead>
        	<tbody>   
          	<tr onclick="setBaseline()" style="cursor: pointer;"> 
            	<td style="text-align: left;">KPI001</td>
            	<td>ยอดขายสินค้าเทียบเป้า</td> 
          	</tr>  
  		 </tbody>
   </table>
    </div>
  </div>
  </form> -->
  <div id="dialog-Message" style="display: block;padding-left: 3px;width: 1098px" >
  <form style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:0px;padding-bottom:8px" action="" method="post" >
<div> 
	 <div style="padding: 10px;overflow: auto;height: 415px;overflow-x:hidden" id="search_section">
  <!-- <table class="table table-hover table-striped table-bordered table-condensed" border="1" style="font-size: 12px">
        	<thead>
          		<tr> 
            		<th width="25%"><div class="th_class">Baseline ID</div></th>
            		<th width="25%"><div class="th_class">Begin Baseline</div></th> 
            		<th width="25%"><div class="th_class">End Baseline</div></th>
            		<th width="25%"><div class="th_class">Actual Score</div></th>
          		</tr>
        	</thead>
        	<tbody>   
          	<tr  style="cursor: pointer;"> 
            	<td style="text-align: right;">1</td>
            	<td style="text-align: right;">0.00</td>
            	<td style="text-align: right;">59.99</td>
            	<td style="text-align: right;">10</td> 
          	</tr>  
          	<tr  style="cursor: pointer;"> 
            	<td style="text-align: right;">2</td>
            	<td style="text-align: right;">60.00</td>
            	<td style="text-align: right;">79.99</td>
            	<td style="text-align: right;">30</td> 
          	</tr>  
          	<tr  style="cursor: pointer;"> 
            	<td style="text-align: right;">3</td>
            	<td style="text-align: right;">80.00</td>
            	<td style="text-align: right;">100.00</td>
            	<td style="text-align: right;">50</td> 
          	</tr>  
  		 </tbody>
   </table> -->
    </div>
  </div>
  </form>
  </div>
   <div id="dialog-form"  style="display: none;">
<form class="form-horizontal"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px" action="" method="post" >
   <input type="hidden" id="mode" /> 
  <div class="control-group" id="id_element">
    <label class="control-label">Baseline ID:</label>
    <div class="controls">
      <!-- <input class="input_snp" type="text" id="baselineID_input"> -->
      <input   type="text" id="baselineID_input">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Begin Baseline:</label>
    <div class="controls">
      <!-- <input class="input_snp"  type="text" id="begin_baseline_input" > -->
      <input   type="text" id="begin_baseline_input" >
    </div>
  </div> 
   <div class="control-group">
    <label class="control-label">End Baseline:</label>
    <div class="controls">
      <!-- <input class="input_snp"  type="text" id="end_baseline_input" > -->
      <input   type="text" id="end_baseline_input" >
    </div>
  </div> 
   <div class="control-group">
    <label class="control-label">Actual Score:</label>
    <div class="controls">
      <!-- <input class="input_snp"  type="text" id="actual_score_input" > -->
      <input   type="text" id="actual_score_input" >
    </div>
  </div> 
  <div class="control-group">
    <div class="controls"> 
      <a class="btn btn-primary" onclick="doSubmitAction()"><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Submit</span></a>
    </div>
  </div>
</form> 
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
	  
	
	/* $('#togle_emp').click(function() {
		 //$("#dialog-Message").slideDown("slow"); 
		  $('#dialog-Message_1').toggle('slow', function() {
		    // Animation complete.
		  });
		}); */ 
		//etl_flag = 'Y'
	 
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
	if ($.browser.msie){
	 $('#kpiCode').focus(); 
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
function distplayKPIBaseline(){
 	var kpiName =jQuery.trim($("#kpiName_hidden").val());
 	var kpiCode =jQuery.trim($("#kpiCode_hidden").val());
 	//alert(kpiCode+","+kpiName);
 	if(kpiName.length==0 && kpiCode.length==0){
 		alert("Please fill KPI Code or KPI Name.")
 	}
 		
 	//return false;
 	var kpiWhere=" where kpi_code='"+kpiCode+"'";
 /* 	var haveWhere=false;
 	  if(kpiName.length>0){     		
 		kpiWhere=kpiWhere+((haveWhere)?" and ":" where ")+" kpi_name like '%"+kpiName+"%'";
 		haveWhere=true; 
 	}
 	if(kpiCode.length>0){     		
 		kpiWhere=kpiWhere+((haveWhere)?" and ":" where ")+" kpi_code like '%"+kpiCode+"%'";
 		haveWhere=true; 
 	}  */
 	//alert(kpiWhere) 
 	var query="SELECT  kpi_code,baseline_id,begin_baseline,end_baseline,actual_score FROM "+SCHEMA_G+".kpi_baseline "+kpiWhere;
 	KPIAjax.searchObject(query,{
 		callback:function(data){
 			//alert(data)
 		
 			var str="<div align=\"left\" style=\"padding-bottom: 4px;width:1070px\"> <a class=\"btn\" onclick=\"showForm('add','0','0')\"><i class=\"icon-plus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Add</span></a></div>"+
 			 		"	  <table class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px;width:1070px\"> "+
 			        "	<thead> 	"+
 			        "  		<tr> "+
 			        " 			<th width=\"23%\"><div class=\"th_class\">Baseline ID</div></th>"+
 			        "   		<th width=\"23%\"><div class=\"th_class\">Begin Baseline</div></th>"+
 			        "   		<th width=\"23%\"><div class=\"th_class\">End Baseline</div></th>"+
 			        "   		<th width=\"23%\"><div class=\"th_class\">Actual Score</div></th>"+
 			        "    		<th width=\"8%\"><div class=\"th_class\"></div></th>     "+
 			        " 		</tr>"+
 			        "	</thead>"+
 			        "	<tbody>   "; 
 			  		
 			   if(data!=null && data.length>0){
 				   for(var i=0;i<data.length;i++){
 					   str=str+ "  	<tr style=\"cursor: pointer;\">"+
 				        "  		<td style=\"text-align: right;\"> "+data[i][1]+" </td>"+    
 				        "    	<td style=\"text-align: right;\">"+data[i][2]+"</td>  "+
 				       "    	<td style=\"text-align: right;\">"+data[i][3]+"</td>  "+  
 				       "    	<td style=\"text-align: right;\">"+data[i][4]+"</td>  "+  
 				        "    	<td style=\"text-align: center;\">"+
 				        "    	<i title=\"Edit\" onclick=\"showForm('edit','"+data[i][0]+"','"+data[i][1]+"')\" style=\"cursor: pointer;\" class=\"icon-edit\"></i>&nbsp;&nbsp;"+
 				        "    	<i title=\"Delete\" onclick=\"confirmDelete('"+data[i][0]+"','"+data[i][1]+"')\" style=\"cursor: pointer;\" class=\"icon-trash\"></i>"+
 				        "    	</td> "+
 				        "  	</tr>  ";
 				   }
 			   }else{
 				  var str="";
 				   if(kpiCode.length!=0)
 					  str=str+"<div align=\"left\" style=\"padding-bottom: 4px\"> <a class=\"btn\" onclick=\"showForm('add','0','0')\"><i class=\"icon-plus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Add</span></a></div>";
 			    str=str+"<table class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px;width:1070px\">"+
		    		"<thead>"+
		    		"<tr> "+
	      			"<th colspan=\"5\" width=\"100%\"><div class=\"th_class\">No Data</div></th>"+ 
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
function showForm(mode,id1,id2){
	 $("#baselineID_input").val("");
    $("#begin_baseline_input").val("");
    $("#end_baseline_input").val("");
    $("#actual_score_input").val("");
    $('#baselineID_input').attr('readonly', false);
    $("#mode").val(mode);
    var height_dialog=340;
    if ($.browser.msie){
    	height_dialog=360;
		}
	if(mode=='add'){
	//	$("#id_element").hide();
		$( "#dialog-form" ).dialog({ 
			position: 'top',
			 height: height_dialog,
			 width:727,
			modal: true,
			  hide: 'fold',
		      show: 'blind' 
		});
	}else{ //edit
		//$("#id_element").show(); 
		$('#baselineID_input').attr('readonly', true); 
		var kpiWhere=" where kpi_code='"+id1+"' and baseline_id='"+id2+"'";
		var query="SELECT  kpi_code,baseline_id,begin_baseline,end_baseline,actual_score FROM "+SCHEMA_G+".kpi_baseline "+kpiWhere;
	//	var query="SELECT * FROM "+SCHEMA_G+".uom where uom_id="+id;
		KPIAjax.searchObject(query,{
			callback:function(data){
				//alert(data); 
				 $("#baselineID_input").val(data[0][1]);
    $("#begin_baseline_input").val(data[0][2]);
    $("#end_baseline_input").val(data[0][3]);
    $("#actual_score_input").val(data[0][4]);
            /*   $("#uomID_form").val(data[0][0]);
              $("#uomName_form").val(data[0][1]); */
				$( "#dialog-form" ).dialog({ 
					position: 'top',
					 height: height_dialog,
					 width:727,
					modal: true,
					 hide: 'fold',
				     show: 'blind' 
				});
			}
		});
	}
	 
}function confirmDelete(id1,id2){
	$( "#dialog-confirmDelete" ).dialog({
		/* height: 140, */
		modal: true,
		buttons: {
			"Yes": function() { 
				$( this ).dialog( "close" );
				$("#mode").val('delete');
				doAction(id1,id2);
			},
			"No": function() {
				$( this ).dialog( "close" );
				return false;
			}
		}
	});
}
function doSubmitAction(){  
	var kpicode_hidden=jQuery.trim($("#kpiCode_hidden").val());
   var baselineID_input= jQuery.trim($("#baselineID_input").val());
   var begin_baseline_input= jQuery.trim($("#begin_baseline_input").val());
   var end_baseline_input= jQuery.trim($("#end_baseline_input").val());
   var actual_score_input= jQuery.trim($("#actual_score_input").val());
   
  /*  alert(floatRegex.test(begin_baseline_input));
   alert(floatRegex.test(end_baseline_input));
   alert(floatRegex.test(actual_score_input)); */
   if( !(intRegex.test(begin_baseline_input) || floatRegex.test(begin_baseline_input) ) || 
		   !(intRegex.test(end_baseline_input) || floatRegex.test(end_baseline_input) ) || 
		   !(intRegex.test(actual_score_input) || floatRegex.test(actual_score_input) ) ) {
       alert('Please fill Number !!!');  
       return false;
   }
	var mode=$("#mode").val();
	var query="";
	//var query="SELECT  kpi_code,baseline_id,begin_baseline,end_baseline,actual_score FROM "+SCHEMA_G+".kpi_baseline "+kpiWhere;
	 var queryCheck="SELECT * FROM "+SCHEMA_G+".kpi_baseline where ("+begin_baseline_input+" BETWEEN begin_baseline AND end_baseline  "+
	 " or  "+end_baseline_input+" BETWEEN begin_baseline AND end_baseline ) ";   
	 if(mode=='add'){
			query="insert into "+SCHEMA_G+".kpi_baseline set kpi_code='"+kpicode_hidden+"',baseline_id='"+baselineID_input+"',"+
			"begin_baseline="+begin_baseline_input+",end_baseline="+end_baseline_input+",actual_score="+actual_score_input+",created_dt=now(),updated_dt=now()";
			  queryCheck=queryCheck+"  and kpi_code ='"+kpicode_hidden+"'";
	}else {//edit
		  query="update  "+SCHEMA_G+".kpi_baseline set "+
			"begin_baseline="+begin_baseline_input+",end_baseline="+end_baseline_input+",actual_score="+actual_score_input+",updated_dt=now() where kpi_code='"+kpicode_hidden+"' and baseline_id='"+baselineID_input+"'"; 
		  queryCheck=queryCheck+" and baseline_id != '"+baselineID_input +"' and kpi_code ='"+kpicode_hidden+"'";
	} 
	  var begin_baseline_input_number= parseFloat(jQuery.trim($("#begin_baseline_input").val()));
	   var end_baseline_input_number= parseFloat(jQuery.trim($("#end_baseline_input").val()));
	   if(begin_baseline_input_number>=end_baseline_input_number){
		   alert("End Baseline must greater than Start Baseline !!!");
			return false;
	   }
	// alert("ss")
	 KPIAjax.searchObject(queryCheck,{
			callback:function(data){ 
				 if(data!=null && data.length>0){
					 alert("Begin Baseline และ End Baseline \n overlap กับข้อมูลที่มีในฐานข้อมูล");
				 }else{
					 KPIAjax.executeQuery(query,{
							callback:function(data){ 
								if(data!=0){
									distplayKPIBaseline(); 
									$( "#dialog-form" ).dialog("close");
								}else{
									alert("ไม่สามารถเพิ่มข้อมูลได้เนื่องจาก key ซ้ำ ");
								}
							}
						});
				 } 
			}
		});
	 
}
function doAction(id1,id2){ 
   var query="delete  FROM "+SCHEMA_G+".kpi_baseline where kpi_code='"+id1+"' and baseline_id='"+id2+"'";
		KPIAjax.executeQuery(query,{
			callback:function(data){
				if(data==0)
					alert("Can not delete because this record is in use.");
				distplayKPIBaseline();
			}
		}); 
}   
function setBaseline(){ 
	$("#kpi_code").val("KPI001");
	$("#kpi_name").val("ยอดขายสินค้าเทียบเป้า");
	$("#dialog-Message_1").slideUp("slow", function() {
	    // Animation complete.
		$("#dialog-Message_2").slideDown("slow"); 
	});
	
}

</script> 
</body>
</html>   
