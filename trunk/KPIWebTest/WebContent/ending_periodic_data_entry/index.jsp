<%@ page contentType="text/html; charset=utf-8" %> 
<html> 
<head>
<title>BackOffice</title>
 <meta charset="UTF-8" />   
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
 
<style>
.ui-widget { font-family: Trebuchet MS, Tahoma, Verdana,
 Arial, sans-serif; font-size: 12px; }
input[type=text] {
	height: 30px;
	line-height: 30px
}
 </style>
<style type="text/css"> 
.th_class{text-align: center;
}
a{cursor: pointer;}
</style>
  
<script type="text/javascript">
//var _path="/KPIWebTest/";
var SCHEMA_G='mcic_kpi_app';
var _path='<%=request.getContextPath()%>'+'/'; 
var mail_toG;
var mail_subjectG;
var mail_messageG;
var mail_attachG; 

$(document).ready(function() {
	$('#tabs').tabs();
	$('#tabs > ul > li > a').css("width","70px"); 
	loadDynamicPage("kpi_result");
	togle_page('kpi_result','employee_link'); 
});
function loadDynamicPage(pageId){ 
	//pageId=_path+"ending_periodic_data_entry/load?page="+pageId;
	pageId=_path+"ending_periodic_data_entry/template/"+pageId+".jsp"; 
	 
			$.ajax({
				  type: "get",
				  url: pageId,
				  cache: false
				 // data: { name: "John", location: "Boston" }
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
	//alert(data)
	appendContentWithId(data,"_content");
	
}
 
</script>
</head> 
<body> 
  <div class="row-fluid"  style="position:fixed;">
     	<div class="span7"> 
              <div class="navbar" style="padding-top: 8px;padding-left: 10px;padding-right: 10px;height: 22px;width: 1029px">
              <div class="navbar-inner" style="width: 1029px">
                <div class="container"> 
                  <div class="nav-collapse collapse navbar-responsive-collapse">
                    <ul class="nav">  
                      <li id="employee_link"><a onclick="togle_page('kpi_result','employee_link')">KPI Result</a></li> 
                      <li id="breakdown_link"><a onclick="togle_page('approve_kpi_result','breakdown_link')">Approve KPI Result</a></li>
                      <li id="roadpump_link"><a onclick="togle_page('appraisal_adjustment','roadpump_link')">Appraisal Adjustment</a></li>
                    </ul>  
                  </div>
                </div>
              </div>
            </div> 
     	</div>
     	<div class="span7">
     	<div id="_content" class="span7" style="margin-left:-8px;padding-top: 3px;">
      	
      	</div>
     	</div>
     </div> 
</body>
</html>

