<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE>
<html>
<head>

<script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">

<!--materialize ICON-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!--sweatAlert-->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/sweetalert2/3.2.3/sweetalert2.min.css" />
<!--JQUERY-->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<!--materialize-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>

<!--sweetalert js  -->
<script src="https://cdn.jsdelivr.net/sweetalert2/3.2.3/sweetalert2.min.js"></script>

<!-- JQUERY表單驗證 -->
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/jquery.validate.min.js"></script>
<title>Edit頁面</title>
</head>
<body>


<h2>公司簡介 - 編輯頁面</h2>
<hr>
<br>
<FORM METHOD="post" ACTION="/ExamScheduling/aboutedit"  >
<textarea class="ckeditor" cols="80" id="content" name=content rows="12">${about}</textarea>
<input type=submit value="Submit" >
<input type="hidden" name="action" value="Editor_Update"> 
<input type=button value="Cancel">

</FORM>
</html>
