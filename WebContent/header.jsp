<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.dealership.Person"%>

<!DOCTYPE html>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="styles/styles.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<style>
<%@ include file="styles/styles.css" %>
</style>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#"><img
			src="https://logodix.com/logo/1150186.jpg" class="logo" /></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
			<c:if test="${person != null }">
				<a class="nav-item nav-link active" href="/CarDealership/search.jsp">Search<span
					class="sr-only">(current)</span></a>
			 <a	class="nav-item nav-link" href="/CarDealership/report.jsp">Reports</a>
					<a
					class="nav-item nav-link" href="/CarDealership/inventory.jsp">Inventory</a>
				</c:if>
			</div>
		</div>
	</nav>
		