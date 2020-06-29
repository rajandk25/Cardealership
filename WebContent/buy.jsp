<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.dealership.Transaction"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buy Car</title>
</head>
<style>
<%@ include file="styles/styles.css" %>
</style>
<body>

	<div class="container">
		<%@ include file="header.jsp" %> 
		
		<c:if test="${transaction == null }">
		<div class="jumbotron row col-12">
			<h3>Please provide the following information to complete the
				order.</h3>
		</div>
			<form action="BuyServlet" method="post">
				<div class="form-group col-md-6">
					<label for="inputUseName">First Name</label> <input type="text"
						class="form-control" id="firstName" name="firstName"
						placeholder="First Name">


				</div>
				<div class="form-group col-md-6">
					<label for="inputUseName">Last Name</label> <input type="text"
						class="form-control" id="lastName" name="lastName"
						placeholder="Last name">
				</div>
				<div class="form-group col-md-6">
					<label for="inputUseName">Credit Card Number</label> <input
						type="text" class="form-control" id="creditCard" name="creditCard"
						placeholder="Credit Card"> <br>


					<button type="submit" name="buyId"
						value="<%=request.getParameter("buyId")%>">Confirm Buy</button>
				</div>
			</form>
		</c:if>


		<div>
			<c:if test="${transaction != null }">
				<div class="card col-12 separator">
					<div class="card-header bg-light">Transaction Details</div>
					<div class="card-body">
						<div class="card-text">
							<div class="jumbotron">
								<h5>Congratulations on buying this car. Nice Choice !!</h5>
								<p><strong>Transaction Id:</strong>
								<c:out value="${transaction.transactionId}" /></p>
								<p>Please provide your information and visit below address
									to pick up your car!!</p>
								<p><strong> Pickup Address: </strong>123 Main street, St louis, MO 63301</p>
							</div>
							<a href="search.jsp" class="btn btn-primary">New Search</a>
						</div>
					</div>
				</div>

			</c:if>
		</div>
	</div>
</body>
</html>