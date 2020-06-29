<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.dealership.Person"%>
<%@page import="com.dealership.Car"%>
<%@page import="com.dealership.Transaction"%>
<%@page import="com.dealership.Report"%>
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
		<div class="jumbotron row col-12 separator">
			<h1>
				Hello,
				<%
				out.print(person.getUserName());
			%>
			</h1>
		</div>
		
		<div class="float-right">
			<form action="ReportServlet" method="post" class="form-inline float-right">
				<h5><button class="btn btn-outline-success float-right" type="submit">Print Report</button></h5>
			</form>
			</div>

		

		<c:if test="${reportData != null}">
				<div class="card col-12 separator">
					<div class="card-header bg-info">Transaction Report</div>
					<div class="card-body">
						<form action="SearchServlet" method="get" class="form-inline">
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th scope="col">Name</th>
									<th scope="col">Model</th>
									<th scope="col">Transaction Id</th>
									<th scope="col">Buyer Id</th>
									<th scope="col">Date</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="report" items="${reportData}">
									<tr>
										<td><c:out value="${report.car.manufactureName}" /></td>
										<td><c:out value="${report.car.model}" /></td>
										<td><c:out value="${report.txn.transactionId}" /></td>
										<td><c:out value="${report.txn.userId}" /></td>
										<td><c:out value="${report.txn.date}" /></td>
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