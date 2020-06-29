<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.dealership.Car"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Car Dealership</title>
<link rel="stylesheet" type="text/css" href="styles/styles.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
</head>
<style>
<%@ include file="styles/styles.css" %>
</style>
<body>

	<form action="UserServlet" method="post">
		<div class="container">
			<%@ include file="header.jsp"%>
			
			<div class="card col-12 separator">
					<div class="card-header bg-light">Login</div>
					<div class="card-body">
						<div class="card-text">
							<div class="jumbotron">
								<h5>Please provide login information below.</h5>
							</div>
							<div class="separator">
				<div class="form-group col-6">
					<label for="inputUseName">User Name</label> <input type="text"
						class="form-control" id="userName" name="userName"
						placeholder="User Name">


				</div>
				<div class="form-group col-6">
					<label for="inputPassword4">Password</label> <input type="password"
						class="form-control" id="inputPassword" name="password">
				</div>

				<div class="form-group col-12">
					<button type="submit">Login</button>
				</div>
			</div>
							
						</div>
					</div>
				</div>
		</div>
	</form>




</body>
</html>