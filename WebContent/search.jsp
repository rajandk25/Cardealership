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

		<form action="SearchServlet" method="post" class="form-inline">
			<div class="row col-12">
				<label class="col-4">Find your Car here !!</label> <select
					id="inputCars" name="selectedModel" class="form-control col-6">
					<option selected>Choose...</option>
					<option>...</option>

					<option value="Q5">Audi Q5</option>
					<option value="Q3">Audi Q3</option>
					<option value="Q7">Audi Q7</option>
					<option value="A4">Audi A4</option>
					<option value="A3">Audi A3</option>
					<option value="A8">Audi A8</option>
					

				</select>

				<button class="btn btn-outline-success col-2" type="submit">Search</button>
			</div>
		</form>

		<c:if test="${searchResults != null}">
				<div class="card col-12 separator">
					<div class="card-header bg-info">Results</div>
					<div class="card-body">
						<form action="SearchServlet" method="get" class="form-inline">
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th scope="col">Name</th>
									<th scope="col">Model</th>
									<th scope="col">Price</th>
									<th scope="col">Details</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="car" items="${searchResults}">
									<tr>
										<td><c:out value="${car.manufactureName}" /></td>
										<td><c:out value="${car.model}" /></td>
										<td><c:out value="${car.price}" /></td>
										<td><button name="carId" value="${car.id}">Details</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						</form>

					</div>
				</div>
		</c:if>
	</div>
</body>
</html>