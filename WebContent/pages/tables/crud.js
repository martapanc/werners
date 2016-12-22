/**
 * Initializes the webpage for CRUD operations. Add eventhandlers 
 * to create, edit and delete button of bootstrap table
 * 
 */
function initCRUD() {

	// create button
	$create.on('click', function() {
		$modalBody.load(API_URL, {action: 'get', id: 0}, function (responseText, textStatus, req) {
		        if (textStatus == "error") {
		          alert('Server error while requesting a create action');
		        } 
		        else {
	  			  $modalTitle.text(createText[0]);
	  			  $modalButton.text(createText[1]);
		    	  $modal.modal(); 
		    	}
		});
	});
	
	// edit button (window is needed because of async table creation)
	window.actionEvents = {
		'click .edit' : function(e, value, row) {
		  	$modalBody.load(API_URL, {action: 'get', id: row.id}, function (responseText, textStatus, req) {
		        if (textStatus == "error") {
			          alert('Server error while requesting an edit action');
			        } 
			        else {
			        	$modalTitle.text(editText[0]);
					    $modalButton.text(editText[1]);
				  		$modal.modal();
			        }
			});
		}
	};
			
	// checkboxes in table (enable delete button)
	$table.on('check.bs.table uncheck.bs.table '
			+ 'check-all.bs.table uncheck-all.bs.table', function() {
		$delete.prop('disabled', !$table.bootstrapTable('getSelections').length);
		// save your data, here just save the current page
		selections = getIdSelections();
		// push or splice the selections if you want to save all data selections
	});

	
	// delete button
	$delete.on('click', function() {
		$('#del-modal').modal();
		var ids = getIdSelections();
		var message = "Are you sure to delete this item(s)?";
		alert("must be implemented");
	});
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
		data: $('#crud-form').serialize(),
		success : function() {
			$table.bootstrapTable('refresh');
		},
		error : function() {
			alert('Error while sending update/save/delete request!', 'danger');
		}
	});
	$modal.modal('hide');
}