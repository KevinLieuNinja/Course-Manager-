<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
<title>Dashboard</title>
</head>
<body>

	<div class="container">
		<h1>Hello <c:out value="${user.name}"/></h1>
		<table class="table">
			<thead>
				<tr>
					<th>Course</th>
					<th>Instructor</th>
					<th>Remove</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${allCourse}" var="course">
					<tr>
						<td> 
							<a href="/course/${course.id}"><c:out value="${course.name }"/> </a> 
						</td>
						<td> <c:out value="${course.insturctor }"/> </td>
						<td>
							<form action="/course/${ course.id }" method="POST">
								<input type="hidden" name="user" value="${user.id }">
								<input type="submit" value="Add">
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="/courses/new"> Add a Course </a>
		
	</div>
</body>
</html>