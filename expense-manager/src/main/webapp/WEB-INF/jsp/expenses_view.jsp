<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#start-date").datepicker();
		$("#start-date").datepicker("option", "dateFormat", 'yy/mm/dd');
	});
	$(function() {
		$("#end-date").datepicker();
		$("#end-date").datepicker("option", "dateFormat", 'yy/mm/dd');
	});
</script>
</head>
<body>
	<jsp:include page="../jsp/common/expense_header.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<spring:url value="/expense/view/filterByDate" var="formUrl" />
			<form:form modelAttribute="expense" action="${formUrl}" method="post"
				cssClass="col-md-8 col-md-offset-2">
				<div class="form-group">
					<label for="filter-by-date">Filter by Date</label> Start Date: <input
						type="text" name="startDate" id="start-date" class="date-picker"> End Date:
					<input type="text" name="endDate" id="end-date" class="date-picker"/>
					<button type="submit" class="btn btn-default">Submit</button>
				</div>
			</form:form>
		</div>
		<h3>Expenses at a glance</h3>
		<table class="table table-hover">
			<tbody>
				<tr>
					<th>Title</th>
					<th>Date</th>
					<th>Amount</th>
					<th>Category</th>
					<th>Payment Type</th>
					<th>Operations</th>
				</tr>
				<c:forEach items="${expenses}" var="expense">
					<tr>
						<td><a
							href="<spring:url 
							value="/expense/${expense.expenseId}"/>">${expense.title}</a></td>
						<td>${expense.date}</td>
						<td>${expense.amount}</td>
						<td>${expense.type.typeName}</td>
						<td>${expense.payee.payeeName}</td>
						<td><a
							href="<spring:url 
							value="/expense/edit=${expense.expenseId}"/>">update</a>
							<a
							href="<spring:url 
							value="/expense/delete=${expense.expenseId}"/>">delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>

</body>
</html>