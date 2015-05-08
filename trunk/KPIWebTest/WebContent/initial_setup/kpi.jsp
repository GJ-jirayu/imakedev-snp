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
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/smoothness/jquery-ui-1.9.2.custom.min.js"></script>
 <script type="text/javascript" src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js"></script>
 <script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
<link href="<%=request.getContextPath()%>/resources/css/smoothness/jquery-ui-1.9.2.custom.css" type="text/css"  rel="stylesheet" /> 
<link href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"  type="text/css"/>
<link href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet"  type="text/css"/>    
 
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
<body> 
  <!-- <div class="row-fluid"  style="position:fixed;"> 
     	<div class="span7"> -->
     		<div id="_content"  style="margin-left:3px;padding-top: 3px;width: 1100px">
     		<table style="width: 1100px;">
     			<tr>
     				<td>
   <form class="form-inline"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;padding-bottom:15px" action="" method="post" >
 <div  style="padding-left:20px">
      <span style="padding-left:10px;">
       
    KPI Code: <input type="text" id="kpiCode" style="width: 100px"/>
    </span> 
     <span style="padding-left:10px;">
    KPI Name: <input type="text" id="kpiName" style="width: 400px"/>
    </span> 
      <span style="padding-left:20px;">
    	<a class="btn btn-primary" style="font-size:12px" onclick="searchKPI()"><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size: 12px;">Search</span></a>
    </span>
  </div> 
</form> 
<div id="dialog-confirmDelete" title="Delete KPI Name" style="display: none;background: ('images/ui-bg_highlight-soft_75_cccccc_1x100.png') repeat-x scroll 50% 50% rgb(204, 204, 204)">
	Are you sure you want to delete KPI ?
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
		<div id="dialog-Message" style="display: block;padding-left: 3px;width: 1098px" >
<form   style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:0px;padding-bottom:8px" action="" method="post" >
<div> 
	 <div style="padding: 10px;overflow: auto;height: 415px;overflow-x:hidden" id="search_section">	
    </div>
  </div> 
  </form>
  </div>
     	<!-- <div id="_content" class="span7" style="margin-left:-8px;padding-top: 3px;">
      		  <fieldset style="font-family: sans-serif;padding-top:0px;width: 1048px">   -->
<div id="dialog-form"  style="display: none;">
<form class="form-horizontal"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;" action="" method="post" > 
<input type="hidden" id="mode" />
 <table style="width: 100%">
 	<tr>
 		<td>
 		 <span style="padding-left:20px">KPI Code: </span><span><input class="input_snp" type="text" id="kpi_code_input" /></span>
 		</td>
 		<td>
 		<span>KPI Name: </span><span><input class="input_snp" type="text" id="kpi_name_input"/></span>
 		</td>
 	<tr>
 	<tr>
 		<td>
 		  <span style="padding-left:20px">Objective: </span><span> <input class="input_snp" type="text" id="kpi_objective_input"/></span>
 		</td>
 		<td>
 		 <span>Formula:  </span><span  style="padding-left:9px"><input class="input_snp" type="text" id="kpi_formula_input"/></span>
 		</td>
 	<tr>
 	<tr>
 		<td colspan="2">
 		  <span style="padding-left:20px">Perspective Name:  </span><span id="perspectiveName_select"></span>
 		 
 		</td>
 	<tr>
 	<tr>
 		<td colspan="2">
 		  
 		  <span  style="padding-left:20px">UOM:  </span><span style="padding-left:72px" id="uom_select"></span> 
 		</td>
 	<tr>
 	<tr>
 		<td colspan="2"> 
 		  <span  style="padding-left:20px">Data Source:  </span><span  style="padding-left:32px" id="dataSource_select"></span>
 		</td>
 	<tr>
 	<tr>
 		<td align="left" colspan="2" >
 		  <span style="padding-left:20px"><input type="checkbox" id="etl_flag_input"/> ETL Flag</span>
 		 
 		</td>
 		 
 	<tr>
 	<tr valign="top">
 		<td align="left" colspan="2" valign="top"> 
 		   <span style="padding-left:20px;">Query:  </span><span> <textarea cols="10" rows="4" id="sql_statement_input"></textarea></span>
 		</td>
 		 
 	<tr>
 	<tr>
 		<td align="center" colspan="2" >
 		  <span><a class="btn btn-primary"  onclick="doSubmitAction()"><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Submit</span></a></span>
 
 		</td>
 	<tr>
 	
 </table>
    <!-- <div class="control-group">
    <label class="control-label">KPI Code:</label>
    <div class="controls">
      <input class="input_snp" type="text" id="kpi_code_input"/>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">KPI Name:</label>
    <div class="controls">
      <input class="input_snp" type="text" id="kpi_name_input"/>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Objective:</label>
    <div class="controls">
      <input class="input_snp" type="text" id="kpi_objective_input"/>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Formula:</label>
    <div class="controls">
      <input class="input_snp" type="text" id="kpi_formula"/>
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
    <label class="control-label"><input type="checkbox" id="etl_flag_input"/> ETL Flag</label>
    <div class="controls"> 
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Query:</label>
    <div class="controls">
      <textarea cols="10" rows="4" id="sql_statement_input"></textarea>
    </div>
  </div>
   
  <div class="control-group">
    <div class="controls"> 
      <a class="btn btn-primary"  onclick="doSubmitAction()"><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Submit</span></a>
    </div>
  </div>
  -->
</form> 
</div>
</td>
	</tr>
  </table>
      	</div> 
<!-- </fieldset>
      	</div>
     	</div>
     </div>  -->
 <%@ include file="/WEB-INF/jsp/schema.jsp" %>
     <script type="text/javascript"> 
     var _path='<%=request.getContextPath()%>'+'/'; 
     var mail_toG;
     var mail_subjectG;
     var mail_messageG;
     var mail_attachG;   
     $(document).ready(function() {   
     	$("#kpiName").keypress(function(event) {
       if ( event.which == 13 ) {
          event.preventDefault();
          searchKPI();
        } 
     });
     	$("#kpiCode").keypress(function(event) {
            if ( event.which == 13 ) {
               event.preventDefault();
               searchKPI();
             } 
          });
     	$( "#kpiName" ).autocomplete({
  		  source: function( request, response ) { 
  				var query="SELECT kpi_code,kpi_name FROM "+SCHEMA_G+".kpi where kpi_name like '%"+request.term+"%'";
  			   
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
     	$( "#kpiCode" ).autocomplete({
  		  source: function( request, response ) { 
  			var query="SELECT kpi_code,kpi_name FROM "+SCHEMA_G+".kpi where kpi_code like '%"+request.term+"%'";
  				KPIAjax.listMaster(query,{
  					callback:function(data){ 
  						if(data!=null && data.length>0){
  							response( $.map( data, function( item ) {
  					          return {
  					        	  label: item.id,
  					        	  value: item.id
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
    		 $('#kpiCode').focus(); 
    		} 
     	//searchKPI();
     }); 
     function searchKPI(){
     	var kpiName =jQuery.trim($("#kpiName").val());
     	var kpiCode =jQuery.trim($("#kpiCode").val());
     	var kpiWhere="";
     	var haveWhere=false;
     	  if(kpiName.length>0){     		
     		kpiWhere=kpiWhere+((haveWhere)?" and ":" where ")+" kpi_name like '%"+kpiName+"%'";
     		haveWhere=true; 
     	}
     	if(kpiCode.length>0){     		
     		kpiWhere=kpiWhere+((haveWhere)?" and ":" where ")+" kpi_code like '%"+kpiCode+"%'";
     		haveWhere=true; 
     	} 
     	//alert(kpiWhere)
     		
     	var query="SELECT * FROM "+SCHEMA_G+".kpi "+kpiWhere;
     	KPIAjax.searchObject(query,{
     		callback:function(data){
     			//alert(data)
     		
     			var str="<div align=\"left\" style=\"padding-bottom: 4px;width:1070px\"> <a class=\"btn\" onclick=\"showForm('add','0')\"><i class=\"icon-plus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">Add</span></a></div>"+
     			 		"	  <table class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px;width:1070px\"> "+
     			        "	<thead> 	"+
     			        "  		<tr> "+
     			        " 			<th width=\"10%\"><div class=\"th_class\">KPI Code</div></th>"+
     			        "   		<th width=\"82%\"><div class=\"th_class\">KPI Name</div></th>"+ 
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
     	//$("#dataSourceID_form").val("");
        //$("#kpiName_form").val("");  
          var query="select * FROM  "+SCHEMA_G+".perspective";    	 
    		KPIAjax.listMaster(query,{
    			callback:function(data){ 
    				var str="<select id=\"perspective_input\">";
    				// str=str+"<option value=\"all\">All</option>";
    				if(data!=null && data.length>0){ 
    					for(var i=0;i<data.length;i++){
    						str=str+"<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
    					} 
    				}
    				str=str+"</select>";
    				$("#perspectiveName_select").html(str);
    				 query="select * FROM  "+SCHEMA_G+".uom";  
    				 KPIAjax.listMaster(query,{
    		    			callback:function(data){ 
    		    				var str="<select id=\"uom_input\">";
    		    				// str=str+"<option value=\"all\">All</option>";
    		    				if(data!=null && data.length>0){ 
    		    					for(var i=0;i<data.length;i++){
    		    						str=str+"<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
    		    					} 
    		    				}
    		    				str=str+"</select>";
    		    				$("#uom_select").html(str);
    		    				 query="select * FROM  "+SCHEMA_G+".data_source"; 
    		    				 KPIAjax.listMaster(query,{
    		    		    			callback:function(data){ 
    		    		    				var str="<select id=\"dataSource_input\">";
    		    		    				// str=str+"<option value=\"all\">All</option>";
    		    		    				if(data!=null && data.length>0){ 
    		    		    					for(var i=0;i<data.length;i++){
    		    		    						str=str+"<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
    		    		    					} 
    		    		    				}
    		    		    				str=str+"</select>";
    		    		    				$("#dataSource_select").html(str); 
    		    		    				$("#mode").val(mode);
    		    		    		     	if(mode=='add'){
    		    		    		     		$('#kpi_code_input').attr('readonly', false); 
    		    		    		     		 $("#kpi_code_input").val("");
		    		    		                    $("#kpi_name_input").val("");
		    		    		                    $("#kpi_objective_input").val("");
		    		    		                    $("#kpi_formula_input").val("");
		    		    		                    $("#perspective_input").val("");
		    		    		                    $("#uom_input").val("");
		    		    		                    $("#dataSource_input").val("");
		    		    		                    //$("#etl_flag_input").val("");
		    		    		                    $("#etl_flag_input").attr("checked",false);
		    		    		                    $("#sql_statement_input").val("");
    		    		    		     		$( "#dialog-form" ).dialog({ 
    		    		    		     			position: 'top',
    		    		    		     			 height: 400,
    		    		    		     			 width:727,
    		    		    		     			 modal: true,
    		    		    		     			  hide: 'fold',
    		    		    		     		      show: 'blind' 
    		    		    		     		});
    		    		    		     	}else{ //edit
    		    		    		     		//$("#id_element").show(); 
    		    		    		     		$('#kpi_code_input').attr('readonly', true);
    		    		    		     		var query=" SELECT kpi_code,kpi_name,kpi_objective,kpi_formula,perspective_id, "+
    		    		    		     		 " uom_id,data_source_id,etl_flag,sql_statement  FROM "+SCHEMA_G+".kpi where kpi_code='"+id+"'";
    		    		    		     		KPIAjax.searchObject(query,{
    		    		    		     			callback:function(data){
    		    		    		     				//alert(data);  
    		    		    		                    $("#kpi_code_input").val(data[0][0]);
    		    		    		                    $("#kpi_name_input").val(data[0][1]);
    		    		    		                    $("#kpi_objective_input").val(data[0][2]);
    		    		    		                    $("#kpi_formula_input").val(data[0][3]);
    		    		    		                    $("#perspective_input").val(data[0][4]);
    		    		    		                    $("#uom_input").val(data[0][5]);
    		    		    		                    $("#dataSource_input").val(data[0][6]);
    		    		    		                    if(data[0][7]!=null && data[0][7]=='Y'){ 
    		    		    		                    	$("#etl_flag_input").attr("checked",true);
    		    		    		                    }else
    		    		    		                    	$("#etl_flag_input").attr("checked",false);
    		    		    		                   // $("#etl_flag_input").val(data[0][7]);
    		    		    		                    $("#sql_statement_input").val(data[0][8]);
    		    		    		     				$( "#dialog-form" ).dialog({ 
    		    		    		     					position: 'top',
    		    		    		     					 height: 400,
    		    		    		     					 width:727,
    		    		    		     					modal: true,
    		    		    		     					 hide: 'fold',
    		    		    		     				     show: 'blind' 
    		    		    		     				});
    		    		    		     			}
    		    		    		     		});
    		    		    		     	}
    		    		    			}
    		    		    	    }); 
    		    			}
    		    	    }); 
    			}
    	    }); 
        
     	 
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
    	 var kpi_code_input= jQuery.trim($("#kpi_code_input").val());
         var kpi_name_input= jQuery.trim($("#kpi_name_input").val());
         var kpi_objective_input= jQuery.trim($("#kpi_objective_input").val());
         var kpi_formula_input= jQuery.trim($("#kpi_formula_input").val());
         var perspective_input= jQuery.trim($("#perspective_input").val());
         var uom_input= jQuery.trim($("#uom_input").val());
         var dataSource_input= jQuery.trim($("#dataSource_input").val());
          
         if(kpi_code_input.length==0 || kpi_name_input.length==0){
         	alert("KPI Code and  KPI Name must not empty.");
         	return false;
         }
         var etl_flag_input='N';
         if($("#etl_flag_input").attr("checked"))
        	 etl_flag_input='Y';
        	 
         if(etl_flag_input=='Y' && jQuery.trim($("#sql_statement_input").val()).length==0){
        	 alert("Please fill in SQL Statement.");
        	 return false;
         }
        	 
         var sql_statement_input=jQuery.trim($("#sql_statement_input").val()); 
     	var mode=$("#mode").val();
     	//alert(mode);
     	//return false;
     	//`kpi_code` varchar(50) NOT NULL,
  
     	var query="";
    	var queryCheckDuplicate=""; 
     	if(mode=='add'){
     			query="insert into "+SCHEMA_G+".kpi set kpi_code='"+kpi_code_input+"', kpi_name='"+kpi_name_input+"',"+
     			" kpi_objective='"+kpi_objective_input+"', kpi_formula='"+kpi_formula_input+"', etl_flag='"+etl_flag_input+"',"+
     			" sql_statement='"+sql_statement_input+"', uom_id="+uom_input+", data_source_id="+dataSource_input+", perspective_id="+perspective_input+","+
     			" created_dt=now(),updated_dt=now()";
     			queryCheckDuplicate=" SELECT * FROM "+SCHEMA_G+".kpi    where kpi_code='"+kpi_code_input+"'"; 
     	}else {//edit
     		  query="update  "+SCHEMA_G+".kpi set  kpi_name='"+kpi_name_input+"',"+
     			" kpi_objective='"+kpi_objective_input+"', kpi_formula='"+kpi_formula_input+"', etl_flag='"+etl_flag_input+"',"+
     			" sql_statement='"+sql_statement_input+"', uom_id="+uom_input+", data_source_id="+dataSource_input+", perspective_id="+perspective_input+","+
     		  "updated_dt=now() where kpi_code='"+kpi_code_input+"'"; 
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
    	}else{
    		doSubmit(query);
    	}
     	
     	 
     }
     function doSubmit(query){
    	 KPIAjax.executeQuery(query,{
      		callback:function(data){ 
      			if(data!=0){
      				searchKPI(); 
      				$( "#dialog-form" ).dialog("close");
      			}
      		}
      	});
     }
     function doAction(id){ 
        var query="delete  FROM "+SCHEMA_G+".kpi where kpi_code='"+id+"'";
     		KPIAjax.executeQuery(query,{
     			callback:function(data){
     				if(data==0)
    					alert("Can not delete because this record is in use.");
     				searchKPI();
     			}
     		}); 
     }   
      
     </script> 
</body>
</html>    
