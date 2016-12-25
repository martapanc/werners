/**
 * Initializes the webpage for CRUD operations. Add eventhandlers 
 * to create, edit and delete button of bootstrap table
 * 
 */
function initCRUD() {
	
	// add create handler to its button
	$create.on('click', function(){
	    $('#create-modal-body').load(API_URL + " #create-form", {action: 'find', id: 0}, function (responseText, textStatus, req) {
	    	if(textStatus == 'error') {
	    		alert('Server error while sending a find request!', 'danger'); 
	    	} else {
	    		console.log("Successfully loaded create-form");
	    		$('#create-form').validator().on('submit', function(e) {
	    			if (e.isDefaultPrevented()) {
	    			    console.log("Edit form validation has failed");
	    			  } else {
	    				e.preventDefault();
						sendCRUDRequest($(this).serialize());
	    			  }
	    		});
			    	$('#create-modal').modal();
					$('#create-form').validator('update');
	    	}
		});
	});
	
	// edit button (window.action events is needed because of async table creation)
	window.actionEvents = {
		'click .edit' : function(e, value, row) {
		    $('#edit-modal-body').load(API_URL + " #edit-form", {action: 'find', id: row.id}, function (responseText, textStatus, req) {
		    	if(textStatus == 'error') {
		    		alert('Server error while sending a find request!', 'danger'); 
		    	} else {
		    		console.log("Successfully loaded edit-form");
		    		$('#edit-form').validator().on('submit', function(e) {
		    			if (e.isDefaultPrevented()) {
		    			    console.log("Edit form validation has failed");
		    			  } else {
		    				e.preventDefault();
							sendCRUDRequest($(this).serialize());
		    			  }
		    		});
			    	$('#edit-modal').modal();
					$('#edit-form').validator('update');
	            }
			});
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
	});
}

/**
 * Sends an AJAX call based on the action parameter (which can be 
 * either create, edit or delete), in order to interact with the
 * database. After the call (no matter if succesful) all open modals 
 * (in theory only one is open) are closed.
 * 
 * @param {String} 
 * 				action String that defines the CRUD action
 */
function sendCRUDRequest(formdata) {
	
	
	$.ajax({
		url : API_URL,
		type : 'post',
		data: formdata,
		success : function() {
			$table.bootstrapTable('refresh');
		},
		error : function() {
			alert('Server error while sending a create/edit/delete request!', 'danger');
		}
	});
	
	$('.modal').modal('hide');
}