<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%    request.setCharacterEncoding("UTF-8");  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href='../css/fullcalendar.css' rel='stylesheet' />
<script src='../js/moment.min.js'></script>
<script src='../js/jquery.min.js'></script>
<script src='../js/fullcalendar.min.js'></script>
<!--燈箱樣式效果 -->
<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox.css">
<script src='../js/jquery.fancybox.js'></script>
<!--jquery.ui 裡日期插件 -->
<script src='http://code.jquery.com/ui/1.10.3/jquery-ui.js'></script>

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- 依需要參考已編譯外掛版本（如下），或各自獨立的外掛版本 -->
<script src="../js/bootstrap.min.js"></script>



<style type="text/css">
	#calendar{width:960px; margin:20px auto 10px auto}
	.fancy{width:450px; height:auto}
	.fancy h4{line-height:30px; border-bottom:1px solid #d3d3d3;}
/* 	.fancy h3{height:30px; line-height:30px; border-bottom:1px solid #d3d3d3; font-size:14px} */
	.fancy form{padding:10px}
/* 	.fancy p{height:28px; line-height:28px; padding:4px; color:#999} */
/* 	.input{height:20px; line-height:20px; padding:2px; border:1px solid #d3d3d3; width:100px} */
/* 	.btn{-webkit-border-radius: 3px;-moz-border-radius:3px;padding:5px 12px; cursor:pointer} */
/* 	.btn_ok{background: #360;border: 1px solid #390;color:#fff} */
/* 	.btn_cancel{background:#f0f0f0;border: 1px solid #d3d3d3; color:#666 } */
 	.btn_del{background:#f90;border: 1px solid #f80; color:#fff } 
 	.sub_btn{height:32px; line-height:32px; padding-top:6px; border-top:1px solid #f0f0f0; text-align:right; position:relative} 
 	.sub_btn .del{position:absolute; left:2px} 
</style>
<script>
	
	$(document).ready(function() { 
		
	    $('#calendar').fullCalendar({ 
	        header:{
	        	left: 'title today',
	        	center: 'month,basicWeek,basicDay,agendaWeek,agendaDay',
	        	right: 'prevYear prev next nextYear'
	        },
	     
	        editable: true,
	      
	       events: '/ExamScheduling/employee/EmployeeJSONServlet',// 一開始頁面
	    	   dayClick: function(date, allDay, jsEvnt, view) { 
		            //var selDate = $.fullCalendar.formatDate(date,'yyyy-MM-dd');//格式化日期 
		            var selDate = moment(date).format('YYYY-MM-DD');
		            // alert(selDate);
		       
		        },
		        eventClick: function(calEvent, jsEvent, view) { 
		            $.fancybox({ 
		                'type':'ajax', 
		                'href':'/ExamScheduling/employee/Score?action=get_Event&id='+calEvent.id
		                
		            }); 
		            //alert(calEvent.id);  //取得事件編號
		        } 
	   
	    })
	    

	}); 

</script>

<style>

	body {
/* 		margin: 40px 10px; */
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		padding: 10px;
		max-width: 900px;
		margin: 0 auto;
	}
	.list-group{
		padding: 10px;
	}

</style>
</head>
<body>
  <%@ include file="../WEB-INF/header/header.jsp" %>

							<div id='calendar'></div>

</body>
</html>