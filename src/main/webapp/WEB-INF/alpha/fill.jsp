<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fill.jsp</title>
<style type="text/css">
#surface{
	border-collapse: collapse;
	font-family: monospace;
	font-size: 2em;
	border-left: 20px dotted red;
	background: url('/media/alpha.png');
	background-repeat: no-repeat;
}

#surface td{
	opacity: 0.5;
}

</style>
<script type="text/javascript">
function startBtn_click(e){
	console.log("a");
	start.disabled = true;
	clear.disabled = true;
	
	let stid = setInterval(function() {
		seconds.innerText = ++ seconds.innerText;
	}, 1000)
	
	let tid = setInterval(function(){	
		
		forCount.innerText = ++forCount.innerText;
		
		if(count.innerText == 800){
			clearInterval(tid);
			clearInterval(stid);
			start.disabled = false;
			clear.disabled = false;
			return;
		}
		
		let xhr = new XMLHttpRequest();
		xhr.open('GET','/alpha2/data')
		xhr.responseType = 'json';
		xhr.onload = e =>{
			let alpha = xhr.response;
			console.log(alpha);
			
			let td = surface.rows[alpha.line-1].cells[alpha.column-1];
			
			if(td.style.color=='black' && td.style.background =='black'){
				count.innerText = ++count.innerText;
			}
			
			td.style.color = alpha.fg;
			td.style.background = alpha.bg;
			td.innerText = alpha.ch;
			
		}
		xhr.send();
	}, 10);
	
}

function clearBtn_click(e){
	console.log("a");
/* 	for(let i=0;i<surface.rows.length;i++){
		for(let j=0;j<surface.rows[i].cells.length; j++){
			surface.rows[i].cells[j].style.color = 'black';
			surface.rows[i].cells[j].style.background = 'black';
		}
	} 
	*/
/* 	
	for(let row of surface.row){
		for (let td of row.cells){
			td.style.color = 'black';
			td.style.background = 'black';
		}
	} */
	 
	 Array.from(surface.rows).forEach(function(row) {
		 Array.from(row.cells).forEach(function(td) {
				td.style.color = 'black';
				td.style.background = 'black';
		 })
	 })
	 
	 forCount.innerText = 0;
	 count.innerText = 0;
	 seconds.innerText = 0;
}
</script>
</head>
<body>
<h1>Spring mvc + xmlhttprequest</h1>
<hr>
<button id="start" onclick="startBtn_click(event)">start</button>
<button id="clear" onclick="clearBtn_click(event)">clear</button>
<hr>
<table border="1" width="500">
	<thead>
	<tr>
		<th>forcount</th><th>count</th><th>seconds</th>
	</tr>
	</thead>
	<tbody>
		<tr>
			<td align="right" id="forCount">0</td>
			<td align="right" id="count">0</td>
			<td align="right" id="seconds">0</td>
		</tr>
	</tbody>
</table>
<hr>
<table id="surface" onmousedown="event.preventDefault();" oncontextmenu="event.preventDefault();">
	<tbody>
	<c:forEach var="row" items="${surface}">
		<tr>
		<c:forEach var="alpha" items="${row}">
			<td style="background: ${alpha.bg}; color:${alpha.fg};">${alpha.ch}</td>
		</c:forEach>
		</tr>
	</c:forEach>
	</tbody>
</table>
<hr>
<table id="surface2" onmousedown="event.preventDefault();">
	<tbody>
	<c:forEach var="i" begin="0" end="19">
		<tr>
		<c:forEach var="j" begin="0" end="39">
			<c:set var= "alpha" value="${surface[i][j]}"/>
			<td>${alpha.ch}</td>
		</c:forEach>
		</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>