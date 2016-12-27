<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<!-- create form -->

<form id="create-form" data-toggle="validator">
	<div class="form-group">
		<label for="id">Room Table ID</label> <input type="text"
			class="form-control" placeholder="auto-assigned" readonly>
	</div>
	<div class="form-group">
		<label for="name">Name</label> <input type="text" class="form-control" name="name" placeholder="Table name" value="${rt.name}" required>
	</div>
	<div class="form-group">
		<label for="seats">Seats</label> <input type="number" class="form-control" name="seats" placeholder="Insert number of seats" value="${rt.seats}" min="1" max="12" step="1" required>
	</div>
	<div class="form-group">
		<label for="room">Room</label> <input type="text" class="form-control" name="room" placeholder="Insert room name" value="${rt.room}">
	</div>
	<div class="form-group">
		<label for="category">Category</label> <select class="form-control" name="category" required>
			<c:forEach items="${categories}" var="entry">
				<c:choose>
					<c:when test="${entry == rt.category}">
						<option value="${entry}" selected>${entry}</option>
					</c:when>
					<c:otherwise>
						<option value="${entry}">${entry}</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</select>
	</div>
	<input type="hidden" id="action" name="action" value="create">
	<input type="hidden" name="id" value="0">
	<input type="hidden" name="version-number" value="${rt.versionNumber}">
</form>

<!-- Edit form -->

<form id="edit-form" data-toggle="validator">
	<div class="form-group">
		<label for="id">Room Table ID</label> <input type="text"
			class="form-control" name="id" value="${rt.id}"
			placeholder="auto-assigned" readonly>
	</div>
	<div class="form-group">
		<label for="name">Name</label> <input type="text" class="form-control" name="name" placeholder="Table name" value="${rt.name}" required>
	</div>
	<div class="form-group">
		<label for="seats">Seats</label> <input type="number" class="form-control" name="seats" placeholder="Insert number of seats" value="${rt.seats}" min="1" max="12" step="1" required>
	</div>
	<div class="form-group">
		<label for="room">Room</label> <input type="text" class="form-control" name="room" placeholder="Insert room name" value="${rt.room}">
	</div>
	<div class="form-group">
		<label for="category">Category</label> <select class="form-control" name="category" required>
			<c:forEach items="${categories}" var="entry">
				<c:choose>
					<c:when test="${entry == rt.category}">
						<option value="${entry}" selected>${entry}</option>
					</c:when>
					<c:otherwise>
						<option value="${entry}">${entry}</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</select>
	</div>
	<input type="hidden" id="action" name="action" value="edit">
	<input type="hidden" name="version-number" value="${rt.versionNumber}">
</form>
</html>
