<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<head>
<meta charset="UTF-8">
<title>Edit this Course</title>
</head>
<body>

	<div class="container">
		Editing your world

		<form:form action="/course/${ classObj.id }/edit" method="POST" modelAttribute="classObj">
		<input type="hidden" name="_method" value="PUT">
		<p>
			<form:errors path="classObj.*"></form:errors>
		</p>

		<p>
			<form:label path="name"></form:label>
			<form:errors path="name"></form:errors>
			<form:input path="name"></form:input>		
		</p>
		<p>
			<form:label path="insturctor"></form:label>
			<form:errors path="insturctor"></form:errors>
			<form:input path="insturctor"></form:input>		
		</p>
		<p>
			<form:label path="capacity"></form:label>
			<form:errors path="capacity"></form:errors>
			<form:input type="number" path="capacity"></form:input>		
		</p>
		<p>
			<button type="submit">Edit</button>
		</p>
		</form:form>
	</div>
</body>
</html>