/**
 * Initializes the webpage for CRUD operations. Add eventhandlers 
 * to create, edit and delete button of bootstrap table
 * 
 */
function initCRUD() {
	
	var modalUniqueClass = ".modal";
	
	// add create handler to its button
	$create.on('click', createRequest);
	
	// edit button (window is needed because of async table creation)
	window.actionEvents = {
		'click .edit' : function(e, value, row) {
			/*
			$.ajax({
				url : API_URL,
				type : 'post',
				data: {action: 'find', id: row.id},
				success : function() {
						console.log("Succesfully made a find request of id : " + row.id);
						$('#crud').load(API_URL, {action: 'refresh'}, function (responseText, textStatus, req) {
							//error handling missing
							$('#edit-form').validator('update');
							$('#edit-modal').modal();
						});
				},
				error : function() {
					alert('Error while sending a find request!', 'danger'); 
				}
			});*/
		}
	};
			
	// checkboxes in table (to enable delete button)
	$table.on('check.bs.table uncheck.bs.table '
			+ 'check-all.bs.table uncheck-all.bs.table', function() {
		$delete.prop('disabled', !$table.bootstrapTable('getSelections').length);
		// save your data, here just save the current page
		selections = getIdSelections();
		// push or splice the selections if you want to save all data selections
	});

	
	// delete button
	$delete.on('click', function() {
		$('#delete-modal').modal();
		$delModalBody.html("<p>Are you sure to delete the entries with the following id's?<br>"+ getIdSelections() +"<p>");
		//sendCRUDRequest('delete', getIdSelections());
		var message = "Are you sure to delete this item(s)?";
	});
}


function createRequest() {
	
	$('#create-modal').modal();
	/*
	$.ajax({
		url : API_URL,
		type : 'post',
		data: {action: 'find', id: 0},
		success : function() {
				console.log("Succesfully made a find request of id: 0");
				$('#crud').load(API_URL, {action: 'refresh'}, function (responseText, textStatus, req) {
					// error handling missing
					$('#create-form').validator('update');
					//$('#create-modal').modal();
				});
		},
		error : function() {
			alert('Error while sending a find request!', 'danger'); 
		}
	});*/
	
	//$create.on('click', createRequest);
}


/**
 * Sends an AJAX call based on the action parameter in order
 * to add/update the database 
 * 
 * @param {String} 
 * 				action String that defines the CRUD action
 */
function sendCRUDRequest(action) {
	
	$.ajax({
		url : API_URL,
		type : 'post',
		data: $('.form').serialize(),
		success : function() {
			$table.bootstrapTable('refresh');
		},
		error : function() {
			alert('Error while sending update/save/delete request!', 'danger');
		}
	});
	$modal.modal('hide');
}