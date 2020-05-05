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
<title>Login and Registration</title>
</head>
<body>

	<div class="container">
		<div>
			<h1>Register</h1>
			<form:form action="/register" method="POST" modelAttribute="userObj">
				<p>
					Name:
					<form:input type="text" path="name"/>
					<form:errors path="name"/>
				
				</p>
				<p>
					Email:
					<form:input type="email" path="email"/>
					<form:errors path="email"/>
				
				</p>
				<p>
					Password:
					<form:input type="password" path="password"/>
					<form:errors path="password"/>
					
				</p>
				<p>
					Confirm PW:
					<form:input type="password"  path="passwordConfirmation"/>
					<form:errors path="passwordConfirmation"/>
				</p>
				<button type="submit" class="btn btn-success">Register</button>
			</form:form>
		</div>
		<br/>
		<div>
			<h1>Log In</h1>
			<form action="/login" method="post">
				 <p>
				 	Email
				 	<input type="text" name="email"/>
				 </p>
				 <p>
				 	Password
				 	<input type="text" name="password"/>
				 </p>
				 <button type="submit" class="btn btn-success">Login</button>
			</form>
			<c:out value="${error}"/>
		</div>
	</div>
</body>
</html>