<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %> 
<%@ include file="/WEB-INF/jsp/includes.jsp" %>  
<html> 
<head>
<title>BackOffice</title>
<!--  <meta charset="UTF-8" />   --> 
<meta http-equiv="X-UA-Compatible" content="IE=7, IE=9"/>   
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script  src="<%=request.getContextPath() %>/resources/js/jquery-1.8.3.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/smoothness/jquery-ui-1.9.2.custom.min.js"></script>
 <script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
 <script src="<%=request.getContextPath() %>/resources/js/jquery.timePicker.min.js" type="text/javascript"></script>
 
<link href="<%=request.getContextPath() %>/resources/css/smoothness/jquery-ui-1.9.2.custom.css" type="text/css"  rel="stylesheet" /> 
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"  type="text/css"/>
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet"  type="text/css"/>
<link href="<%=request.getContextPath() %>/resources/css/timePicker.css" rel="stylesheet"  type="text/css"/>       
<!-- 
	DWR
	-->
	<script type="text/javascript"
        	src="<%=request.getContextPath() %>/dwr/interface/BillCycleAjax.js"></script>
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
<div id="dialog-update" title="Update Config" style="display: none;background: ('images/ui-bg_highlight-soft_75_cccccc_1x100.png') repeat-x scroll 50% 50% rgb(204, 204, 204)">
<span id="_message"></span>
</div>
<body>  
     	<div id="_content"   style="margin-left:3px;padding-top: 3px;width: 1100px"> 
      		  <table style="width: 1100px;" border="0">
      		  
     			<tr>
     				<td>
						<form class="form-inline"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;padding-bottom:15px" action="" method="post" >
 							  <table style="width: 85%;" border="0">
 							      <tr>
 							      	<td width="15%" style="text-align: right;">
									    รหัสลูกค้า : 
 							      	</td>	
 							      	<td width="20%">
									   <input type="text" id="customer_code" style="width: 120px;text-align: left: ;"/>
 							      	</td>
 							      	<td width="15%"  style="text-align: right;">
									    ชื่อลูกค้า : 
 							      	</td>
 							      	<td width="35%">
									    <input type="text" id="customer_name" style="width: 500px"/>
 							      	</td>
 							      </tr>
 							      <tr>
 							      	<td  width="15%"  style="text-align: right;">
									    พื้นที่ :
							    	</td>
    								<td  width="20%">
    									<span id="province_name_element"></span>
							     	</td>
    								<td  width="15%"  style="text-align: right;">
									     เขต: 
    								</td>
							    	<td width="35%">
    									<span id="district_name_element"></span>
 							      	</td>
 							      </tr>
 							      <tr>
 							      	<td width="15%"  style="text-align: right;">
									   เบอร์โทรศัพท์ : 
    								</td>
    								<td width="20%" colspan="3">
   										<input type="text" id="phone_no" style="width: 120px;text-align: right;"/>
   										<span style="padding-left: 10px"> <a class="btn btn-primary" style="font-size:12px" onclick="getConfig()"><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size: 12px;">Get Config</span></a></span>
								    </td>
    								<!-- <td width="50%" colspan="2"> 
    									<a class="btn btn-primary" style="font-size:12px" onclick="getConfig()"><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size: 12px;">Get Config</span></a>
								    </td>  -->
 							      </tr>
 							  </table> 
</form> 
</td>
				</tr>
  			</table>
 
</div>
<div id="configElement" style="display: none">
 <div   style="margin-left:3px;padding-top: 0px;width: 1100px"> 
<table style="width: 1100px;" border="0"> 
     			<tr>
     				<td>
						<form class="form-inline"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;padding-bottom:15px" action="" method="post" >
 							  <table style="width: 100%;" border="0">
 							      <tr valign="top">
 							      	<td width="15%" align="right">
 							      		<div  style="padding-left:20px;padding-bottom: 5px"> 
  	<span style="padding-left:10px;">
    วางบิลทุกๆวันที่ :
    </span> 
    </div>
 							      	</td>
 							      	<td width="85%">
 							      	<div  style="padding-left:20px;padding-bottom: 5px">
  	 									<table border="0">
  	 										<tr valign="bottom">
  	 										<td width="50px">
  	 										<input type="checkbox" name="billing_schedule_1"  value="1">&nbsp;&nbsp;1
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="billing_schedule_1"  value="2">&nbsp;&nbsp;2
  	 										</td>
  	 										<td width="50px">
  	 										<input type="checkbox" name="billing_schedule_1"  value="3">&nbsp;&nbsp;3
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="billing_schedule_1"  value="4">&nbsp;&nbsp;4
  	 										</td>
  	 										<td width="50px">
  	 										<input type="checkbox" name="billing_schedule_1"  value="5">&nbsp;&nbsp;5
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="billing_schedule_1"  value="6">&nbsp;&nbsp;6
  	 										</td>
  	 										<td width="50px">
  	 										<input type="checkbox" name="billing_schedule_1"  value="7">&nbsp;&nbsp;7
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="billing_schedule_1"  value="8">&nbsp;&nbsp;8
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="billing_schedule_1"  value="9">&nbsp;&nbsp;9
  	 										</td>
  	 										<td width="50px">
  	 										<input type="checkbox" name="billing_schedule_1"  value="10">&nbsp;&nbsp;10
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="billing_schedule_1"  value="11">&nbsp;&nbsp;11
  	 										</td>
  	 										<td width="50px">
  	 										<input type="checkbox" name="billing_schedule_1"  value="12">&nbsp;&nbsp;12
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="billing_schedule_1"  value="13">&nbsp;&nbsp;13
  	 										</td>
  	 										<td width="50px">
  	 										<input type="checkbox" name="billing_schedule_1"  value="14">&nbsp;&nbsp;14
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="billing_schedule_1"  value="15">&nbsp;&nbsp;15
  	 										</td>
  	 										 
  	 										</tr>
  	 										<tr valign="bottom">
  	 										<td width="50px">
  	 										<input type="checkbox" name="billing_schedule_1" value="16">&nbsp;&nbsp;16
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="billing_schedule_1" value="17">&nbsp;&nbsp;17
  	 										</td>
  	 										<td width="50px">
  	 										<input type="checkbox" name="billing_schedule_1" value="18">&nbsp;&nbsp;18
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="billing_schedule_1" value="19">&nbsp;&nbsp;19
  	 										</td>
  	 										<td width="50px">
  	 										<input type="checkbox" name="billing_schedule_1" value="20">&nbsp;&nbsp;20
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="billing_schedule_1" value="21">&nbsp;&nbsp;21
  	 										</td>
  	 										<td width="50px">
  	 										<input type="checkbox" name="billing_schedule_1" value="22">&nbsp;&nbsp;22
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="billing_schedule_1" value="23">&nbsp;&nbsp;23
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="billing_schedule_1" value="24">&nbsp;&nbsp;24
  	 										</td>
  	 										<td width="50px">
  	 										<input type="checkbox" name="billing_schedule_1" value="25">&nbsp;&nbsp;25
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="billing_schedule_1" value="26">&nbsp;&nbsp;26
  	 										</td>
  	 										<td width="50px">
  	 										<input type="checkbox" name="billing_schedule_1" value="27">&nbsp;&nbsp;27
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="billing_schedule_1" value="28">&nbsp;&nbsp;28
  	 										</td>
  	 										<td width="50px">
  	 										<input type="checkbox" name="billing_schedule_1" value="29">&nbsp;&nbsp;29
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="billing_schedule_1" value="30">&nbsp;&nbsp;30
  	 										</td>
  	 										 
  	 										</tr>
  	 										<tr valign="bottom">
  	 										<td width="50px" colspan="15">
  	 										<input type="checkbox" name="billing_schedule_1" value="31">&nbsp;&nbsp;31
  	 										</td> 
  	 										</tr>
  	 										<tr valign="bottom">
  	 										<td width="50px" colspan="15">
  	 										ระหว่างเวลา:&nbsp;<input type="text" id="billing_time_from_1" style="width: 50px">&nbsp;&nbsp;ถึงเวลา:&nbsp;<input type="text" style="width: 50px" id="billing_time_to_1">
  	 										</td> 
  	 										</tr>
  	 									</table>   
    </div>
 							      	</td>
 							      </tr> 
 							      <tr valign="top">
 							      	<td  colspan="6">
 							      	<hr style="border-color: #E8E8E8"/>
 							      	</td>
 							      	</tr>
 							      <tr valign="top">
 							      	<td width="15%"  align="right">
 							      		<div  style="padding-left:20px;padding-bottom: 5px"> 
  	<span style="padding-left:10px;">
    หรือทุกวัน :
    </span> 
    </div>
 							      	</td>
 							      	<td width="85%">
 							      	<div  style="padding-left:20px;padding-bottom: 5px">
  	 									<table border="0">
  	 										<tr valign="bottom">
  	 										<td width="100px">
  	 										<input type="checkbox" name="billing_schedule_all_2" value="Mon">&nbsp;&nbsp;ทุกจันทร์
  	 										</td>
  	 										<td  width="100px">
  	 										<input type="checkbox" name="billing_schedule_all_2" value="Tue">&nbsp;&nbsp;ทุกอังคาร
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="billing_schedule_all_2" value="Wed">&nbsp;&nbsp;ทุกพุธ
  	 										</td>
  	 										<td  width="100px">
  	 										<input type="checkbox" name="billing_schedule_all_2" value="Thu">&nbsp;&nbsp;ทุกพฤหัส
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="billing_schedule_all_2" value="Fri">&nbsp;&nbsp;ทุกศุกร์
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="billing_schedule_all_2" value="Sat">&nbsp;&nbsp;ทุกเสาร์
  	 										</td>
  	 										<td  width="100px">
  	 										<input type="checkbox" name="billing_schedule_all" value="All">&nbsp;&nbsp;ทุกวัน
  	 										</td> 
  	 										</tr>
  	 										<tr valign="bottom">
  	 										<td width="100px">
  	 										<input type="checkbox" name="billing_schedule_2" value="MonW1">&nbsp;&nbsp;จันทร์W1
  	 										</td>
  	 										<td  width="100px">
  	 										<input type="checkbox" name="billing_schedule_2" value="TueW1">&nbsp;&nbsp;อังคารW1
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="billing_schedule_2" value="WedW1">&nbsp;&nbsp;พุธW1
  	 										</td>
  	 										<td  width="100px">
  	 										<input type="checkbox" name="billing_schedule_2" value="ThuW1">&nbsp;&nbsp;พฤหัสW1
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="billing_schedule_2" value="FriW1">&nbsp;&nbsp;ศุกร์W1
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="billing_schedule_2" value="SatW1">&nbsp;&nbsp;เสาร์W1
  	 										</td>
  	 										<td  width="100px"> 
  	 										</td> 
  	 										</tr>
  	 										<tr valign="bottom">
  	 										<td width="100px">
  	 										<input type="checkbox" name="billing_schedule_2" value="MonW2">&nbsp;&nbsp;จันทร์W2
  	 										</td>
  	 										<td  width="100px">
  	 										<input type="checkbox" name="billing_schedule_2" value="TueW2">&nbsp;&nbsp;อังคารW2
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="billing_schedule_2" value="WedW2">&nbsp;&nbsp;พุธW2
  	 										</td>
  	 										<td  width="100px">
  	 										<input type="checkbox" name="billing_schedule_2" value="ThuW2">&nbsp;&nbsp;พฤหัสW2
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="billing_schedule_2" value="FriW2">&nbsp;&nbsp;ศุกร์W2
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="billing_schedule_2" value="SatW2">&nbsp;&nbsp;เสาร์W2
  	 										</td>
  	 										<td  width="100px">
  	 										
  	 										</td> 
  	 										</tr>
  	 										<tr valign="bottom">
  	 										<td width="100px">
  	 										<input type="checkbox" name="billing_schedule_2" value="MonW3">&nbsp;&nbsp;จันทร์W3
  	 										</td>
  	 										<td  width="100px">
  	 										<input type="checkbox" name="billing_schedule_2" value="TueW3">&nbsp;&nbsp;อังคารW3
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="billing_schedule_2" value="WedW3">&nbsp;&nbsp;พุธW3
  	 										</td>
  	 										<td  width="100px">
  	 										<input type="checkbox" name="billing_schedule_2" value="ThuW3">&nbsp;&nbsp;พฤหัสW3
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="billing_schedule_2" value="FriW3">&nbsp;&nbsp;ศุกร์W3
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="billing_schedule_2" value="SatW3">&nbsp;&nbsp;เสาร์W3
  	 										</td>
  	 										<td  width="100px">
  	 										
  	 										</td> 
  	 										</tr>
  	 										<tr valign="bottom">
  	 										<td width="100px">
  	 										<input type="checkbox" name="billing_schedule_2" value="MonW4">&nbsp;&nbsp;จันทร์W4
  	 										</td>
  	 										<td  width="100px">
  	 										<input type="checkbox" name="billing_schedule_2" value="TueW4">&nbsp;&nbsp;อังคารW4
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="billing_schedule_2" value="WedW4">&nbsp;&nbsp;พุธW4
  	 										</td>
  	 										<td  width="100px">
  	 										<input type="checkbox" name="billing_schedule_2" value="ThuW4">&nbsp;&nbsp;พฤหัสW4
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="billing_schedule_2" value="FriW4">&nbsp;&nbsp;ศุกร์W4
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="billing_schedule_2" value="SatW4">&nbsp;&nbsp;เสาร์W4
  	 										</td>
  	 										<td  width="100px">
  	 										
  	 										</td> 
  	 										</tr>
  	 										<tr valign="bottom">
  	 										<td width="100px" colspan="15">
  	 										ระหว่างเวลา:&nbsp;<input type="text" id="billing_time_from_2" style="width: 50px">&nbsp;&nbsp;ถึงเวลา:&nbsp;<input type="text" style="width: 50px" id="billing_time_to_2">
  	 										</td> 
  	 										</tr>
  	 									</table>   
    </div>
 							      	</td>
 							      </tr> 
 							  </table> 
</form> 
</td>
				</tr>
  			</table>
      	</div> 
      	<div   style="margin-left:3px;padding-top: 0px;width: 1100px"> 
<table style="width: 1100px;" border="0"> 
     			<tr>
     				<td>
						<form class="form-inline"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;padding-bottom:15px" action="" method="post" >
 							  <table style="width: 100%;" border="0">
 							      <tr valign="top">
 							      	<td width="20%"  align="right">
 							      		<div  style="padding-left:20px;padding-bottom: 5px"> 
  	<span style="padding-left:10px;">
    การวางบิลพร้อมใบเสร็จ :
    </span> 
    </div>
 							      	</td>
 							      	<td width="80%">
 							      	<div  style="padding-left:20px;padding-bottom: 5px">
  	 									 <input type="checkbox" id="include_receipt_flag" value="Y"> ต้องวางพร้อมใบเสร็จ
    </div>
 							      	</td>
 							      </tr>  
 							      <tr valign="top">
 							      	<td width="20%" align="right">
 							      		<div  style="padding-left:20px;padding-bottom: 5px"> 
  	<span style="padding-left:10px;">
    หากตรงกับวันหยุดจะเลือน :
    </span> 
    </div>
 							      	</td>
 							      	<td width="80%">
 							      	<div  style="padding-left:20px;padding-bottom: 5px">
  	 									<select id="shift_bill_date_flag">
  	 										<option value="next_business_day">เลือนออกเป็นวันทำการถัดไป</option>
  	 										<option value="previos_business_day">เลือนวันให้เร็วขึ้น 1 วันทำการ</option> 
  	 									</select> 
    								</div>
 							      	</td>
 							      </tr> 
 							  </table> 
</form> 
</td>
				</tr>
  			</table>
      	</div>
      	
      	<div   style="margin-left:3px;padding-top: 0px;width: 1100px"> 
<table style="width: 1100px;" border="0"> 
     			<tr>
     				<td>
						<form class="form-inline"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;padding-bottom:15px" action="" method="post" >
 							  <table style="width: 100%;" border="0">
 							      <tr valign="top">
 							      	<td width="15%" align="right">
 							      		<div  style="padding-left:20px;padding-bottom: 5px"> 
  	<span style="padding-left:10px;">
    รับเช็ค/เงินสดทุกๆวันที่ :
    </span> 
    </div>
 							      	</td>
 							      	<td width="85%">
 							      	<div  style="padding-left:20px;padding-bottom: 5px">
  	 									<table border="0">
  	 										<tr valign="bottom">
  	 										<td width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="1">&nbsp;&nbsp;1
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="2">&nbsp;&nbsp;2
  	 										</td>
  	 										<td width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="3">&nbsp;&nbsp;3
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="4">&nbsp;&nbsp;4
  	 										</td>
  	 										<td width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="5">&nbsp;&nbsp;5
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="6">&nbsp;&nbsp;6
  	 										</td>
  	 										<td width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="7">&nbsp;&nbsp;7
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="8">&nbsp;&nbsp;8
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="9">&nbsp;&nbsp;9
  	 										</td>
  	 										<td width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="10">&nbsp;&nbsp;10
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="11">&nbsp;&nbsp;11
  	 										</td>
  	 										<td width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="12">&nbsp;&nbsp;12
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="13">&nbsp;&nbsp;13
  	 										</td>
  	 										<td width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="14">&nbsp;&nbsp;14
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="15">&nbsp;&nbsp;15
  	 										</td>
  	 										 
  	 										</tr>
  	 										<tr valign="bottom">
  	 										<td width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="16">&nbsp;&nbsp;16
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="17">&nbsp;&nbsp;17
  	 										</td>
  	 										<td width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="18">&nbsp;&nbsp;18
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="19">&nbsp;&nbsp;19
  	 										</td>
  	 										<td width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="20">&nbsp;&nbsp;20
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="21">&nbsp;&nbsp;21
  	 										</td>
  	 										<td width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="22">&nbsp;&nbsp;22
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="23">&nbsp;&nbsp;23
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="24">&nbsp;&nbsp;24
  	 										</td>
  	 										<td width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="25">&nbsp;&nbsp;25
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="26">&nbsp;&nbsp;26
  	 										</td>
  	 										<td width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="27">&nbsp;&nbsp;27
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="28">&nbsp;&nbsp;28
  	 										</td>
  	 										<td width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="29">&nbsp;&nbsp;29
  	 										</td>
  	 										<td  width="50px">
  	 										<input type="checkbox" name="payment_schedule_1" value="30">&nbsp;&nbsp;30
  	 										</td>
  	 										 
  	 										</tr>
  	 										<tr valign="bottom">
  	 										<td width="50px" colspan="15">
  	 										<input type="checkbox" name="payment_schedule_1" value="31">&nbsp;&nbsp;31
  	 										</td> 
  	 										</tr>
  	 										<tr valign="bottom">
  	 										<td width="50px" colspan="15">
  	 										ระหว่างเวลา:&nbsp;<input type="text" id="payment_time_from_1" style="width: 50px">&nbsp;&nbsp;ถึงเวลา:&nbsp;<input type="text" style="width: 50px" id="payment_time_to_1">
  	 										</td> 
  	 										</tr>
  	 									</table>   
    </div>
 							      	</td>
 							      </tr> 
 							      <tr valign="top">
 							      	<td  colspan="6">
 							      	<hr style="border-color: #E8E8E8"/>
 							      	</td>
 							      	</tr>
 							      <tr valign="top">
 							      	<td width="15%" align="right">
 							      		<div  style="padding-left:20px;padding-bottom: 5px"> 
  	<span style="padding-left:10px;">
    หรือทุกวัน :
    </span> 
    </div>
 							      	</td>
 							      	<td width="85%">
 							      	<div  style="padding-left:20px;padding-bottom: 5px">
  	 									<table border="0">
  	 										<tr valign="bottom">
  	 										<td width="100px">
  	 										<input type="checkbox" name="payment_schedule_all_2" value="Mon">&nbsp;&nbsp;ทุกจันทร์
  	 										</td>
  	 										<td  width="100px">
  	 										<input type="checkbox" name="payment_schedule_all_2" value="Tue">&nbsp;&nbsp;ทุกอังคาร
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="payment_schedule_all_2" value="Wed">&nbsp;&nbsp;ทุกพุธ
  	 										</td>
  	 										<td  width="100px">
  	 										<input type="checkbox" name="payment_schedule_all_2" value="Thu">&nbsp;&nbsp;ทุกพฤหัส
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="payment_schedule_all_2" value="Fri">&nbsp;&nbsp;ทุกศุกร์
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="payment_schedule_all_2" value="Sat">&nbsp;&nbsp;ทุกเสาร์
  	 										</td>
  	 										<td  width="100px">
  	 										<input type="checkbox" name="payment_schedule_all" value="All">&nbsp;&nbsp;ทุกวัน
  	 										</td> 
  	 										</tr>
  	 										<tr valign="bottom">
  	 										<td width="100px">
  	 										<input type="checkbox" name="payment_schedule_2" value="MonW1">&nbsp;&nbsp;จันทร์W1
  	 										</td>
  	 										<td  width="100px">
  	 										<input type="checkbox" name="payment_schedule_2" value="TueW1">&nbsp;&nbsp;อังคารW1
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="payment_schedule_2" value="WedW1">&nbsp;&nbsp;พุธW1
  	 										</td>
  	 										<td  width="100px">
  	 										<input type="checkbox" name="payment_schedule_2" value="ThuW1">&nbsp;&nbsp;พฤหัสW1
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="payment_schedule_2" value="FriW1">&nbsp;&nbsp;ศุกร์W1
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="payment_schedule_2" value="SatW1">&nbsp;&nbsp;เสาร์W1
  	 										</td>
  	 										<td  width="100px"> 
  	 										</td> 
  	 										</tr>
  	 										<tr valign="bottom">
  	 										<td width="100px">
  	 										<input type="checkbox" name="payment_schedule_2" value="MonW2">&nbsp;&nbsp;จันทร์W2
  	 										</td>
  	 										<td  width="100px">
  	 										<input type="checkbox" name="payment_schedule_2" value="TueW2">&nbsp;&nbsp;อังคารW2
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="payment_schedule_2" value="WedW2">&nbsp;&nbsp;พุธW2
  	 										</td>
  	 										<td  width="100px">
  	 										<input type="checkbox" name="payment_schedule_2" value="ThuW2">&nbsp;&nbsp;พฤหัสW2
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="payment_schedule_2" value="FriW2">&nbsp;&nbsp;ศุกร์W2
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="payment_schedule_2" value="SatW2">&nbsp;&nbsp;เสาร์W2
  	 										</td>
  	 										<td  width="100px">
  	 										
  	 										</td> 
  	 										</tr>
  	 										<tr valign="bottom">
  	 										<td width="100px">
  	 										<input type="checkbox" name="payment_schedule_2" value="MonW3">&nbsp;&nbsp;จันทร์W3
  	 										</td>
  	 										<td  width="100px">
  	 										<input type="checkbox" name="payment_schedule_2" value="TueW3">&nbsp;&nbsp;อังคารW3
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="payment_schedule_2" value="WedW3">&nbsp;&nbsp;พุธW3
  	 										</td>
  	 										<td  width="100px">
  	 										<input type="checkbox" name="payment_schedule_2" value="ThuW3">&nbsp;&nbsp;พฤหัสW3
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="payment_schedule_2" value="FriW3">&nbsp;&nbsp;ศุกร์W3
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="payment_schedule_2" value="SatW3">&nbsp;&nbsp;เสาร์W3
  	 										</td>
  	 										<td  width="100px">
  	 										
  	 										</td> 
  	 										</tr>
  	 										<tr valign="bottom">
  	 										<td width="100px">
  	 										<input type="checkbox" name="payment_schedule_2" value="MonW4">&nbsp;&nbsp;จันทร์W4
  	 										</td>
  	 										<td  width="100px">
  	 										<input type="checkbox" name="payment_schedule_2" value="TueW4">&nbsp;&nbsp;อังคารW4
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="payment_schedule_2" value="WedW4">&nbsp;&nbsp;พุธW4
  	 										</td>
  	 										<td  width="100px">
  	 										<input type="checkbox" name="payment_schedule_2" value="ThuW4">&nbsp;&nbsp;พฤหัสW4
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="payment_schedule_2" value="FriW4">&nbsp;&nbsp;ศุกร์W4
  	 										</td>
  	 										<td width="100px">
  	 										<input type="checkbox" name="payment_schedule_2" value="SatW4">&nbsp;&nbsp;เสาร์W4
  	 										</td>
  	 										<td  width="100px">
  	 										
  	 										</td> 
  	 										</tr>
  	 										<tr valign="bottom">
  	 										<td width="100px" colspan="15">
  	 										ระหว่างเวลา:&nbsp;<input type="text" id="payment_time_from_2" style="width: 50px">&nbsp;&nbsp;ถึงเวลา:&nbsp;<input type="text" style="width: 50px" id="payment_time_to_2">
  	 										</td> 
  	 										</tr>
  	 									</table>   
    </div>
 							      	</td>
 							      </tr> 
 							  </table> 
 							  <div align="center" id="approve_section"> 
      <a class="btn btn-primary" onclick="saveConfig()"><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Save</span></a>
    </div>
</form> 
</td>
				</tr>
  			</table>
  			
      	</div>
      
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
	$("#billing_time_from_1").timePicker();
	$("#billing_time_from_2").timePicker();
	
	$("#billing_time_to_1").timePicker(); 
	$("#billing_time_to_2").timePicker();
	
	$("#payment_time_from_1").timePicker();
	$("#payment_time_from_2").timePicker();
	
	$("#payment_time_to_1").timePicker(); 
	$("#payment_time_to_2").timePicker(); 
	 
 	 
 	$("#customer_code" ).autocomplete({
		  source: function( request, response ) { 
			  $("#customer_name" ).val(""); 
			  $("#configElement").slideUp("slow"); 
				var query=" SELECT customer_code, customer_name, province_name, district_code, district_name, phone_no, include_receipt_flag,shift_bill_date_flag,created_dttm,"+
					  " updated_dttm FROM "+SCHEMA_G+".ar_customer where customer_code like '%"+request.term+"%'   ";		      
				BillCycleAjax.searchObject(query,{
					callback:function(data){ 
						if(data!=null && data.length>0){
							response( $.map( data, function( item ) {
					          return {
					        	  label:item[0],
					        	  value:item[1],
					        	  province_name:item[2],
					        	  district_code:item[3],
					        	  district_name:item[4],
					        	  phone_no:item[5],
					        	  include_receipt_flag:item[6],
					        	  shift_bill_date_flag:item[7],
					        	  created_dttm:item[8],
					        	  updated_dttm:item[9]
					          }
					        }));
						}else{
							var xx=[]; 
							response( $.map(xx));
						}
					}
			 });		  
		  },
		  minLength: 1,
		  select: function( event, ui ) { 
			  this.value = ui.item.label;
			  $("#customer_code").val(ui.item.label);
			  $("#customer_name").val(ui.item.value);
			  $("#phone_no").val(ui.item.phone_no);
			  $("#district_code").val(ui.item.district_code);
			  loadProvinceName('set',ui.item.province_name,ui.item.district_name,ui.item.district_code);
			  /* $("#employeeName_result").val(ui.item.value);
			  $("#employeeName").val("");
			  
			  $("#employeeCode_hidden").val(ui.item.label);
			  $("#employeeName_hidden").val(ui.item.value); */ 
			 
		      return false;
		  },
		  open: function() {
		    $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
		  },
		  close: function() {
		    $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
		  }
		}); 
 	$("#customer_name" ).autocomplete({
		  source: function( request, response ) { 
			  $("#customer_code" ).val(""); 
			  $("#configElement").slideUp("slow"); 
				var query=" SELECT customer_code, customer_name, province_name, district_code, district_name, phone_no, include_receipt_flag,shift_bill_date_flag,created_dttm,"+
				  " updated_dttm FROM "+SCHEMA_G+".ar_customer where customer_name like '%"+request.term+"%'   ";			      
				BillCycleAjax.searchObject(query,{
					callback:function(data){ 
						if(data!=null && data.length>0){
							response( $.map( data, function( item ) {
					          return {
					        	  label:item[1],
					        	  value:item[0] ,
					        	  province_name:item[2],
					        	  district_code:item[3],
					        	  district_name:item[4],
					        	  phone_no:item[5],
					        	  include_receipt_flag:item[6],
					        	  shift_bill_date_flag:item[7],
					        	  created_dttm:item[8],
					        	  updated_dttm:item[9]
					          }
					        }));
						}else{
							var xx=[]; 
							response( $.map(xx));
						}
					}
			 });		  
		  },
		  minLength: 1,
		  select: function( event, ui ) { 
			  this.value = ui.item.value; 
			  $("#customer_name").val(ui.item.label);
	          $("#customer_code").val(ui.item.value);
	          $("#phone_no").val(ui.item.phone_no);
	          $("#district_code").val(ui.item.district_code); 
	          
	          loadProvinceName('set',ui.item.province_name,ui.item.district_name,ui.item.district_code);
			 /*  $("#employeeName_result").val(ui.item.value);
			  $("#employeeName").val("");
			  
			  $("#employeeCode_hidden").val(ui.item.label);
			  $("#employeeName_hidden").val(ui.item.value);  */
			 
		      return false;
		  },
		  open: function() {
		    $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
		  },
		  close: function() {
		    $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
		  }
		}); 
 	loadProvinceName('init','','',''); 
 		// billing click
 		$("input[name=billing_schedule_1]").click(function(){
 			//alert($(this).prop("checked"));
 		        if($(this).prop("checked"))
 					checkBillingWeek($(this));
 			});
 		$("input[name=billing_schedule_all_2]").click(function(){
 			  if($(this).prop("checked"))
 				checkBillingScheduleAll2($(this));
		});
 		$("input[name=billing_schedule_all]").click(function(){
 			  if($(this).prop("checked"))
 				  checkBillingScheduleAll($(this));
		});
 		$("input[name=billing_schedule_2]").click(function(){
 			  if($(this).prop("checked"))
 				  checkBillingSchedule2($(this));
		});
 		
 		// payment click
 		$("input[name=payment_schedule_1]").click(function(){
 			  if($(this).prop("checked"))
 				  checkPaymentWeek($(this));
			});	
 		
 		$("input[name=payment_schedule_all_2]").click(function(){
 			  if($(this).prop("checked"))
 				  checkPaymentScheduleAll2($(this));
		});
 		$("input[name=payment_schedule_all]").click(function(){
 			  if($(this).prop("checked"))
 				  checkPaymentScheduleAll($(this));
		});
 		$("input[name=payment_schedule_2]").click(function(){
 			  if($(this).prop("checked"))
 				  checkPaymentSchedule2($(this));
		});
 		
}); 
function checkBillingWeek(obj){
	var billing_schedule_all_2_array=document.getElementsByName("billing_schedule_all_2"); //type week
	for(var i=0;i<billing_schedule_all_2_array.length;i++){
		 if(billing_schedule_all_2_array[i].checked){
			 alert("ไม่สามารถเลือกข้อมูลแบบวันทีและวันพร้อมกันได้");
			 obj.prop("checked",false)
			 return false;
			 break;
		 } 
	 }
	 var billing_schedule_all_array=document.getElementsByName("billing_schedule_all"); //type week
	 for(var i=0;i<billing_schedule_all_array.length;i++){
		 if(billing_schedule_all_array[i].checked){
			 alert("ไม่สามารถเลือกข้อมูลแบบวันทีและวันพร้อมกันได้");
			 obj.prop("checked",false)
			 return false;
			 break;
		 } 
	 }
	 var billing_schedule_2_array=document.getElementsByName("billing_schedule_2"); //type week
	 for(var i=0;i<billing_schedule_2_array.length;i++){
		 if(billing_schedule_2_array[i].checked){
			 alert("ไม่สามารถเลือกข้อมูลแบบวันทีและวันพร้อมกันได้");
			 obj.prop("checked",false)
			 return false;
			 break;
		 } 
	 }
	 
	//alert("checkBillingWeek");
}
function checkBillingScheduleAll2(obj){ 
	 var billing_schedule_1_array=document.getElementsByName("billing_schedule_1"); //type week
	 for(var i=0;i<billing_schedule_1_array.length;i++){
		 if(billing_schedule_1_array[i].checked){
			 alert("ไม่สามารถเลือกข้อมูลแบบวันทีและวันพร้อมกันได้");
			 obj.prop("checked",false);
			 return false;
			 break;
		 } 
	 } 
	
	 /* var billing_schedule_all_array=document.getElementsByName("billing_schedule_all"); //type week
	 for(var i=0;i<billing_schedule_all_array.length;i++){
		 if(billing_schedule_all_array[i].checked){
			 alert("ไม่สามารถเลือกทุกวัน พร้อมกับวันจันทร์ อังคาร พุธ พฤหัส ศุกร์ ของทุกสปดาห์ หรือ วันจันทร์ อังคาร พุธ พฤหัส ศุกร์ของบางสปดาห์ได้");		
			 obj.prop("checked",false)
			 return false;
			 break;
		 } 
	 } */
	 var billing_schedule_all_array=document.getElementsByName("billing_schedule_all"); //type week
	 for(var i=0;i<billing_schedule_all_array.length;i++){
		 billing_schedule_all_array[i].checked=false 
	 }
	 var value=obj.val();
	 var billing_schedule_2_array=document.getElementsByName("billing_schedule_2"); //type week
	 for(var i=0;i<billing_schedule_2_array.length;i++){
		  if(billing_schedule_2_array[i].value.indexOf(value)!=-1)	     
		  		billing_schedule_2_array[i].checked=false ;
	 } 
	 /*  var value=obj.val();
	 
	 var billing_schedule_2_array=document.getElementsByName("billing_schedule_2"); //type week
	 for(var i=0;i<billing_schedule_2_array.length;i++){
		 if(billing_schedule_2_array[i].checked && value.indexOf(billing_schedule_2_array[i].value)!=-1){
			 alert("ไม่สามารถเลือกจันทร์ อังคาร พุธ พฤหัส ศุกร์ของทุกสปดาห์พร้อมกับจันทร์ อังคาร พุธ พฤหัส ศุกร์ของบางสปดาห์ได้");
			 obj.prop("checked",false)
			 return false;
			 break;
		 } 
	 }  */
}
function checkBillingScheduleAll(obj){
	 var billing_schedule_1_array=document.getElementsByName("billing_schedule_1"); //type week
	 for(var i=0;i<billing_schedule_1_array.length;i++){
		 if(billing_schedule_1_array[i].checked){
			 alert("ไม่สามารถเลือกข้อมูลแบบวันทีและวันพร้อมกันได้");
			 obj.prop("checked",false)
			 return false;
			 break;
		 } 
	 }
	 
	 var billing_schedule_all_2_array=document.getElementsByName("billing_schedule_all_2"); //type week
	 for(var i=0;i<billing_schedule_all_2_array.length;i++){
		 billing_schedule_all_2_array[i].checked=false;
		 } 
	 var billing_schedule_2_array=document.getElementsByName("billing_schedule_2"); //type week
	 for(var i=0;i<billing_schedule_2_array.length;i++){
		 billing_schedule_2_array[i].checked=false;
		 } 
	 
}
function checkBillingSchedule2(obj){
	 var billing_schedule_1_array=document.getElementsByName("billing_schedule_1"); //type week
	 for(var i=0;i<billing_schedule_1_array.length;i++){
		 if(billing_schedule_1_array[i].checked){
			 alert("ไม่สามารถเลือกข้อมูลแบบวันทีและวันพร้อมกันได้");
			 obj.prop("checked",false)
			 return false;
			 break;
		 } 
	 }
	 var billing_schedule_all_array=document.getElementsByName("billing_schedule_all"); //type week
	 for(var i=0;i<billing_schedule_all_array.length;i++){
		 billing_schedule_all_array[i].checked=false; 
	 }
	 var value=obj.val();
	 var billing_schedule_all_2_array=document.getElementsByName("billing_schedule_all_2"); //type week
	 for(var i=0;i<billing_schedule_all_2_array.length;i++){
		  if(value.indexOf(billing_schedule_all_2_array[i].value)!=-1)	     
			  billing_schedule_all_2_array[i].checked=false ;
	 } 
}
// payment
function checkPaymentWeek(obj){
	var payment_schedule_all_2_array=document.getElementsByName("payment_schedule_all_2"); //type week
	 for(var i=0;i<payment_schedule_all_2_array.length;i++){
		 if(payment_schedule_all_2_array[i].checked){
			 alert("ไม่สามารถเลือกข้อมูลแบบวันทีและวันพร้อมกันได้");
			 obj.prop("checked",false)
			 return false;
			 break;
		 } 
	 }
	 var payment_schedule_all_array=document.getElementsByName("payment_schedule_all"); //type week
	 for(var i=0;i<payment_schedule_all_array.length;i++){
		 if(payment_schedule_all_array[i].checked){
			 alert("ไม่สามารถเลือกข้อมูลแบบวันทีและวันพร้อมกันได้");
			 obj.prop("checked",false)
			 return false;
			 break;
		 } 
	 }
	 var payment_schedule_2_array=document.getElementsByName("payment_schedule_2"); //type week
	 for(var i=0;i<payment_schedule_2_array.length;i++){
		 if(payment_schedule_2_array[i].checked){
			 alert("ไม่สามารถเลือกข้อมูลแบบวันทีและวันพร้อมกันได้");
			 obj.prop("checked",false)
			 return false;
			 break;
		 } 
	 }
}
function checkPaymentScheduleAll2(obj){
	 var payment_schedule_1_array=document.getElementsByName("payment_schedule_1"); //type week
	 for(var i=0;i<payment_schedule_1_array.length;i++){
		 if(payment_schedule_1_array[i].checked){
			 alert("ไม่สามารถเลือกข้อมูลแบบวันทีและวันพร้อมกันได้");
			 obj.prop("checked",false)
			 return false;
			 break;
		 } 
	 } 

	 var payment_schedule_all_array=document.getElementsByName("payment_schedule_all"); //type week
	 for(var i=0;i<payment_schedule_all_array.length;i++){
		 payment_schedule_all_array[i].checked=false 
	 }
	 
	 var value=obj.val();
	 var payment_schedule_2_array=document.getElementsByName("payment_schedule_2"); //type week
	 for(var i=0;i<payment_schedule_2_array.length;i++){
		  if(payment_schedule_2_array[i].value.indexOf(value)!=-1)	     
			  payment_schedule_2_array[i].checked=false ;
	 } 
}
function checkPaymentScheduleAll(obj){
	 var payment_schedule_1_array=document.getElementsByName("payment_schedule_1"); //type week
	 for(var i=0;i<payment_schedule_1_array.length;i++){
		 if(payment_schedule_1_array[i].checked){
			 alert("ไม่สามารถเลือกข้อมูลแบบวันทีและวันพร้อมกันได้");
			 obj.prop("checked",false)
			 return false;
			 break;
		 } 
	 }
	 
	 var payment_schedule_all_2_array=document.getElementsByName("payment_schedule_all_2"); //type week
	 for(var i=0;i<payment_schedule_all_2_array.length;i++){
		 payment_schedule_all_2_array[i].checked=false;
		 } 
	 var payment_schedule_2_array=document.getElementsByName("payment_schedule_2"); //type week
	 for(var i=0;i<payment_schedule_2_array.length;i++){
		 payment_schedule_2_array[i].checked=false;
		 } 
}
function checkPaymentSchedule2(obj){
	 var payment_schedule_1_array=document.getElementsByName("payment_schedule_1"); //type week
	 for(var i=0;i<payment_schedule_1_array.length;i++){
		 if(payment_schedule_1_array[i].checked){
			 alert("ไม่สามารถเลือกข้อมูลแบบวันทีและวันพร้อมกันได้");
			 obj.prop("checked",false)
			 return false;
			 break;
		 } 
	 }
	 var payment_schedule_all_array=document.getElementsByName("payment_schedule_all"); //type week
	 for(var i=0;i<payment_schedule_all_array.length;i++){
		 payment_schedule_all_array[i].checked=false; 
	 }
	 var value=obj.val();
	 var payment_schedule_all_2_array=document.getElementsByName("payment_schedule_all_2"); //type week
	 for(var i=0;i<payment_schedule_all_2_array.length;i++){
		  if(value.indexOf(payment_schedule_all_2_array[i].value)!=-1)	     
			  payment_schedule_all_2_array[i].checked=false ;
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
function loadProvinceName(mode,province_name,district_name,district_code){ 
 	 var query="SELECT province_name FROM "+SCHEMA_G+".district group by province_name "; 
 	BillCycleAjax.searchObject(query,{
 		callback:function(data){  
 			  	var str="<select id=\"province_name\" style=\"width: 200px\" onchange=\"loadDistrict()\">";	
 			   if(data!=null && data.length>0){ 
 				   for(var i=0;i<data.length;i++) {
 					  str=str+"<option value=\""+data[i]+"\">"+data[i]+"</option>"; 
 				   } 
 			   } 
 			  str=str+"</select>";
 			 $("#province_name_element").html(str); 
 			 if(mode!='init'){
 				 $("#province_name").val(province_name); 
 			 }
 			loadDistrict(mode,district_code);
 		}
 	}); 
 }
/* function setDistrictName(){
	  
} */
function loadDistrict(mode,district_code){ 
	 var province_name=$("#province_name").val(); 
	 var query="SELECT district_code,province_name,district_name FROM "+SCHEMA_G+".district where province_name='"+province_name+"'"; 
	BillCycleAjax.searchObject(query,{
		callback:function(data){  
			  	var str="<select id=\"district_code\"   style=\"width: 200px\">";	
			   if(data!=null && data.length>0){ 
				   for(var i=0;i<data.length;i++) {
					  str=str+"<option value=\""+data[i][0]+"\">"+data[i][2]+"</option>"; 
				   } 
			   } 
			  str=str+"</select>";
			 $("#district_name_element").html(str); 
			 if(mode!='init'){
 				 $("#district_code").val(district_code); 
 			 }
			// setDistrictName();
		}
	}); 
}
function getConfig(){
	resetBillDay(); 
	resetBillWeek();
	reset_billing_schedule_all();
	reset_billing_schedule_2();
	resetPaymentDay();
	resetPaymentWeek();
	reset_payment_schedule_all();
	reset_payment_schedule_2();
	 
	var customer_code= $("#customer_code").val(); 
	$("#configElement").slideUp("slow"); 
 	//alert(kpiCode+","+employeeName);
 	if(customer_code.length==0 && customer_code.length==0){
 		alert("กรุณากรอก รหัสลูกค้า หรือ ชื่อลูกค้า.");
 		return false;
 	}
 	var query=" SELECT customer_code, customer_name, province_name, district_code, district_name, phone_no, include_receipt_flag,shift_bill_date_flag,created_dttm,"+
	  " updated_dttm FROM "+SCHEMA_G+".ar_customer where customer_code ='"+customer_code+"'";	
 	 
 	BillCycleAjax.searchObject(query,{
 		callback:function(data){   
 			   if(data!=null && data.length>0){
 				    // alert(data)
 				        if(data[0][6]!=null && data[0][6]=='Y')
 				    	   document.getElementById("include_receipt_flag").checked=true;
 				        else
 				           document.getElementById("include_receipt_flag").checked=false;
 				    	if(data[0][7]!=null && data[0][7].length>0)
 				  			 $("#shift_bill_date_flag").val(data[0][7]);
 			   }  
 			  loadBilling(customer_code);
 			
 		}
 	}); 
 }
function loadBilling(customer_code){
	var query="SELECT customer_code, schedule, type, time_from, time_to, created_dttm, updated_dttm ,"+
		" DATE_FORMAT(time_from,'%H') as c1, "+
		" DATE_FORMAT(time_from,'%i') as c2, "+
		" DATE_FORMAT(time_to,'%H') as d1, "+
		" DATE_FORMAT(time_to,'%i') as d2 "+
" FROM "+SCHEMA_G+".ar_billing_schedule where customer_code='"+customer_code+"' " ;
	var time_from_day="";
	var time_to_day="";
	var time_from_week="";
	var time_to_week="";
BillCycleAjax.searchObject(query,{
	callback:function(data){  
		  if(data!=null && data.length>0){
			  for(var i=0;i<data.length>0;i++){
					 
				  if(data[i][2]=='day'){
					  time_from_day=data[i][7]+":"+data[i][8];
					  time_to_day=data[i][9]+":"+data[i][10];
					  var billing_schedule_1_list=document.getElementsByName("billing_schedule_1");
					
					  for(var j=0;j<billing_schedule_1_list.length;j++){ 
						  if(billing_schedule_1_list[j].value==data[i][1]){
							 billing_schedule_1_list[j].checked=true;
							 break;
						  } 
					  } 
				  }else  if(data[i][2]=='week'){
					  time_from_week=data[i][7]+":"+data[i][8];
					  time_to_week=data[i][9]+":"+data[i][10];
					  var billing_schedule_2_list=document.getElementsByName("billing_schedule_2");
					  var billing_schedule_all_2_list=document.getElementsByName("billing_schedule_all_2");
					  var billing_schedule_all_list=document.getElementsByName("billing_schedule_all");
					  if(data[i][1]=='Mon' || data[i][1]=='Tue' || data[i][1]=='Wed' || data[i][1]=='Thu' ||  data[i][1]=='Fri'){
						  for(var j=0;j<billing_schedule_all_2_list.length;j++){ 
							 	 if(billing_schedule_all_2_list[j].value==data[i][1]){
							 		billing_schedule_all_2_list[j].checked=true;
									 break;
							 	 } 
						  	 }
					  }if(data[i][1]=='All'){
						  for(var j=0;j<billing_schedule_all_list.length;j++){ 
							 	 if(billing_schedule_all_list[j].value==data[i][1]){
							 		billing_schedule_all_list[j].checked=true;
									 break;
							 	 } 
						  	 }
					  }else{ 
					 	 for(var j=0;j<billing_schedule_2_list.length;j++){ 
						 	 if(billing_schedule_2_list[j].value==data[i][1]){
								 billing_schedule_2_list[j].checked=true;
								 break;
						 	 } 
					  	 }
					  }	
				  }
				  /////
			  }
		  } 
		  $("#billing_time_from_1").val(time_from_day);
		  $("#billing_time_to_1").val(time_to_day);
		  $("#billing_time_from_2").val(time_from_week);
		  $("#billing_time_to_2").val(time_to_week);
		  loadPayment(customer_code);
	} 
}); 
}
function loadPayment(customer_code){
	var query="SELECT customer_code, schedule, type, time_from, time_to, created_dttm, updated_dttm ,"+
		" DATE_FORMAT(time_from,'%H') as c1, "+ // 7
		" DATE_FORMAT(time_from,'%i') as c2, "+ // 8
		" DATE_FORMAT(time_to,'%H') as d1, "+ //  9
		" DATE_FORMAT(time_to,'%i') as d2 "+ // 10
" FROM "+SCHEMA_G+".ar_payment_schedule where customer_code='"+customer_code+"' " ; 
	var time_from_day="";
	var time_to_day="";
	var time_from_week="";
	var time_to_week="";
BillCycleAjax.searchObject(query,{
	callback:function(data){  
		  if(data!=null && data.length>0){
			  for(var i=0;i<data.length>0;i++){
				 
				  if(data[i][2]=='day'){
					  time_from_day=data[i][7]+":"+data[i][8];
					  time_to_day=data[i][9]+":"+data[i][10];
					  var billing_schedule_1_list=document.getElementsByName("payment_schedule_1");
					  for(var j=0;j<billing_schedule_1_list.length;j++){ 
						  if(billing_schedule_1_list[j].value==data[i][1]){
							 billing_schedule_1_list[j].checked=true;
							 break;
						  } 
					  }
				  }else  if(data[i][2]=='week'){
					  time_from_week=data[i][7]+":"+data[i][8];
					  time_to_week=data[i][9]+":"+data[i][10];
					  var billing_schedule_2_list=document.getElementsByName("payment_schedule_2");
					  var billing_schedule_all_2_list=document.getElementsByName("payment_schedule_all_2");
					  var payment_schedule_all_list=document.getElementsByName("payment_schedule_all");
					  
					  if(data[i][1]=='Mon' || data[i][1]=='Tue' || data[i][1]=='Wed' || data[i][1]=='Thu' ||  data[i][1]=='Fri'){
						  for(var j=0;j<billing_schedule_all_2_list.length;j++){ 
							 	 if(billing_schedule_all_2_list[j].value==data[i][1]){
							 		billing_schedule_all_2_list[j].checked=true;
									 break;
							 	 } 
						  	 }
					  }if(data[i][1]=='All'){
						  for(var j=0;j<payment_schedule_all_list.length;j++){ 
							 	 if(payment_schedule_all_list[j].value==data[i][1]){
							 		payment_schedule_all_list[j].checked=true;
									 break;
							 	 } 
						  	 }
					  }else{ 
					 	 for(var j=0;j<billing_schedule_2_list.length;j++){ 
						 	 if(billing_schedule_2_list[j].value==data[i][1]){
								 billing_schedule_2_list[j].checked=true;
								 break;
						 	 } 
					  	 }
					  }	
				  }
				  /////
			  }
		  } 

		  $("#payment_time_from_1").val(time_from_day);
		  $("#payment_time_to_1").val(time_to_day);
		  $("#payment_time_from_2").val(time_from_week);
		  $("#payment_time_to_2").val(time_to_week);
		  $("#configElement").slideDown("slow"); 
	} 
}); 
}
function saveConfig(){
	  var customer_code_value= $("#customer_code").val(); 
	 	//alert(kpiCode+","+employeeName);
	 	if(customer_code_value.length==0 && customer_code_value.length==0){
	 		alert("Please fill Customer Code.");
	 		return false;
	 	} 
	 	  
	//	private int districtCode;

	      var includeReceiptFlag='N';
	      if($("#include_receipt_flag").prop("checked"))
	      		includeReceiptFlag='Y';
	     
	  
	 var ar_customer={
			 customerCode:jQuery.trim($("#customer_code").val()),
			 customerName:jQuery.trim($("#customer_name").val()),
			// districtCode:jQuery.trim($("#district_code").val()),
			 districtCode:jQuery.trim($("#district_code").val()), 
			 districtName:jQuery.trim($("#district_code option:selected").text()),
			 //includeReceiptFlag:jQuery.trim($("#include_receipt_flag").val()),
			 includeReceiptFlag:includeReceiptFlag,
			 phoneNo:jQuery.trim($("#phone_no").val()),
			 provinceName:jQuery.trim($("#province_name").val()),
			 shiftBillDateFlag:jQuery.trim($("#shift_bill_date_flag").val())
	 };
	// alert("ar_customer->"+ar_customer.districtCode+",ar_customer.districtCode-->"+ar_customer.districtName)
	 var ar_billing_schedules=[];
	 var billing_schedule_1_array=document.getElementsByName("billing_schedule_1"); //type day
	// var haveValue=false;
	 var billing_time_from_1=$("#billing_time_from_1").val();
	 var billing_time_to_1=$("#billing_time_to_1").val();
	 var billing_time_from_2=$("#billing_time_from_2").val();
	 var billing_time_to_2=$("#billing_time_to_2").val();
	 var haveValue=false;
	 for(var i=0;i<billing_schedule_1_array.length;i++){
		 if(billing_schedule_1_array[i].checked){
			 var ar_billing_schedule={
					 customerCode:customer_code_value,
					 schedule:billing_schedule_1_array[i].value,
					 type:'day',
					 timeFromStr:billing_time_from_1,
					 timeToStr:billing_time_to_1
					 
			 };
			 haveValue=true;
			 ar_billing_schedules.push(ar_billing_schedule);
		 }
	 }
	 if(haveValue){
		 if(jQuery.trim(billing_time_from_1).length==0){
			 alert("กรุณากรอก ระหว่างเวลา.");
			$("#billing_time_from_1").focus();
			 return false;
		 }
		 if(jQuery.trim(billing_time_to_1).length==0){
			 alert("กรุณากรอก  ถึงเวลา.");
			 $("#billing_time_to_1").focus();
			 return false;
		 }
	 }
	 
	 haveValue=false;
	 <%--  <input type="checkbox" name="billing_schedule_all_2" value="Mon">&nbsp;&nbsp;ทุกจันทร์ --%>
	 var billing_schedule_all_2_array=document.getElementsByName("billing_schedule_all_2"); //type week
	 for(var i=0;i<billing_schedule_all_2_array.length;i++){
		 if(billing_schedule_all_2_array[i].checked){
			 var ar_billing_schedule={
					 customerCode:customer_code_value,
					 schedule:billing_schedule_all_2_array[i].value,
					 type:'week',
					 timeFromStr:billing_time_from_2,
					 timeToStr:billing_time_to_2
					 
			 };
			 haveValue=true;
			 ar_billing_schedules.push(ar_billing_schedule);
		 }
	 }
	 
	 <%--  <input type="checkbox" name="billing_schedule_all" value="All">&nbsp;&nbsp;ทุกวัน --%>
	 var billing_schedule_all_array=document.getElementsByName("billing_schedule_all"); //type week
	 for(var i=0;i<billing_schedule_all_array.length;i++){
		 if(billing_schedule_all_array[i].checked){
			 var ar_billing_schedule={
					 customerCode:customer_code_value,
					 schedule:billing_schedule_all_array[i].value,
					 type:'week',
					 timeFromStr:billing_time_from_2,
					 timeToStr:billing_time_to_2
					 
			 };
			 haveValue=true;
			 ar_billing_schedules.push(ar_billing_schedule);
		 }
	 }
	 
	 <%-- <input type="checkbox" name="billing_schedule_2" value="MonW1">&nbsp;&nbsp;จันทร์W1 --%>
	 var billing_schedule_2_array=document.getElementsByName("billing_schedule_2"); //type week
	 for(var i=0;i<billing_schedule_2_array.length;i++){
		 if(billing_schedule_2_array[i].checked){ 
			 var ar_billing_schedule={
					 customerCode:customer_code_value,
					 schedule:billing_schedule_2_array[i].value,
					 type:'week',
					 timeFromStr:billing_time_from_2,
					 timeToStr:billing_time_to_2
					 
			 };
			 haveValue=true;
			 ar_billing_schedules.push(ar_billing_schedule);
		 }
	 }
	 if(haveValue){
		 if(jQuery.trim(billing_time_from_2).length==0){
			 alert("กรุณากรอก ระหว่างเวลา.");
			 $("#billing_time_from_2").focus();
			 return false;
		 }
		 if(jQuery.trim(billing_time_to_2).length==0){
			 alert("กรุณากรอก  ถึงเวลา.");
			 $("#billing_time_to_2").focus();
			 return false;
		 }
	 }
	 
	 haveValue =false;
	 var ar_payment_schedules=[];
	 var payment_schedule_1_array=document.getElementsByName("payment_schedule_1"); //type day
	 var payment_time_from_1=$("#payment_time_from_1").val();
	 var payment_time_to_1=$("#payment_time_to_1").val(); 
	 var payment_time_from_2=$("#payment_time_from_2").val();
	 var payment_time_to_2=$("#payment_time_to_2").val();
	 for(var i=0;i<payment_schedule_1_array.length;i++){
		 if(payment_schedule_1_array[i].checked){
			 var ar_payment_schedule={
					 customerCode:customer_code_value,
					 schedule:payment_schedule_1_array[i].value,
					 type:'day',
					 timeFromStr:payment_time_from_1,
					 timeToStr:payment_time_to_1
					 
			 };
			 haveValue=true;
			 ar_payment_schedules.push(ar_payment_schedule);
		 }
	 }
	 if(haveValue){
		 if(jQuery.trim(payment_time_from_1).length==0){
			 alert("กรุณากรอก ระหว่างเวลา.");
			 $("#payment_time_from_1").focus();
			 return false;
		 }
		 if(jQuery.trim(payment_time_to_1).length==0){
			 alert("กรุณากรอก  ถึงเวลา.");
			 $("#payment_time_to_1").focus();
			 return false;
		 }
	 }
	 
	 haveValue=false;
	 <%--  <input type="checkbox" name="payment_schedule_all_2" value="Mon">&nbsp;&nbsp;ทุกจันทร์ --%>
	 var payment_schedule_all_2_array=document.getElementsByName("payment_schedule_all_2"); //type week
	 for(var i=0;i<payment_schedule_all_2_array.length;i++){
		 if(payment_schedule_all_2_array[i].checked){
			 var ar_payment_schedule={
					 customerCode:customer_code_value,
					 schedule:payment_schedule_all_2_array[i].value,
					 type:'week',
					 timeFromStr:payment_time_from_2,
					 timeToStr:payment_time_to_2
					 
			 };
			 haveValue=true;
			 ar_payment_schedules.push(ar_payment_schedule);
		 }
	 }
	 
	 <%--  <input type="checkbox" name="payment_schedule_all" value="All">&nbsp;&nbsp;ทุกวัน --%>
	 var payment_schedule_all_array=document.getElementsByName("payment_schedule_all"); //type week
	// alert(payment_schedule_all_array.length)
	 for(var i=0;i<payment_schedule_all_array.length;i++){
		 if(payment_schedule_all_array[i].checked){
		//	 alert(payment_schedule_all_array[i].checked) 
			 var ar_payment_schedule={
					 customerCode:customer_code_value,
					 schedule:payment_schedule_all_array[i].value,
					 type:'week',
					 timeFromStr:payment_time_from_2,
					 timeToStr:payment_time_to_2
					 
			 };
			 haveValue=true;
			 ar_payment_schedules.push(ar_payment_schedule);
		 }
	 }

	 <%-- <input type="checkbox" name="payment_schedule_2" value="MonW1">&nbsp;&nbsp;จันทร์W1 --%>
	 var payment_schedule_2_array=document.getElementsByName("payment_schedule_2"); //type week
	 for(var i=0;i<payment_schedule_2_array.length;i++){
		 if(payment_schedule_2_array[i].checked){
			 var ar_payment_schedule={
					 customerCode:customer_code_value,
					 schedule:payment_schedule_2_array[i].value,
					 type:'week',
					 timeFromStr:payment_time_from_2,
					 timeToStr:payment_time_to_2
					 
			 };
			 haveValue=true;
			 ar_payment_schedules.push(ar_payment_schedule);
		 }
	 }
	 if(haveValue){
		 if(jQuery.trim(payment_time_from_2).length==0){
			 alert("กรุณากรอก ระหว่างเวลา.");
			 $("#payment_time_from_2").focus();
			 return false;
		 }
		 if(jQuery.trim(payment_time_to_2).length==0){
			 alert("กรุณากรอก  ถึงเวลา.");
			 $("#payment_time_to_2").focus();
			 return false;
		 }
	 }
	// alert(SCHEMA_G);
	// alert(ar_customer);
	//  alert(ar_payment_schedules)
	//  BillCycleAjax.executeBillCycleQuery(SCHEMA_G,ar_customer,ar_billing_schedules,ar_payment_schedules,{
		 BillCycleAjax.executeBillCycleQuery(SCHEMA_G,ar_customer,ar_billing_schedules,ar_payment_schedules,{
		callback:function(data){
			// $('html, body').animate({ scrollTop: 0 }, 'slow'); 
			var _message="";
			if(data==0)
				_message="Can not Update confing.";//alert("Can not Update confing.");
			else
				_message="Updated.";//alert("Updated .");
				
			$("#_message" ).html(_message);
			$( "#dialog-update" ).dialog({
				/* height: 140, */
				position:'top',
				modal: true,
				buttons: {
					"Ok": function() { 
						$( this ).dialog( "close" );
					}
				}, 
				beforeClose: function( event, ui ) {
					//alert("ok");
					 $('html, body').animate({ scrollTop: 0 }, 'slow');
				}
			});
		},
		errorHandler:function(errorString, exception) { 
			 //$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			//alert("errorString->"+errorString+",exception-->"+exception);
			//alert(dwr.util.toDescriptiveString(exception, 2)); 
			$("#_message" ).html(dwr.util.toDescriptiveString(exception, 2));
			$( "#dialog-update" ).dialog({
				/* height: 140, */
				position:'top',
				modal: true,
				buttons: {
					"Ok": function() { 
						$( this ).dialog( "close" );
					}
				},
				beforeClose: function( event, ui ) {
					//alert("ok");
					 $('html, body').animate({ scrollTop: 0 }, 'slow');
				}
			});
		}
	}); 
}
function resetBillDay(){
	 var billing_schedule_1_array=document.getElementsByName("billing_schedule_1"); //type day
	 for(var i=0;i<billing_schedule_1_array.length;i++){
		 billing_schedule_1_array[i].checked=false;
	 }
}
function resetBillWeek(){
	var billing_schedule_all_2_array=document.getElementsByName("billing_schedule_all_2"); //type week
	 for(var i=0;i<billing_schedule_all_2_array.length;i++){
		 billing_schedule_all_2_array[i].checked=false;
	 }
}
function reset_billing_schedule_all(){
	var billing_schedule_all_array=document.getElementsByName("billing_schedule_all"); //type week
	 for(var i=0;i<billing_schedule_all_array.length;i++){
		 billing_schedule_all_array[i].checked=false;
	 }
}
function reset_billing_schedule_2(){
	var billing_schedule_2_array=document.getElementsByName("billing_schedule_2"); //type week
	 for(var i=0;i<billing_schedule_2_array.length;i++){
		 billing_schedule_2_array[i].checked=false;
	 }
}
function resetPaymentDay(){
	 var payment_schedule_1_array=document.getElementsByName("payment_schedule_1"); //type day
	 for(var i=0;i<payment_schedule_1_array.length;i++){
		 payment_schedule_1_array[i].checked=false;
	 }
}
function resetPaymentWeek(){
	var payment_schedule_all_2_array=document.getElementsByName("payment_schedule_all_2"); //type week
	 for(var i=0;i<payment_schedule_all_2_array.length;i++){
		 payment_schedule_all_2_array[i].checked=false;
	 }
}
function reset_payment_schedule_all(){
	var payment_schedule_all_array=document.getElementsByName("payment_schedule_all"); //type week
	 for(var i=0;i<payment_schedule_all_array.length;i++){
		 payment_schedule_all_array[i].checked=false;
	 }
}
function reset_payment_schedule_2(){
	var payment_schedule_2_array=document.getElementsByName("payment_schedule_2"); //type week
	 for(var i=0;i<payment_schedule_2_array.length;i++){
		 payment_schedule_2_array[i].checked=false;
	 }
}
</script> 
</body>
</html> 
 
 