<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.dealership.Person"%>
<%
	Person person = (Person) session.getAttribute("person");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search for Cars</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous" />
	<link rel="stylesheet" type="text/css" href="styles/styles.css" />
</head>
<style>
<%@ include file="styles/styles.css" %>
</style>

<body>

	<div class="container">
	
	<%@ include file="header.jsp" %> 
		<div class="jumbotron row col-12">
			<h1>
				Hello,
				<%
				out.print(person.getUserName());
			%>
			</h1>
		</div>

		<c:if test="${cars != null}">
				<div class="card col-12 separator">
				<div class="card-header bg-light">
					Results

					<form action="InventoryServlet" method="post"
						class="form-inline float-right">
							<button class="btn btn-outline-success">Add Car</button>
					</form>
				</div>
				<div class="card-body">
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th scope="col">Name</th>
									<th scope="col">Model</th>
									<th scope="col">Price</th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach var="car" items="${cars}">
								<c:if test="${car.available == 'Y' }">
									<tr>
										<td><c:out value="${car.manufactureName}" /></td>
										<td><c:out value="${car.model}" /></td>
										<td><c:out value="${car.price}" /></td>
										
									</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>

					</div>
				</div>
		</c:if>
	</div>
</body>
</html>