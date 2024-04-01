<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date" %>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Insert title here</title>
<style>
.nav-item{
		padding:15px;
		cursor:pointer;
		
	}
	.nav-item a{
		text-align:center;
		text-decoration:none;
		color:white;
	}
	.nav-item:nth-child(1){
		background-color:gray;
	}
	.nav-item:hover{
		text-decoration:underline;
	}
	button,
button::after {
  -webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
  -o-transition: all 0.3s;
	transition: all 0.3s;
}

button {
  background: none;
  border: 3px solid #fff;
  border-radius: 5px;
  color: #fff;
  display: block;
  font-size: 1.6em;
  font-weight: bold;
  margin: 1em auto;
  padding: 2em 6em;
  position: relative;
  text-transform: uppercase;
}

button::before,
button::after {
  background: #fff;
  content: '';
  position: absolute;
  z-index: -1;
}

button:hover {
  color: #2ecc71;
}
.btn-3::after {
  height: 0;
  left: 50%;
  top: 50%;
  width: 0;
}

.btn-3:hover:after {
  height: 100%;
  left: 0;
  top: 0;
  width: 100%;
}
body {
  background: #2ecc71;
  font-size: 62.5%;
}
​
</style>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
    <a class="navbar-brand" href="#"><img src="./resources/pictures/Logo.png" style="width:10%; height:10%"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    </div>
</nav>
	<%!String greeting = "웹 쇼핑몰에 오신 것을 환영합니다.";
	String tagline = "Welcome to Web Market!";%>
	
	<div class="jumbotron" style="background-color:#00CED1">
		<div class="container"style="text-align:center">
			<span class="display-3" style="border:5px solid white; border-radius:10px; font-size:75px">
				MM
			</span>
		</div>
	</div>
	<div class="row">
	<button class="btn-3" onclick="location.href='./addProduct.jsp'">영화 추가</button>
	<button class="btn-3"onclick="location.href='./products.jsp'">마이 페이지</button>
	<button class="btn-3"onclick="location.href='./logout.jsp'">로그아웃</button>
	</div>
	<div class="container">
		<div class="text-center">
			<h3>
				<%=tagline %>
			</h3>
			<%
				response.setIntHeader("Refresh",3);
				Date day=new java.util.Date();
				String am_pm;
				int hour = day.getHours();
				int minute = day.getMinutes();
				int second = day.getSeconds();
				if(hour/12==0){
					am_pm = "AM";
				}else{
					am_pm = "PM";
					hour = hour-12;
				}
				String CT = hour+":"+minute+":"+second+" "+am_pm;
				out.println("현재 접속 시각: "+CT+"\n");
			%>
			<hr>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>