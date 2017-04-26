$(document).ready(function() {
	$.ajax({
		url : "https://bitcoin.mubiz.com/blocks",
		dataType : "json",
		contentType : "application/json; charset=utf-8",
		type : "GET",
		timeout:"5000",
		async : false,

		success : function(data) {
			$('#bitcoin_block_number').append(data.blocks);
		},

		error : function(xhr, status, err) {
			$('#bitcoin_block_number').append(err+" N/A");
		}
	});
});

$(document).ready(function() {
	$.ajax({
		url : "https://bitcoin.mubiz.com/info",
		dataType : "json",
		contentType : "application/json; charset=utf-8",
		type : "GET",
		timeout: "5000",
		async : false,

		success : function(data) {
			$('#bitcoin_difficulty').append(data.difficulty);
		},

		error : function(xhr, status, err) {
			$('#bitcoin_difficulty').append(err+" N/A");
		}
	});
});


$(document).ready(function() {
	$.ajax({
		url : "https://bitcoin.mubiz.com/info",
		dataType : "json",
		contentType : "application/json; charset=utf-8",
		type : "GET",
		timeout: "5000",
		async : false,

		success : function(data) {
			$('#bitcoin_connection').append(data.connections);
		},

		error : function(xhr, status, err) {
			$('#bitcoin_connection').append(err+" N/A");
		}
	});
});


$(document).ready(function() {
	$.ajax({
		url : "https://bitcoin.mubiz.com/info",
		dataType : "json",
		contentType : "application/json; charset=utf-8",
		type : "GET",
		timeout: "5000",
		async : false,

		success : function(data) {
			$('#bitcoin_protocol').append(data.protocolversion);
		},

		error : function(xhr, status, err) {
			$('#bitcoin_protocol').append(err+" N/A");
		}
	});
});

