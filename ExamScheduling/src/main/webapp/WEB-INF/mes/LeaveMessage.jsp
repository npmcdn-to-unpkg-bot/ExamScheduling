<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/cdn.file"%>
<%@ include file="/WEB-INF/header/header_resourse.file" %>
<link rel="stylesheet" type="text/css"
	href="/ExamScheduling/css/preload.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考試預約系統Reception</title>
</head>
<body>
<%@ include file="/WEB-INF/header/header.jsp" %>
<!-- loading圖 -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>
	</div>
<div style="margin: 100px 500px">
 <FORM METHOD="post" ACTION="/ExamScheduling/mes/mes.do" name="form1" >
<h1 class="center-align">請輸入留言</h1>
<table border="0" class="table">
	<tr>
		<td><h5>姓名:</h5></td>
		<td><input type="TEXT" name="msgname" size="40"  value="${sessionScope.ExamName}" readonly="readonly"/></td>
	</tr>
	<tr>
		<td><h5>e-mail:</h5></td>
		<td><input type="TEXT" name="msgmail" size="40" value="${sessionScope.ExamEmail}" readonly="readonly"/></td>
	</tr>
	<tr>
		<td><h5>留言:</h5></td>
		<td><textarea cols="40" rows="20" id="area1" name="msgcontent" class="materialize-textarea"></textarea></td>
	</tr>
</table>

<input type="hidden" name="action" value="leave">
<button class="light-blue darken-2 waves-light btn" type="submit" style="float: right;">
						送出<i class="material-icons right">mode_edit</i>
							</button>
</FORM>
</div>
 <div class="fixed-action-btn horizontal" style="bottom: 45px; right: 24px;">
    <a class="btn-floating btn-large red">
      <i class="large material-icons">contact_phone</i>
    </a>
    <ul>
      <li><a href='<%=request.getContextPath()%>/MesTurn?turn=LAM' class="btn-floating green tooltipped" data-position="top" data-delay="50" data-tooltip="留言板" ><i class="material-icons">comment</i></a></li>
      <li><a href='<%=request.getContextPath()%>/MesTurn?turn=MQTT' class="btn-floating blue darken-1 tooltipped" data-position="top" data-delay="50" data-tooltip="即時通訊"><i class="material-icons">question_answer</i></a></li>
    </ul>
  </div>
<c:if test="${status=='NG'}">
<script>alert("你在這裡當駭客，你媽知道嗎!")</script>
</c:if>
<%@ include file="/WEB-INF/header/footer.jsp" %> 
</body>
<script type="text/javascript">
$(document).ready(function(){
    $('.tooltipped').tooltip({delay: 50});
    $('body').addClass('loaded');
  });
$('form').submit(function() {	
	$('body').removeClass('loaded');
	return true; // return false to cancel form action
});
</script>
</html>

