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
	<div class="form-group">
		<label for="image">Image</label>
		<select name="image" class="form-control">
			<option value="dist/img/flat-icon-gastronomy/apple-1.svg" selected>Apple</option>
			<option value="dist/img/flat-icon-gastronomy/pint.svg" >Bier</option>
			<option value="dist/img/flat-icon-gastronomy/cake.svg">Cake</option>
			<option value="dist/img/flat-icon-gastronomy/coffee-3.svg" >Coffee</option>
			<option value="dist/img/flat-icon-gastronomy/cookies.svg">Cookies</option>
			<option value="dist/img/flat-icon-gastronomy/doughnut-1.svg" >Doughnut</option>
			<option value="dist/img/flat-icon-gastronomy/eggs.svg" >Eggs</option>
			<option value="dist/img/flat-icon-gastronomy/fish.svg" >Fish</option>
			<option value="dist/img/flat-icon-gastronomy/fries.svg" >Fries</option>
			<option value="dist/img/flat-icon-gastronomy/glass-1.svg" >Glass of Wine</option>
  			<option value="dist/img/flat-icon-gastronomy/hot-dog-1.svg" >Hot Dog</option>
  			<option value="dist/img/flat-icon-gastronomy/ice-cream-14.svg" >Ice Cream</option>
  			<option value="dist/img/flat-icon-gastronomy/kebab.svg" >Kebab</option>
  			<option value="dist/img/flat-icon-gastronomy/meat.svg" >Meat</option>
  			<option value="dist/img/flat-icon-gastronomy/pancakes-1.svg">Pancakes</option>
  			<option value="dist/img/flat-icon-gastronomy/pasta.svg" >Pasta</option>
  			<option value="dist/img/flat-icon-gastronomy/sushi-1.svg" >Sushi</option>
  			<option value="dist/img/flat-icon-gastronomy/taco.svg" >Taco</option>
 			<option value="dist/img/flat-icon-gastronomy/tea-1.svg">Tea</option>		
		</select>
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
		<label for="name">Name</label> <input type="text" class="form-control" name="name" placeholder="Item name" value="${fc.name}" required>
	</div>
	<div class="form-group">
		<label for="image">Image</label>
		<select name="image" class="form-control">
			<option value="${fc.image}" selected>${fc.image}</option>
			<option value="dist/img/flat-icon-gastronomy/apple-1.svg">Apple</option>
			<option value="dist/img/flat-icon-gastronomy/pint.svg" >Bier</option>
			<option value="dist/img/flat-icon-gastronomy/cake.svg">Cake</option>
			<option value="dist/img/flat-icon-gastronomy/coffee-3.svg" >Coffee</option>
			<option value="dist/img/flat-icon-gastronomy/cookies.svg">Cookies</option>
			<option value="dist/img/flat-icon-gastronomy/doughnut-1.svg" >Doughnut</option>
			<option value="dist/img/flat-icon-gastronomy/eggs.svg" >Eggs</option>
			<option value="dist/img/flat-icon-gastronomy/fish.svg" >Fish</option>
			<option value="dist/img/flat-icon-gastronomy/fries.svg" >Fries</option>
			<option value="dist/img/flat-icon-gastronomy/glass-1.svg" >Glass of Wine</option>
  			<option value="dist/img/flat-icon-gastronomy/hot-dog-1.svg" >Hot Dog</option>
  			<option value="dist/img/flat-icon-gastronomy/ice-cream-14.svg" >Ice Cream</option>
  			<option value="dist/img/flat-icon-gastronomy/kebab.svg" >Kebab</option>
  			<option value="dist/img/flat-icon-gastronomy/meat.svg" >Meat</option>
  			<option value="dist/img/flat-icon-gastronomy/pancakes-1.svg">Pancakes</option>
  			<option value="dist/img/flat-icon-gastronomy/pasta.svg" >Pasta</option>
  			<option value="dist/img/flat-icon-gastronomy/sushi-1.svg" >Sushi</option>
  			<option value="dist/img/flat-icon-gastronomy/taco.svg" >Taco</option>
 			<option value="dist/img/flat-icon-gastronomy/tea-1.svg">Tea</option>		
		</select>
	</div>
	<input type="hidden" id="action" name="action" value="edit">
	<input type="hidden" name="version-number" value="${fc.versionNumber}">
</form>


</html>
