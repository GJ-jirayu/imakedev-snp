<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/jsp/includes.jsp" %> 
<script type="text/javascript">
$(document).ready(function() {
	/*  $('.cp-basic').colorpicker();
	 $('#cp3').colorpicker(); */
	 $('#colorpickerfield').ColorPicker({
	        onSubmit: function(hsb, hex, rgb, el, parent) {
	            $(el).val("#"+hex);
	            $(el).ColorPickerHide();
	        },
	        onBeforeShow: function () {
	            $(this).ColorPickerSetColor(this.value);
	        }
	    })
	    .bind('keyup', function(){
	        $(this).ColorPickerSetColor(this.value);
	    });
});
function distplayThreshold(){
	 var thresholdName=$("#thresholdName").val(); 
	//alert("a") 
	KPIAjax.searchKPI(year,  periodNo,employeeCode, etl_flag, approved_flag,{
		callback:function(data){
			//alert(data); 
			if(data!=null && data.length>0){
			    var str="<table class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px\">"+
			    		"<thead>"+
			    		"<tr> "+  
	            		"<th width=\"10%\"><div class=\"th_class\">Threshold ID</div></th>"+
	            		"<th width=\"40%\"><div class=\"th_class\">Threshold Name</div></th>"+
	            		"<th width=\"20%\"><div class=\"th_class\">Begin Threshold</div></th>"+ 
	            		"<th width=\"20%\"><div class=\"th_class\">End Threshold</div></th>"+
	            		"<th width=\"10%\"><div class=\"th_class\">Color Code</div></th>  "+ 
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
function actionForm(){
	
}
function showForm(mode,id){
	$( "#dialog-form" ).dialog({ 
		 height: 399,
		 width:727,
		modal: true,
		  hide: 'fold',
	        show: 'blind'
	        //,
		/* buttons: {
			"Ok": function() { 
				$( this ).dialog( "close" );
				//distplayApproveKPIResult();
				getData();
			}
		}  */
	}); 
}
function getData(){
	alert($("#aaa").val())
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
 
</script><%-- 
<div style="${display};padding-top:10px">
 <div class="alert alert-success" style="${display}">    
    <button class="close" data-dismiss="alert"><span style="font-size: 12px">x</span></button>
    <strong>${message}</strong> 
  </div>
  </div> --%>

<fieldset style="font-family: sans-serif;padding-top:0px;width: 1048px">
<!-- <fieldset style="font-family: sans-serif;"> --> 
<form id="formSearch" class="form-horizontal"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px" action="" method="post" >  
  <div class="control-group">
    <label class="control-label">Threshold Name:</label>
    <div class="controls">
      <input class="input_snp" type="text"  id="thresholdName"> <a class="btn btn-primary" ><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Search</span></a>
    </div> 
  </div> 
</form> 
<div id="dialog-Message-alert" title="Message" style="display: none;background: ('images/ui-bg_highlight-soft_75_cccccc_1x100.png') repeat-x scroll 50% 50% rgb(204, 204, 204)">
	<span id="_message_show"></span>
</div>
<div id="dialog-Message" style="margin-top:-15px; display: block;height: 300px; overflow: auto;overflow-x:hidden" >
<form  class="well"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;" action="" method="post" >
<div title="Employee"> 
	 <div style="padding: 10px;" id="employee_section">
  <div align="left" style="padding-bottom: 4px"> <a class="btn" onclick="showForm('add','0')"><i class="icon-plus-sign"></i>&nbsp;<span style="font-weight: normal;">Add</span></a></div>
  <table class="table table-hover table-striped table-bordered table-condensed" border="1" style="font-size: 12px">
        	<thead> 	
          		<tr> 
          			<th width="10%"><div class="th_class">Threshold ID</div></th>
            		<th width="50%"><div class="th_class">Threshold Name</div></th>
            		<th width="15%"><div class="th_class">Begin Threshold</div></th>
            		<th width="10%"><div class="th_class">End Threshold</div></th> 
            		<th width="10%"><div class="th_class">Color Cod</div></th>
            		<th width="5%"><div class="th_class"></div></th>     
          		</tr>
        	</thead>
        	<tbody>   
          	<tr style="cursor: pointer;">
          		<td style="text-align: left;"> xxxx </td>    
            	<td style="text-align: left;">53-145</td>            	
            	<td>วินัย ทองอยู่</td> 
            	<td style="text-align: left;">KPI001</td>
            	<td>xxxx</td>
            	<td style="text-align: center;">
            	<i title="Edit" onclick="loadDynamicPage(' ')" style="cursor: pointer;" class="icon-edit"></i>&nbsp;&nbsp;
            	<i title="Delete" onclick="confirmDelete(' ')" style="cursor: pointer;" class="icon-trash"></i>
            	</td>
            	 
          	</tr>  
  		 </tbody>
   </table> 
    </div>
  </div> 
  </form>
  </div>
  <div id="dialog-form"  style="display: none;">
  <form class="form-horizontal"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;" action="" method="post" > 
  <div class="control-group">
    <label class="control-label" for="inputEmail">Threshold ID:</label>
    <div class="controls">
      <input class="input_snp" type="text" id="inputEmail" readonly="readonly" value="1">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Threshold Name:</label>
    <div class="controls">
      <input class="input_snp" type="text" id="aaa">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Begin Threshold:</label>
    <div class="controls">
      <input class="input_snp" type="text" >
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">End Threshold:</label>
    <div class="controls">
      <input class="input_snp" type="text" >
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Color Code:</label>
    <div class="controls">
      <input class="input_snp" type="text"  id="colorpickerfield" style="width: 80px">
    <!--   <p>As component.</p>
          <div class="well">
			<div class="input-append color" data-color="rgb(255, 146, 180)" data-color-format="rgb" id="cp3">
				<input type="text" class="span2" value="" readonly >
				<span class="add-on"><i style="background-color: rgb(255, 146, 180)"></i></span>
			</div>
          </div> -->
    </div>
  </div>
  <div class="control-group">
    <div class="controls"> 
      <a class="btn btn-primary" ><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Submit</span></a>
    </div>
  </div>
</form> 
</div>
</fieldset>