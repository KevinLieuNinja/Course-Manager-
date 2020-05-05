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
<title><c:out value="${ course.name }"/></title>
</head>
<body>
	<div class="container">
		<h1><c:out value="${ course.name }"/></h1>
			
		<h3>
			Instructor:
			<c:out value="${ course.insturctor }"/>
			<br/>
			Capacity:
			<c:out value="${ course.capacity }"/>
		</h3>
		<div>
		<table>
			<thead>
				<th> Name</th>
				<th> Aciton</th>
			</thead>
			<tbody>
				<c:forEach items="${ course.user}" var="user" >
					<tr>
						<td><c:out value="${ user.name }"/></td>
						<td>
							<!-- Remove from course  -->
							<form action="/user/${ user.id }" method="POST">
								<input type="hidden" value="remove" name="_method"/>
								<input type="hidden" value="${course.id }" name="course"/>
								<button type="submit" class="btn btn-danger"> Remove</button>				
							</form>
						</td>
					</tr>
				</c:forEach>
			
			</tbody>
		</table>
			<form action="/course/${ course.id }" method="POST">
				<input type="hidden" value="delete" name="_method"/>
				<input type="hidden" value="${user.id }" name="user"/>
				<button type="submit" class="btn btn-danger"> DELETE</button>				
			</form>
		<a href="/course/${ course.id }/edit">Edits</a>
		</div>
		
	
	</div>
</body>
</html>