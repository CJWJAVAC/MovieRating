<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<div class="container" style="text-align:center">
			<span class="display-3" style="border:5px solid white; border-radius:10px; font-size:75px">
				<fmt:message key="title_info"/>
			</span>
		</div>
	</div>
	<div class="container">
		<form action="./processShippingInfo.jsp" class="form-horizontal" method="post">
			<input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>"/>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="name"/></label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="shippingdate"/></label>
				<div class="col-sm-3">
					<input name="shippingDate" type="text" class="form-control"/>(yyyy/mm/dd)
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="country"/></label>
				<div class="col-sm-3">
					<input name="country" type="text" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="zipcode"/></label>
				<div class="col-sm-3">
					<input name="zipCode" type="text" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<a href="./cart.jsp?cartId=<%=request.getParameter("cartId") %>" class="btn btn-secondary" role="button">이전</a>
					<input type="submit" class="btn btn-primary" value="등록" onclick="checkShippingInfo()"/>
					<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
				</div>
			</div>
		</form>
	</div>
	</fmt:bundle>
</body>
</html>