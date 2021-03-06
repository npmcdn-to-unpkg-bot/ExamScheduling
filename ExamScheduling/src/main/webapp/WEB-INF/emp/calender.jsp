<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/cdn.file"%>
<%@ include file="/WEB-INF/header/slide_mqtt.file"%>
<%@ include file="/WEB-INF/calendar.file"%>
<link rel="stylesheet" type="text/css"
	href="/ExamScheduling/css/preload.css" />
<title>主考官行事曆</title>

<style type="text/css">
#calendar {
 	max-width: 70%;
/* 	margin: 20px auto 10px auto */
}
</style>

<style>
body {
	/* 		margin: 40px 10px; */
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

/* #calendar { */
/* 	padding: 10px; */

/* 	margin: 0 auto; */
/* } */

.list-group {
	padding: 10px;
}
</style>
<script type="text/javascript">
	// Your Client ID can be retrieved from your project in the Google
	// Developer Console, https://console.developers.google.com
	var CLIENT_ID = '407724956870-c72mm3h26iv5mtrs6csn6bfsrdsblkm6.apps.googleusercontent.com';
	var gooEvent = [];
	var SCOPES = [ "https://www.googleapis.com/auth/calendar.readonly" ];

	/**
	 * Check if current user has authorized this application.
	 */
	function checkAuth() {
		gapi.auth.authorize({
			'client_id' : CLIENT_ID,
			'scope' : SCOPES.join(' '),
			'immediate' : true
		});
	}

	/**
	 * Handle response from authorization server.
	 *
	 * @param {Object} authResult Authorization result.
	 */
	function handleAuthResult(authResult) {
		var authorizeDiv = document.getElementById('authorize-div');
		if (authResult && !authResult.error) {
			// Hide auth UI, then load client library.
			authorizeDiv.style.display = 'none';
			loadCalendarApi();
		} else {
			// Show auth UI, allowing the user to initiate authorization by
			// clicking authorize button.
			authorizeDiv.style.display = 'inline';
		}
	}

	/**
	 * Initiate auth flow in response to user clicking authorize button.
	 *
	 * @param {Event} event Button click event.
	 */
	function handleAuthClick(event) {
		 loadCalendarApi();
		return false;
	}

	/**
	 * Load Google Calendar client library. List upcoming events
	 * once client library is loaded.
	 */
	function loadCalendarApi() {
		gapi.client.load('calendar', 'v3', listUpcomingEvents);
	}

	/**
	 * Print the summary and start datetime/date of the next ten events in
	 * the authorized user's calendar. If no events are found an
	 * appropriate message is printed.
	 */
	function listUpcomingEvents() {
		var request = gapi.client.calendar.events.list({
			'calendarId' : 'primary',
			'timeMin' : (new Date()).toISOString(),
			'showDeleted' : false,
			'singleEvents' : true,
			'maxResults' : 10,
			'orderBy' : 'startTime'
		});

		request.execute(function(resp) {
			var events = resp.items;
			console.log(123);
			gooEvent=[];
			if (events.length > 0) {
				for (i = 0; i < events.length; i++) {
					var event = events[i];
					var when = event.start.dateTime;
					if (!when) {
						when = event.start.date;
					}
					
					gooEvent.push({
						id : event.id,
						title : '預約額滿',
						start : event.start.dateTime,
						end : event.end.dateTime,
						location : event.location,
						description : event.description
					});
					$.ajax({
						url : '/ExamScheduling/employee/EmployeeJSONServlet',
						data : {
							start : event.start.dateTime,
							end : event.end.dateTime
						},
						type : 'post',
						
						success : function(response) {						
						}
					});
				}
				//.log(gooEvent[0]['title']);
				
				$('#calendar').fullCalendar( 'addEventSource', gooEvent );
			}

		});
	}


</script>
<script src="https://apis.google.com/js/client.js?onload=checkAuth">
	
</script>
<script>
	$(document)
			.ready(
					function() {
						$('body').addClass('loaded');
						$('#calendar')
								.fullCalendar(
										{
											header : {
												left : 'title today',
												center : 'month,basicWeek,basicDay,agendaWeek,agendaDay',
												right : 'prevYear prev next nextYear'
											},
											editable : true,
											events : '/ExamScheduling/employee/EmployeeJSONServlet',// 一開始頁面
											dayClick : function(date, allDay,
													jsEvnt, view) {
												var selDate = moment(date)
														.format('YYYY-MM-DD');
											},
											
											eventClick : function(calEvent,
													jsEvent, view) {
												$
														.fancybox({
															'type' : 'ajax',
															'href' : '/ExamScheduling/employee/Score?action=get_Event&id='
																	+ calEvent.id
														});
											}, buttonText: {
									        	  today: '今天',
									        	  month: '月',
									        	  week: '周',
									        	  day: '天'
									       	 	},
												allDayText: '全天',
												monthNames: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'],
												monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
												dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],
												dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'],
											
										})
					});
</script>


</head>
<body>
	<%@ include file="/WEB-INF/header/slidenav.jsp"%>
	<!-- loading圖 -->
	<!-- 	<div id="loader-wrapper"> -->
	<!-- 		<div id="loader"></div> -->
	<!-- 		<div class="loader-section section-left"></div> -->
	<!--         <div class="loader-section section-right"></div> -->
	<!-- 	</div> -->

	<div class="container-fluid">
		<div class="row">

		
			  <div class="col s10 offset-s2">
				<table class="table table-bordered">
					<tr>
						<td>
							<a class="waves-effect waves-light btn" id="authorize-button" onclick="handleAuthClick(event)"><i class="material-icons left">cloud</i>匯入GOOGLE CALENDAR</a>
								<!--Button for the user to click to initiate auth sequence -->
<!-- 								<button > -->
<!-- 									匯入GOOGLE CALENDAR</button> -->
							
						</td>
					</tr>
					<tr>
						<td>
							<div id='calendar'></div>
						</td>
					</tr>
				</table>
			</div>
		</div>

	</div>



</body>
</html>
