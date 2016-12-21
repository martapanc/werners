/**
 * Initializes the webpage for CRUD operations. Add eventhandlers 
 * to create, edit and delete button of bootstrap table
 * 
 */
function initCrud() {

	// create button
	$create.on('click', function() {
		showModal($(this).text(), null);
	});

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
		if (confirm('Are you sure to delete this item?')) {
			$.ajax({
				url : API_URL + ids,
				type : 'delete',
				success : function() {
					$table.bootstrapTable('refresh');
					alert('Delete item successful!', 'success');
					$delete.prop('disabled', true);
				},
				error : function() {
					alert('Delete item error!', 'danger');
				}
			});
		}
		;
	});

	// submit button of modal
	$submit.on('click', function() {
		var row = {};
		$modal.find('input[name], select[name]').each(function() {
			row[$(this).attr('name')] = $(this).val();
		});
		
		row.versionNumber = Number($modal.data('versionNumber'));
		row.id = Number($modal.data('id'));
		var postdata = {
				action: row.id == 0 ? "create" : "update",
				data: JSON.stringify(row)
		};
		
		$.ajax({
			url : API_URL, /*+ ($modal.data('id') || ''),*/
			type : 'post', 
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8', //what we send
			/*dataType: 'html',*/ //what we expect
			cache: false,
			data : postdata,
			processData: true,
			success : function() {
				$modal.modal('hide');
				$table.bootstrapTable('refresh');
				/*
				showAlert(($modal.data('id') ? 'Update' : 'Create')
						+ ' item successful!', 'success');*/
			},
			error : function() {
				$modal.modal('hide');
				/*showAlert(($modal.data('id') ? 'Update' : 'Create')
						+ ' item error!', 'danger');*/
			}
		});
	});

	// edit button
	$edit.on('click', function(e, value, row) {
		showModal($(this).attr('title'), row);
	});

	// edit button (window is needed because of async table creation)
	window.actionEvents = {
		'click .edit' : function(e, value, row) {
			showModal($(this).attr('title'), row);
		}
	};
}

/**
 * RE
 * @returns
 */
/*
function replacer() {
	if (typeof value === "string") {
	    return undefined;
	  }
	  return value;
}*/

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


/**
 * Formats the action column of the table by adding a pencil icon to every row.
 * 
 * @param {number}
 *            value The row number.
 */
function actionFormatter(value) {
	return [
			'<a class="edit" href="javascript:" title="Edit Item"><i class="fa fa-pencil"></i></a>', ]
			.join('');
}

/**
 * Formats the action column of the table by adding a pencil icon to every row.
 * 
 * @param {number}
 *            value The row number.
 */
function getIdSelections() {
	return $.map($table.bootstrapTable('getSelections'), function(row) {
		return row.id
	});
}