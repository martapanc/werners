<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<form id="crud-form" data-toggle="validator"> 
	<div class="form-group" >
		<label for="id">Item ID</label> 
		<input type="text" class="form-control" name="id" value="${itm.id}" placeholder="auto-assigned" readonly>
	</div>
	<div class="form-group">
		<label for="name">Name</label> 
		<input type="text" class="form-control" name="name" placeholder="Item name" value="${itm.name}" required>
	</div>
	<div class="form-group">
		<label for="foodClass">Food Class</label> 
		<select class="form-control" name="foodClass" required>
			<c:forEach items="${fc}" var="entry">
				<c:choose>
				<c:when test="${entry.name == itm.foodClass.name}">
    				<option selected>${entry.name}</option>
  				</c:when>
  				<c:otherwise>
    				<option>${entry.name}</option>
  				</c:otherwise>
  				</c:choose>
    		</c:forEach>
		</select>
	</div>
	<div class="form-group">
		<label for="price">Price</label> 
		<input type="text" class="form-control" name="price" placeholder="Insert Price" value="${itm.price}" pattern="0|(0.|[1-9]+[.])[0-9]+"  required>
	</div>
</form>
<script>
	
	// validation must be called here since the input
	// fields are created dynamically
	$( document ).ready(function() {
		
		// submit button (create/edit) of form modal
		$('#crud-form').validator().on('submit', function (e) {
			  if (e.isDefaultPrevented()) {
			    console.log("form is invalid");
			  } else {
				e.preventDefault();
				// if hidden data field is create then =>
				sendRequest('create');
			  }
		});
	});
</script>
</html>
