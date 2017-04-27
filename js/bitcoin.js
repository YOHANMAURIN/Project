$(document).ready(function() {
	$.ajax({
		url : "https://api.blockchain.info/stats?cors=true",
		dataType : "json",
		type : "GET",
		timeout: "5000",
		async : true,

		success : function(data) {
			$('#bitcoin_difficulty').append(data.difficulty);
			$('#bitcoin_block_number').append(data.n_blocks_total);
			$('#bitcoin_prix_dollars').append(data.market_price_usd);
			$('#bitcoin_minute_entre_blocks').append(data.minutes_between_blocks);
		},

		error : function(xhr, status, err) {
			$('#bitcoin_difficulty').append(err+" N/A");
			$('#bitcoin_block_number').append(err+" N/A");
			$('#bitcoin_peix_dollars').append(err+" N/A");
			$('#bitcoin_minute_entre_blocks').append(err+" N/A");
		}
	});
});