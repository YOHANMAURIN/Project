function getTextInput(){
	var input = document.getElementById('Hashcode');
	console.log(input.value)
	rechercheHashInfor(input.value)
}


function rechercheHashInfor(blockid){
	$.ajax({
		url : "https://blockchain.info/fr/block-index/"+blockid+"?format=json&cors=true",
		dataType : "json",
	
		type : "GET",
		timeout: "5000",
		async : true,
	
		success : function(data) {
				$("#jjson").jJsonViewer(JSON.stringify(data));
			
		},

		error : function(xhr, status, err) {
			console.log("erreur donnée");
           
		}
	});
}