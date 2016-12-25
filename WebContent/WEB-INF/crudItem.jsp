<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>

<!-- Create modal -->
<div class="modal fade" tabindex="-1" role="dialog" id="create-modal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Create new Item</h4>
			</div>
			<div class="modal-body" id="create-modal-body">
				<form id="create-form" data-toggle="validator">
					<div class="form-group">
						<label for="id">Item ID</label> <input type="text" class="form-control" name="id"
							placeholder="auto-assigned" readonly>
					</div>
					<div class="form-group">
						<label for="name">Name</label> <input type="text"
							class="form-control" name="name" placeholder="Item name"
							value="${itm.name}" required>
					</div>
					<div class="form-group">
						<label for="foodClass">Food Class</label> <select
							class="form-control" name="foodClass" required>
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
						<label><input type="checkbox" value="true"
							name="available"
							<c:if test="${itm.available == true}">checked="checked"</c:if>>Available</label>
					</div>
					<input type="hidden" id="action" name="action"
						value="${formaction}"> <input type="hidden"
						name="version-number" value="${itm.versionNumber}">
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				<button type="submit" onclick="sendCRUDRequest('create')" form="create-form" class="btn btn-primary" id="modal-button">Create</button>
			</div>
		</div> <!-- /.modal-content -->
	</div> <!-- /.modal-dialog -->
</div> <!-- /.modal -->

<!-- Edit modal -->

<div class="modal fade" tabindex="-1" role="dialog" id="edit-modal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Edit Item</h4>
			</div>
			<div class="modal-body" id="edit-modal-body">
				<form id="edit-form" data-toggle="validator">
					<div class="form-group">
						<label for="id">Item ID</label> <input type="text" class="form-control" name="id" value="${itm.id}"
							placeholder="auto-assigned" readonly>
					</div>
					<div class="form-group">
						<label for="name">Name</label> <input type="text"
							class="form-control" name="name" placeholder="Item name"
							value="${itm.name}" required>
					</div>
					<div class="form-group">
						<label for="foodClass">Food Class</label> <select
							class="form-control" name="foodClass" required>
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
						<label><input type="checkbox" value="true"
							name="available"
							<c:if test="${itm.available == true}">checked="checked"</c:if>>Available</label>
					</div>
					<input type="hidden" id="action" name="action"
						value="${formaction}"> <input type="hidden"
						name="version-number" value="${itm.versionNumber}">
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				<button onclick="sendCRUDRequest('edit')" form="edit-form" class="btn btn-danger" id="modal-button">Edit</button>
			</div>
		</div> <!-- /.modal-content -->
	</div> <!-- /.modal-dialog -->
</div> <!-- /.modal -->

<!-- Delete Modal (confirm dialog) -->
  
<div class="modal fade" tabindex="-1" role="dialog" id="delete-modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Delete Item(s)</h4>
      </div>
      <div class="modal-body" id="delete-modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button onclick="sendCRUDRequest('delete')" form="crud-form" class="btn btn-danger" id="modal-button">Delete</button>
      </div>
    </div> <!-- /.modal-content -->
  </div> <!-- /.modal-dialog -->
 </div> <!-- /.modal -->

<script>
	
	// validation must be called here since the input
	// fields are created dynamically
	/*
	$( document ).ready(function() {
		
		// submit button (create/edit) of form modal
		$('#crud-form').validator().on('submit', function (e) {
			  if (e.isDefaultPrevented()) {
			    console.log("form validation has failed");
			  } else {
				e.preventDefault();
				sendCRUDRequest($('#action').val());
			  }
		});
	});*/
</script>
</html>
