<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>상품 등록</title>
<style>
fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
fieldset legend{
    text-align: right;
}
#rating input[type=radio]{
    display: none;
}
#rating label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#rating label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#rating label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#rating input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
.button1 {
  border: 0;
  outline: none;
  width: 100px;
  height: 100px;
  border-radius: 100px;
  font-size: 30px;
  margin: 30px;
  box-shadow: 3px 3px 3px rgb(109, 109, 109), -3px -3px 3px rgb(237, 237, 237);
  transition: 0.3s;
}

.button1:hover {
  box-shadow: -3px -3px 3px rgb(172, 172, 172), 3px 3px 3px rgb(237, 237, 237);
  transition: 0.3s;
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
</style>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
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
            <a class="nav-link" href="./products.jsp">My Movie</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="logout.jsp">Logout</a>
        </li>
        </ul>
    </div>
    </div>
</nav>
	<div class="jumbotron" style="background-color:#00CED1">
		<div class="container" style="text-align:center">
			<span class="display-3" style="border:5px solid white; border-radius:10px; font-size:75px"><fmt:message key="title"/></span>
		</div>
	</div>
	<div class="container">
		<div class="text-right">
			<a href="?language=ko">Korean</a>|<a href="?language=en">English</a>
		</div>
		<form name="newProduct" action="./processAddProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productId"/></label>
				<div class="col-sm-3">
					<input type="text" id="productId" name="productId" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="pname"/></label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitPrice"/></label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="description"/></label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2" class="form-control">
					</textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="manufacturer"/></label>
				<div class="col-sm-3">
					<input type="text" name="manufacturer" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="category"/></label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="condition"/></label>
				<div class="col-sm-5">
					<fieldset id="rating">
		<span class="text-bold">별점을 선택해주세요</span>
		<input type="radio" name="condition" value="5" id="rate1"><label
			for="rate1">★</label>
		<input type="radio" name="condition" value="4" id="rate2"><label
			for="rate2">★</label>
		<input type="radio" name="condition" value="3" id="rate3"><label
			for="rate3">★</label>
		<input type="radio" name="condition" value="2" id="rate4"><label
			for="rate4">★</label>
		<input type="radio" name="condition" value="1" id="rate5"><label
			for="rate5">★</label>
	</fieldset>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productImage"/></label>
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="button1" value="<fmt:message key="button"/>" onclick="CheckAddProduct()">				
					</div>
			</div>
		</form>
	</div>
	</fmt:bundle>
</body>
</html>