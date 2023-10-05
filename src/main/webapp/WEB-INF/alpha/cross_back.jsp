<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cross.jsp</title>
<style type="text/css">
body{
	background-image: url('/media/alpha.png'), url('/media/small.png')
}

table{
	border-collapse: collapse;
	font-family: monospace;
	font-size: 150%;
	
	border: 10px outset red;
}

#surface td{
	opacity: 0.9;
}

</style>
<script type="text/javascript">

function sleep(milis){
	return new Promise(function(resolve, reject) {
		setTimeout(resolve, milis);
	});
}

window.onload = () => {
	
	createBtn.onclick = async function() {
 		for (let i=0; i<10; i++){
			console.log(i);
			await sleep(1000);
		} 
	}
}
</script>
</head>
<body>
<h1>cross</h1>
<hr>
<button id="createBtn">Create</button> 
<hr>
<table id="surface" onmousedown="event.preventDefault();" oncontextmenu="event.preventDefault();">
	<tbody>
	<c:forEach var="i" begin="0" end="${surface.size()-1 }">
		<tr>
		<c:forEach var="alpha" items="${surface[i] }">
			<td style="color: black; background: black;">${alpha.ch }</td>
		</c:forEach>
		</tr>
	</c:forEach>	
	</tbody>
</table>
</body>
</html>