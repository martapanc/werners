<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<!-- create form -->

<form id="create-form" data-toggle="validator">
	<div class="form-group">
		<label for="id">Food Category ID</label> <input type="text"
			class="form-control" placeholder="auto-assigned" readonly>
	</div>
	<div class="form-group">
		<label for="name">Name</label> <input type="text" class="form-control" name="name" placeholder="Item name" value="${fc.name}" required>
	</div>
	<input type="hidden" id="action" name="action" value="create">
	<input type="hidden" name="id" value="0">
	<input type="hidden" name="version-number" value="${fc.versionNumber}">
</form>

<!-- Edit form -->

<form id="edit-form" data-toggle="validator">
	<div class="form-group">
		<label for="id">Food Category ID</label> <input type="text"
			class="form-control" name="id" value="${fc.id}"
			placeholder="auto-assigned" readonly>
	</div>
	<div class="form-group">
		<label for="name">Name</label> <input type="text" class="form-control"
			name="name" placeholder="Item name" value="${fc.name}" required>
	</div>
	<input type="hidden" id="action" name="action" value="edit">
	<input type="hidden" name="version-number" value="${fc.versionNumber}">
</form>
</html>
