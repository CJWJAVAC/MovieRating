<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
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
</style>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
    <a class="navbar-brand" href="#"><img src="./resources/pictures/Logo.png" style="width:10%; height:10%"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
        <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="./welcome.jsp">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="./addProduct.jsp">Add</a>
        </li>
        <li class="nav-item">
        	<a class="nav-link" href="./products.jsp">My Movie</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="./logout.jsp">Logout</a>
        </li>
        </ul>
    </div>
    </div>
    </nav>
	<div class="jumbotron" style="background-color:#00CED1">
		<div class="container"style="text-align:center">
			<span class="display-3" style="border:5px solid white; border-radius:10px; font-size:75px">
				예매 취소
			</span>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">예매가 취소되었습니다</h2>
	</div>
	<div class="container">
		<p><a href="./products.jsp" class="btn btn-secondary">&laquo; 영화목록</a>
	</div>
</body>
</html>