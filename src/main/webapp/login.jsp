<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<title>Insert title here</title>
<style>
	.navi{
		display:block;
	}
	.items{
		display:flex;
		flex-direction:row;
		width:100%;
		margin:0;
		padding:0;
		background-color:rgb(0 0 0 / 70%);
		list-style-type:none;
	}
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
	.masthead-clearfix{
		text-align:center;
		margin-left:700px;
	}
	body{
		background-color:rgb(0 0 0 / 70%);
		margin:0;
	}
	.tex{
		margin-bottom:20px;
		font-weight:300;
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
        
        </ul>
    </div>
    </div>
</nav>

	<div class="jumbotron" style="background-color:rgb(0 0 0 / 70%)">
		<div class="container"style="text-align:center">
			<span class="display-3" style="border:5px solid white; border-radius:10px; font-size:75px; color:white">
				MM
			</span>
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading" style="color:white; font-family:inherit; font-weight:500">아이디와 비밀번호를 입력하시오</h3>
			<p class="tex" style="color:white">이 웹사이트는 영화의 별점과 관객수 등의 정보를 저장하며 예매도 가능한 웹사이트입니다.</p>
			<%
				String error = request.getParameter("error");
				if(error!=null){
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인하시오");
					out.println("</div>");
				}
			%>
			<form class="form-signin" action="j_security_check" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" class="form-control" placeholder="ID" name='j_username' required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="Password" name='j_password' required>
				</div>
				<button class="btn btn-lg btn-default" type="submit" style="background-color:white; font-weight:bold;">로그인</button>
			</form>
		</div> 
	</div>
	</div>
	</div>
</body>
</html>