<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/jsp/includes.jsp" %> 
<script type="text/javascript">
$(document).ready(function() {
	/* $( "#dialog-Message" ).dialog({
	      autoOpen: false,
	      show: "blind",
	    //  hide: "explode"
	    }); */
	$('#togle_emp').click(function() {
		 //$("#dialog-Message").slideDown("slow"); 
		  $('#dialog-Message_1').toggle('slow', function() {
		    // Animation complete.
		  });
		});
});
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
function showEmployee(){
	$("#dialog-Message").slideDown("slow"); 
	//$("#message_element").slideUp("slow");
	//  $( "#dialog-Message" ).dialog(  "open" );
	 /* $( "#dialog-Message" ).dialog({
		 
		modal: true,
		buttons: {
			"Ok": function() { 
				$( this ).dialog( "close" );
				 
			}
		}
	  });   */
}
function setBaseline(){ 
	$("#kpi_code").val("KPI001");
	$("#kpi_name").val("ยอดขายสินค้าเทียบเป้า");
	$("#dialog-Message_1").slideUp("slow", function() {
	    // Animation complete.
		$("#dialog-Message_2").slideDown("slow"); 
	});
	
}
</script><%-- 
<div style="${display};padding-top:10px">
 <div class="alert alert-success" style="${display}">    
    <button class="close" data-dismiss="alert"><span style="font-size: 12px">x</span></button>
    <strong>${message}</strong> 
  </div>
  </div> --%>
 <!-- <div id="dialog-Message" title="Employee" style="display: none;"> -->
 
<!--  <div id="dialog-Message" title="Employee" style="display: none;">
	 <span>Employee Name: <input type="text"/> <button>Search</button></span> -->
	 <%--
	 <div style="padding: 10px">
  <table class="table table-hover table-striped table-bordered table-condensed" border="1" style="font-size: 12px">
        	<thead>
          		<tr> 
            		<th width="10%"><div class="th_class">KPI Order</div></th>
            		<th width="42%"><div class="th_class">KPI Name</div></th> 
            		<th width="14%"><div class="th_class">KPI Weight</div></th> 
            		<th width="14%"><div class="th_class">Target Data</div></th>
            		<th width="14%"><div class="th_class">Target Score</div></th>
          		</tr>
        	</thead>
        	<tbody>   
          	<tr> 
            	<td style="text-align: right;">1</td>
            	<td>ยอดขายเทียบเป้า</td>
            	<td style="text-align: right;">50</td> 
            	<td style="text-align: right;"> 
            	 5,000,000
            	</td>
            	<td style="text-align: right;"> 
            	 50
            	</td>
          	</tr> 
          	 <tr> 
            	<td style="text-align: right;">2</td>
            	<td>ความพึงพอใจของลูกค้า</td>
            	<td style="text-align: right;">30</td> 
            	<td style="text-align: right;"> 
            	 10
            	</td>
            	<td style="text-align: right;"> 
            	30
            	</td>
          	</tr> 
  		 </tbody>
   </table>
    </div>
     --%>
<!-- </div> -->
<fieldset style="font-family: sans-serif;padding-top:0px;width: 720px">
<!-- <fieldset style="font-family: sans-serif;"> -->
<form class="form-horizontal"  style="border:2px solid #B3D2EE;background: #F9F9F9;padding-top:20px" action="" method="post" >
  
  <div class="control-group">
    <label class="control-label">KPI Code:</label>
    <div class="controls">
      <input class="input_snp" type="text" id="kpi_code" style="width: 100px">&nbsp;
      <a id="togle_emp" class="btn" >...</a>
      &nbsp;<input class="input_snp" type="text" id="kpi_name" readonly="readonly">
    </div>
  </div> 
   
  <div class="control-group">
    <div class="controls"> 
      <a class="btn btn-primary" ><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Submit</span></a>
    </div>
  </div>
</form>
<form id="dialog-Message_1"  class="well"  style="border:2px solid #B3D2EE;background: #F9F9F9;padding-top:20px;display: none;" action="" method="post" >
<div title="Employee">
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
  </form>
  <form id="dialog-Message_2"  class="well"  style="border:2px solid #B3D2EE;background: #F9F9F9;padding-top:20px;display: none;" action="" method="post" >
<div title="Employee"> 
	 <div style="padding: 10px">
  <table class="table table-hover table-striped table-bordered table-condensed" border="1" style="font-size: 12px">
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
   </table>
    </div>
  </div>
  </form>
</fieldset>