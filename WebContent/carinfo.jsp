<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.dealership.Person"%>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Car Detail</title>
</head>
<style>
<%@ include file="styles/styles.css" %>
</style>
<body>

	<div class="container">
	
	<%@ include file="header.jsp" %> 
		<div class="card col-12 separator">
			<div class="card-header bg-primary">Car Details</div>
			<!-- <img class="card-img-top separator" src="https://www.cars.com/cldstatic/ads/creative/20200316_4876_Nissan_Hero_2400x753.jpg" alt="Card image cap"> -->
			<!-- https://images.autotrader.com/borderscaler/800/600/2d363e/hn/c/c6e62b11e6834cfdafc2ed058844ff51.jpg -->

			<c:if test="${carDetail != null}">
				<img class="card-img-top separator carImage"
					src="${pageContext.request.contextPath }/${carDetail.image}" alt="Card image cap" />

			<div class="card-body">

					<!-- Description card -->
					<div class="card col-12 separator">
						<div class="card-header bg-light">Description</div>
						<div class="card-body">
							<div class="card-text">
								<c:out value="${carDetail.description}" />
							</div>
						</div>
					</div>

					<!-- Details card like miles, id etc. -->
					<div class="card col-12 separator">
						<div class="card-header bg-info">Details</div>
						<div class="card-body">
							<table class="table table-striped table-bordered">
								<tbody>
									<tr>
										<th scope="col">Name</th>
										<td><c:out value="${carDetail.manufactureName}" /></td>
									</tr>
									<tr>
										<th scope="col">Model</th>
										<td><c:out value="${carDetail.model}" /></td>
									</tr>
									<tr>
										<th scope="col">Price</th>
										<td><c:out value="${carDetail.price}" /></td>
									</tr>
									<tr>
										<th scope="col">Year</th>
										<td><c:out value="${carDetail.yearBuild}" /></td>
									</tr>
									<tr>
										<th scope="col">Mileage</th>
										<td><c:out value="${carDetail.milesRan}" /></td>
									</tr>
									<tr>
										<th scope="col">Days On Lot</th>
										<td><c:out value="${carDetail.numberOfDaysOnLot}" /></td>
									</tr>
								</tbody>
							</table>

						</div>
					</div>



				</div>
				<!-- main card body end -->
			</c:if>
			<c:if test="${carDetail == null}">
				<div class="card col-12 separator">
					<div class="card-header bg-light">Car Details</div>
					<div class="card-body">
						<div class="card-text">No Car details founds. Please try again.</div>
					</div>
				</div>
			</c:if>

			<div class="card-footer bg-transparent">
				<a href="search.jsp" class="btn btn-primary">Search Again</a>
				<c:if test="${carDetail.biddable}">
					<a href="bid.jsp?buyId=${carDetail.id}" class="btn btn-primary">Bid</a>
				</c:if>
				<a href="buy.jsp?buyId=${carDetail.id}" class="btn btn-primary">Buy</a>
			</div>
		</div>
		<!-- main card end -->
	</div>
	<!-- container end -->
</body>
</html>