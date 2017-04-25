$(document).ready(function() {
	$.ajax({
		url : "https://bitcoin.mubiz.com/blocks",
		dataType : "json",
		contentType : "application/json; charset=utf-8",
		type : "GET",
		timeout:	"5000",
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
		url : "https://blockchain.info/fr/ticker?cors=true",
		dataType : "json",
		contentType : "application/json; charset=utf-8",
		type : "GET",
		timeout: "5000",
		async : false,

		success : function(data) {
			$('#bitcoin_network_hash').append(data.EUR["15m"]+' '+data.EUR.symbol);
		},

		error : function(xhr, status, err) {
			$('#bitcoin_network_hash').append(err+" N/A");
		}
	});
});

$(document).ready(function() {
	$.ajax({
		url : "https://api.blockchain.info/stats?cors=true",
		dataType : "json",
		contentType : "application/json; charset=utf-8",
		type : "GET",
		timeout:"5000",
		async : false,

		success : function(data) {
			$('#bitcoin_blocks').append(data.minutes_between_blocks);
			$('#bitcoin_usd_price').append(data.difficulty);
		},

		error : function(xhr, status, err) {
			$('#bitcoin_blocks').append(err+" N/A");
			$('#bitcoin_usd_price').append(err+" N/A");
		}
	});
});

