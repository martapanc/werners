/**
 * Initializes the webpage for CRUD operations. Add eventhandler to create, edit
 * and delete button
 * 
 */
function initCrud() {

	// create button
	$create.on('click', function() {
		var row = {}; //there is a bug with id 
		showModal($(this).text());
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

		$modal.find('input[name]').each(function() {
			row[$(this).attr('name')] = $(this).val();
		});

		$.ajax({
			url : API_URL, /*+ ($modal.data('id') || ''),*/
			type : 'post', // prefer always post
			contentType: 'application/json; charset=utf-8',
			cache: false,
			dataType: 'json',
			data : { action: "update", data : "werner"/*JSON.stringify(row)*/},
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
 * Shows the modal for CRUD operations.
 * 
 * @param {string}
 *            title The title text of the modal.
 * @param {number}
 *            row The row number for populating the fields.
 */
function showModal(title, row) {

	$modal.find('.modal-title').text(title);

	// if called as create Modal row is undefined so set name to "auto-assigned"#
	// else populate input fields with values from row data of table
	if (row == null) {
		$modal.find('input[name="id"]').attr("placeholder", "auto-assigned");
		row = {
			id : "0"
		}
	}
	else {
		for ( var name in row) {
			$modal.find('input[name="' + name + '"]').val(row[name]);
		}
	}
	$modal.data('id', row.id);
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


function getIdSelections() {
	return $.map($table.bootstrapTable('getSelections'), function(row) {
		return row.id
	});
}