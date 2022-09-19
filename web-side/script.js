var playerPerms = ''

$(document).ready(function(){
	window.addEventListener("message", function(event){
		switch (event.data.action) {
			case 'open':
				$('producao').slideToggle('slow');
				playerPerms = event.data
				OpenNUI(event.data)
			break;
		}
		document.onkeyup = function(data){
			if(data.which == 27) {
				$('producao').slideToggle('slow');
				$.post("https://puzzle_onservice/close")
			}
		}
	})
})


function OpenNUI(data){
	$('#fabricacao').empty()
	$('#fabricacao').append(`
	<div class="subtittle">${data.currentGroupTitle}</div>
		<div class="flex1 f-col">
			<div class="marginRadius marginItemTittle d-flex f-col">
				<div class="marginRadius bg3 btnMontar flex1" data-group="${data.currentGroup}" data-type="${data.type}" onclick="InService(this)">ENTRAR</div>
				<div class="marginRadius bg3 btnMontar flex1" data-group="${data.currentGroup}" data-type="${data.type}" onclick="OutService(this)">SAIR</div>
			</div>
		</div>
	`)
}

function InService(action){
	$('producao').slideToggle('slow');
	$.post("https://puzzle_onservice/close")
	$.post("https://puzzle_onservice/InService",JSON.stringify({ group : action.dataset.group, type : action.dataset.type }))
}

function OutService(action){
	$('producao').slideToggle('slow');
	$.post("https://puzzle_onservice/close")
	$.post("https://puzzle_onservice/OutService",JSON.stringify({ group : action.dataset.group, type : action.dataset.type }))
}

// function CriarItem(action){
// 	$('producao').slideToggle('slow');
// 	let amount = Number($('#amount').val());
// 	$.post("https://puzzle_onservice/close")
// 	$.post("https://puzzle_onservice/CraftItem",JSON.stringify({config : action.dataset.config, type : action.dataset.type, amount}))
// }

// function OpenNUI(event){
// 	$('#fabricacao').empty()
// 	event.forEach((value,key) => {
// 		value.forEach((value,key) => {
// 			$('#fabricacao').append(`

// 			<div class="flex1 f-col">
// 				<div class="marginRadius marginItemTittle d-flex f-col">
// 					<div data-type="arma" class="marginRadius bg3 btnMontar flex1" onclick="InService(this)">ENTRAR</div>
// 					<div data-type="arma" class="marginRadius bg3 btnMontar flex1" onclick="OutService(this)">SAIR</div>
// 				</div>
// 			</div>
// 			`)
// 			value.ingrediente.forEach((value) => {
// 				$(`#${key}`).append(`<span>${value.qtd}x ${value.index}</span><br>`)
// 				$(`#image-${key}`).append(`<div class="imgmateriais radius mr img-fit flex1 center"><img class="" src="img/${value.item}.png" alt=""></div>`)
// 			})
// 		})
// 	})
// }

{/* <div class="itens d-flex marginRadius w100 bg1">
<div class="marginRadius marginItemFigure d-flex align-center bg2">
	<img class="itemproduction" src="img/${value.index}.png" alt="">
</div>
<div class="flex1 f-col">
	<div class="marginRadius marginItemTittle d-flex f-row bg2">
		<div class="marginRadius w100 d-flex align-center flex3 textItem">${value.name}</div>
		<input id="amount" type="number" min="1" max="250" class="marginRadius maxlength="7" value="1" placeholder="1" style="width: 2.5rem">
		<div data-type="arma" data-config="${value.item}" onclick="CriarItem(this)" class="marginRadius bg3 btnMontar flex1">MONTAR</div>
	</div>
	<div class="marginRadius d-flex bg2 flex1">
		<div class="marginRadius d-flex flex1" id="image-${key}">
		</div>
		<div class="flex1 itens-necessarios radius" id="${key}">
		</div>
	</div>
</div>
</div> */}

// function CriarItem(action){
// 	$('producao').slideToggle('slow');
// 	let amount = Number($('#amount').val());
// 	$.post("https://puzzle_onservice/close")
// 	$.post("https://puzzle_onservice/CraftItem",JSON.stringify({config : action.dataset.config, type : action.dataset.type, amount}))
// }