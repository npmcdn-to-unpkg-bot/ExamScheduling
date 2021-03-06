<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>職缺列表</title>

<!-- jQuery -->
<!-- <script src='../js/jquery.min.js'></script> -->
<%@ include file="../WEB-INF/cdn.file" %>
<!-- jQuery UI -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="/ExamScheduling/css/preload.css" />
<!-- <script src="//code.jquery.com/jquery-1.10.2.js"></script> -->
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- 依需要參考已編譯外掛版本（如下），或各自獨立的外掛版本 -->
<script src="../js/bootstrap.min.js"></script>
  
<script>
$(function() {
	 $('body').addClass('loaded');
	var dialog, form,
	
	id = $( "#id" ),
	jobname = $( "#jobname" ),
	employee = $( "#employee" ),
    password = $( "#password" ),
	allFields = $( [] ).add( jobname ).add( employee ).add( password ),
	tips = $( ".validateTips" );
	
	function addUser() {
		$.ajax({
			"type":"post",
			"url":"JobSaveServlet",
			"dataType":"json",
			"data":{"id": id.val(), "jobname": jobname.val(),"employee": employee.val()},
			"success":function(data){
// 				console.log(data);
// 				alert(data);
				$( "#users tbody" ).append( "<tr>" +
		      		"<td>" + data[3] + "</td>" +
			      	"<td>" + jobname.val() + "</td>" +
			      	"<td>" + data[2] + "</td>" +
			      	"<td>" + "<a href='#' class='edit-job'><span class='glyphicon glyphicon-pencil'>修改</span></a>"+
				 	" / " 
							+"<a href='#' class='delete-job'><span class='glyphicon glyphicon-trash'>刪除</span></a>" + "</td>" +
			    	"</tr>" );
		    	dialog.dialog( "close" );
			}
		});
		
	}
	
	dialog = $( "#dialog-form" ).dialog({
	  autoOpen: false,
	  height: 300,
	  width: 350,
	  modal: true,
	  buttons: {
	    "送出": addUser,
	    "取消": function() {
	      dialog.dialog( "close" );
	    }
	  },
	  close: function() {
	    form[ 0 ].reset();
	    allFields.removeClass( "ui-state-error" );
	  }
	});
	
	form = dialog.find( "form" ).on( "submit", function( event ) {
      event.preventDefault();
      addUser();
    });
 
    $( "#create-job" ).button().on( "click", function() {
      dialog.dialog( "open" );
    });
    
   
    
    $(".delete-job").click(function(){
    	location.href = "http://www.yahoo.com.tw";
    });
    
});
</script>
  
</head>
<body>
<%@ include file="../WEB-INF/header/sa_slidenav.jsp" %>
<!-- loading圖 -->
	<div id="loader-wrapper">
		<div id="loader"></div>

		<div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>

	</div>
<div class="container-fluid">
	
	<div class="row">
	  	
	  	<div class="col-md-3"></div>
	  	
	  	<div class="col s8 offset-s2">
	  		<h3 class="text-center">職位</h3>
	  		<a href="JobDoServlet?action=add&id=${job.jobid}" id="create-job000"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增</a>
	  		
	  		<div id="users-contain" class="ui-widget"><!-- start -->
	  		<table id="users" class="table  table-bordered">
	  			<tr>
	  				<td>序號</td>
	  				<td>職位名稱</td>
	  				<td>負責主考官</td>
	  				<td>職缺預約顏色</td>
	  				<td>啟用狀態</td>
	  				<td></td>
	  			</tr>
	  			
	  			<c:forEach var="job" items="${joblists}" varStatus="lp">
	  			<tr>
	  				<td>${lp.index+1}</td>
	  				<td id="${job.jobid}name">${job.jobname}</td>
	  				<td id="${job.jobid}emp">
		  				<c:forEach var="employee" items="${job.employee}">
		  					${employee.empname}
		  				</c:forEach>
	  				</td>
	  				<td><input type="color" name="jobcolor" value="${job.jobcolor}" readonly="readonly"></td>
	  				<td>
						<c:if test="${job.jobactive == true}">啟用中</c:if>
		  				<c:if test="${job.jobactive == false}">未啟用</c:if>  				
	  				</td>
	  				<td>
						<a href="JobDoServlet?action=edit&id=${job.jobid}" class="edit-job"><span class="glyphicon glyphicon-pencil" aria-hidden="true">修改</span></a>
						 / 
						<a href="JobDoServlet?action=delete&id=${job.jobid}" class="delete-job" ><span class="glyphicon glyphicon-trash" aria-hidden="true">刪除</span></a>
					</td>
	  			</tr>
	  			</c:forEach>
	  			
				<div id="dialog-form" title="職缺設定">
					<form>
						<fieldset>
							<label for="jobname">職位名稱：</label><br />
							<input type="text" name="jobname" id="jobname" value="" class="">
							<br /><br />
							<label for="employee">主考管(負責人):</label><br />
<!-- 							<input type="text" name="employee" id="employee" value="" class=""> -->
								<select name="employee" id="employee" style="width:200px">
									<c:forEach var="emp" items="${emplists}">
										<option value="${emp.empno}">${emp.empname}</option>
									</c:forEach>
								</select>
							
							<!-- Allow form submission with keyboard without duplicating the dialog button -->
							<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
						</fieldset>
					</form>
				</div>
				
	  		</table>
	  		</div><!-- end -->
	  	</div>
	  	
	  	<div class="col-md-3"></div>
	
	</div>

</div>

<script>
	
</script>

</body>
</html>