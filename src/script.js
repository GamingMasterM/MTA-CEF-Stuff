
function updateHealth(value){
	if (value <= 100 && value >= 0){
		var balken = document.getElementById("leben");
		balken.setAttribute("style","width:"+value+"%; background-color:red");
		setTimeout(function(){
			balken.setAttribute("style","width:"+value+"%; background-color:rgb(200,0,0)");
		}, 100);
	}
}


function giveHealth(){
	console.log("changing health");
	mta.triggerEvent("onClientChangeHealth");
}