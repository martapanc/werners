/**
 * Initializes the webpage for CRUD operations. Add eventhandlers 
 * to create, edit and delete button of bootstrap table
 * 
 */
function initCRUD() {

	// create button
	$create.on('click', function() {
		$modalBody.load(API_URL, {action: 'get', data: 0}, function (responseText, textStatus, req) {
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
		  	$modalBody.load(API_URL, {action: 'get', data: row.id}, function (responseText, textStatus, req) {
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
		var ids = getIdSelections();
		var message = "Are you sure to delete this item(s)?";
		alert("must be implemented");
		eModal.confirm(message, null)
		      .then(callback, callbackCancel);
	});
}

function sendRequest(action) {
	
	var postData = {
		action: action,
		data: JSON.stringify($('#myform').data)
	};
	
	$.ajax({
		url : API_URL,
		type : 'post',
		data: postData,
		success : function() {
			$modal.hide();
			$table.bootstrapTable('refresh');
		},
		error : function() {
			alert('Error while sending update/save request!', 'danger');
			$modal.modal('hide');
		}
	});
	
}
/**
 * Shows the modal for CRUD operations.
 * 
 * @param {string}
 *            title The title text of the modal.
 * @param {number}
 *            row The row number for populating the fields.
 */
function showModal(title, row) {

	$modal.find('.modal-title').text(title);

	// if called as create Modal row is undefined so set name to "auto-assigned"
	// and id to 0 = create. Otherwise populate input fields with values 
	// from row object of table
	if (row == null) {
		$modal.find('input[name="id"]').attr("placeholder", "auto-assigned");
		$modal.find('input').val("");
		row = {
			id : 0
		}
	}
	else {
		for ( var name in row) {
			$modal.find('input[name="' + name + '"]').val(row[name]);
		}
	}
	$modal.data('id', row.id);
	$modal.data('foodClass', row.foodClass);
	$modal.data('versionNumber', row.versionNumber);
	$modal.modal('show');
}