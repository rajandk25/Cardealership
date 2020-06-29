<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.dealership.Car"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bidding</title>
</head>
<style>
<%@ include file="styles/styles.css" %>
</style>
<body>

	<div class="container">
		<%@ include file="header.jsp" %>

		<!-- if bid result == false, show bid button and input -->
		<c:if test="${bidResult == null || bidResult == false}">
			<div class="jumbotron">
				<h3>Enter your Bid</h3>
				<form class="form-inline" action="BidServlet" method="get">
					<div class="form-group col-6">
						<input
							type="text" class="form-control" id="bid" name="bidPrice">

						<button type="submit" class="btn btn-primary mb-6" name="buyId"
							value="<%=request.getParameter("buyId")%>">Bid</button>
					</div>
				</form>
				
			<c:if test="${bidResult == false }">
				Please increase you bid price.
			</c:if>
			</div>
		</c:if>


		<!-- else if bid result is true, then show congratulations and buy button -->
		<c:if test="${bidResult}">
			<div class="card col-12 separator">
				<div class="card-header bg-light">Bid information</div>
				<div class="card-body">
					<div class="card-text">
						<div class="jumbotron">
							Congratulations!! Your bid has been accepted.

							<a href="buy.jsp?buyId=<%=request.getParameter("buyId")%>" class="btn btn-primary">Buy</a>
						</div>
					</div>
				</div>
			</div>
		</c:if>

	</div>

</body>
</html>