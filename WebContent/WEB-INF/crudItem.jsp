<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<!-- create form -->

<form id="create-form" data-toggle="validator">
	<div class="form-group">
		<label for="id">Item ID</label> <input type="text"
			class="form-control" placeholder="auto-assigned" readonly>
	</div>
	<div class="form-group">
		<label for="name">Name</label> <input type="text" class="form-control" name="name" placeholder="Item name" value="${itm.name}" required>
	</div>
	<div class="form-group">
		<label for="foodClass">Food Class</label> <select class="form-control" name="foodClass" required>
			<c:forEach items="${fc}" var="entry">
				<c:choose>
					<c:when test="${entry.name == itm.foodClass.name}">
						<option value="${entry.id}" selected>${entry.name}</option>
					</c:when>
					<c:otherwise>
						<option value="${entry.id}">${entry.name}</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</select>
	</div>
	<div class="form-group">
		<label for="price">Price</label> <input type="number" class="form-control" name="price" placeholder="Insert Price" value="${itm.price}" min="0" max="99.9" step="0.01" required>
	</div>
	<div class="checkbox form-group">
		<label><input type="checkbox" value="true" name="available"
			<c:if test="${itm.available == true}">checked="checked"</c:if>>Available</label>
	</div>
	<input type="hidden" id="action" name="action" value="create">
	<input type="hidden" name="id" value="0">
	<input type="hidden" name="version-number" value="${itm.versionNumber}">
</form>

<!-- Edit form -->

<form id="edit-form" data-toggle="validator">
	<div class="form-group">
		<label for="id">Item ID</label> <input type="text"
			class="form-control" name="id" value="${itm.id}"
			placeholder="auto-assigned" readonly>
	</div>
	<div class="form-group">
		<label for="name">Name</label> <input type="text" class="form-control"
			name="name" placeholder="Item name" value="${itm.name}" required>
	</div>
	<div class="form-group">
		<label for="foodClass">Food Class</label> <select class="form-control"
			name="foodClass" required>
			<c:forEach items="${fc}" var="entry">
				<c:choose>
					<c:when test="${entry.name == itm.foodClass.name}">
						<option value="${entry.id}" selected>${entry.name}</option>
					</c:when>
					<c:otherwise>
						<option value="${entry.id}">${entry.name}</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</select>
	</div>
	<div class="form-group">
		<label for="price">Price</label> <input type="number"
			class="form-control" name="price" placeholder="Insert Price"
			value="${itm.price}" min="0" max="99.9" step="0.01" required>
	</div>
	<div class="checkbox form-group">
		<label><input type="checkbox" value="true" name="available"
			<c:if test="${itm.available == true}">checked="checked"</c:if>>Available</label>
	</div>
	<input type="hidden" id="action" name="action" value="edit">
	<input type="hidden" name="version-number" value="${itm.versionNumber}">
</form>

<!-- Delete Form (confirm dialog) -->

<div class="modal fade" tabindex="-1" role="dialog" id="delete-modal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Delete Item(s)</h4>
			</div>
			<div class="modal-body" id="delete-modal-body">
			<form>
				<input type="hidden" id="action" name="action" value="delete">
			</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				<button form="crud-form" class="btn btn-danger" id="modal-button">Delete</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
</html>
