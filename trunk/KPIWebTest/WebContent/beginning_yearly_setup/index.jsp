<%@ page contentType="text/html; charset=utf-8" %>
<%-- <%@ include file="/WEB-INF/jsp/includes.jsp" %> --%>
 
<html> 
<head>
<title>BackOffice</title>
 <meta charset="UTF-8" />  
<%-- <link rel="icon" href="<c:url value='/resources/images/favicon.ico'/>" type="image/x-icon" />
<link rel="shortcut icon" href="<c:url value='/resources/images/favicon.ico'/>" type="image/x-icon" /> 
  <script  src="<c:url value='/resources/js/jquery-1.8.3.min.js'/>" type="text/javascript"></script> 
<script type="text/javascript" src="<c:url value='/resources/js/smoothness/jquery-ui-1.9.1.custom.min.js'/>"></script>
 <script type="text/javascript" src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
<script src="<c:url value='/resources/bootstrap/js/bootstrap.min.js'/>" type="text/javascript"></script>
<link href="<c:url value='/resources/css/smoothness/jquery-ui-1.9.1.custom.css'/>" type="text/css"  rel="stylesheet" /> 
<link href="<c:url value='/resources/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet"  type="text/css"/> 

  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/demo.css'/>" />
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style3.css'/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/animate-custom.css'/>" />
--%>
   <script  src="../resources/js/jquery-1.8.3.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="../resources/js/smoothness/jquery-ui-1.9.2.custom.min.js"></script>
 <script type="text/javascript" src="../resources/ckeditor/ckeditor.js"></script>
<script src="../resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="../resources/css/smoothness/jquery-ui-1.9.2.custom.css" type="text/css"  rel="stylesheet" /> 
<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"  type="text/css"/> 
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
<script type="text/javascript">
var _path='<%=request.getContextPath()%>'+'/'; 
var mail_toG;
var mail_subjectG;
var mail_messageG;
var mail_attachG; 

$(document).ready(function() {
	$('#tabs').tabs();
	$('#tabs > ul > li > a').css("width","70px"); 
	loadDynamicPage("appraisal_period");
	togle_page('appraisal_period','employee_link');
});
function loadDynamicPage(pageId){
	//pageId=_path+"beginning_yearly_setup/load?page="+pageId;
	pageId=_path+"beginning_yearly_setup/template/"+pageId+".jsp";
	//alert(pageId)

	//	var id="1";
		//$.get('ajax/search', function(data) {
	 /* 	$.get(pageId, function(data) {
			  // alert(data);
			  if(data!=null){
				  appendContent(data);
			  }
			}); */
			
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
	//    $("#"+id_before).removeClass("active"); 
     
	$("ul[class=nav] > li").removeClass("active");
	/* $("ul[class=nav] > li").each(function(){
	        $(this).keypress(function(event) {
	  	 	  if ( event.which == 13 ) {
	 	 	     event.preventDefault();
	 	 	    	doAction('search','0');
	 	 	   }
	 	 });
	 }); */
	    $("#"+id_active).addClass("active");
		loadDynamicPage(pageId);
}
function appendContentWithId(data,contentId){
	if(data.indexOf("j_username")!=-1 || data.indexOf("loginform")!=-1){
		//alert("to home") 
		  /* window.location.href="<c:url value='/j_spring_security_logout'/>"; */
		  window.location.href="<c:url value='/logout'/>";
		 //$("#_content").html(data);
	  }else{
		/*   var _url_template=window.location.href;
		  if(_url_template.indexOf("template")!=-1){ 
			  window.location.href="<c:url value='/'/>";
		  }else{ */
			  $("#"+contentId).html(data);
		 // }
	  }
	
}
function appendContent(data){
	//alert(data)
	appendContentWithId(data,"_content");
	
}
function doSendMailToApprove(mail_todo_idG,mail_todo_refG){
	loadDynamicPage("getmailToApprove/"+mail_todo_idG+"/"+mail_todo_refG);
	/* //alert(action)
	var checked="1";
	// alert(document.getElementById("mail_attach").checked);
	if(!document.getElementById("mail_attach").checked)
		checked="0";
	   var data_to_server= { 
			  mail_todo_id:mail_todo_idG,
			  mail_todo_ref:mail_todo_refG,
			  mail_to: mail_toG.val(),
			  mail_subject: mail_subjectG.val(),
			  mail_message:mail_messageG.val(),
			  mail_attach:checked
				};
	$.post("sendmailToApprove",data_to_server, function(data) {
		  //alert(data);
		    appendContent(data);
		  // alert($("#_content").html());
		}); */
  }
function openMailDialog(todo_id,todo_ref){
	$("#mail_todo_id").val(todo_id);
	$("#mail_todo_ref").val(todo_ref);
	$( "#dialog-modal" ).dialog({
		/* height: 140, */
		modal: true,
		buttons: {
			"Ok": function() { 
				$( this ).dialog( "close" );  
				doSendMailToApprove(todo_id,todo_ref); 
				 
			},
			"Close": function() { 
				$( this ).dialog( "close" );				 
			}
		}
	});
}
</script>
</head> 
<body>
  <!--  <div class="container">  -->
      <!-- <div class="row-fluid"  style="position:fixed;z-index: 1030;background-image: url(http://localhost:8080/pst/resources/css/smoothness/images/ui-bg_highlight-soft_75_cccccc_1x100.png)"> -->
      <div class="row-fluid"  style="position:fixed;z-index: 1030;background-image: url(<c:url value='/resources/css/smoothness/images/ui-bg_highlight-soft_75_cccccc_1x100.png'/>)">
     
     	<div class="span7">
     	<!-- <span style="float:left;"> 
            <table border="1" width="800px">
            <tr> 
            <td width="100%"> -->
               <!-- <div class="navbar" style="float:right;position: relative;top: 8px">  -->
             <div class="navbar" style="padding-top: 8px;padding-left: 10px;padding-right: 10px;">
              <div class="navbar-inner">
                <div class="container"> 
                  <div class="nav-collapse collapse navbar-responsive-collapse">
                    <ul class="nav">  
                      <li id="employee_link"><a onclick="togle_page('appraisal_period','employee_link')">Appraisal Period</a></li>
                     <!--   <li  id="job_link"><a onclick="togle_page('job/init','job_link')">Job</a></li>  
                      <li id="breakdown_link"><a onclick="togle_page('perspective','breakdown_link')">Perspective</a></li>
                      <li id="costs_link"><a onclick="togle_page('uom','costs_link')">UOM</a></li>
                      <li id="roadpump_link"><a onclick="togle_page('data_source','roadpump_link')">Data Source</a></li>
                      <li id="maintenance_link"><a onclick="togle_page('kpi','maintenance_link')">KPI</a></li>
                      <li  id="report_link"><a onclick="togle_page('kpi_baseline','report_link')">KPI Baseline</a></li>  -->
                    </ul>  
                  </div><!-- /.nav-collapse -->
                </div>
              </div><!-- /navbar-inner -->
            </div>
           <!--  </td>
            </tr> 
            </table> 
         </span> -->
     	</div>
     	<div class="span7">
     	<div id="_content" class="span7">
      	
      	</div>
     	</div>
     </div>
      <!-- <div class="row-fluid" style="margin-top: 63px">  -->
      <!-- <div class="row-fluid"> 
     	<div id="_content" class="span8 offset2">
      	
      	</div>
    </div>   -->
  <!-- </div>  --> 
</body>
</html>

