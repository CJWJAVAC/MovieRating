<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder" %>
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
	<%
		String shipping_cartId="";
		String shipping_name="";
		String shipping_shippingDate="";
		String shipping_country="";
		String shipping_zipCode="";
		String shipping_addressName="";
		
		Cookie[] cookies = request.getCookies();
		
		if(cookies!=null){
			for(int i=0; i<cookies.length; i++){
				Cookie thisCookie = cookies[i];
				String n = thisCookie.getName();
				if(n.equals("Shipping_zipCode"))
					shipping_zipCode=URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if(n.equals("Shipping_shippingDate"))
					shipping_shippingDate=URLDecoder.decode((thisCookie.getValue()),"utf-8");
			}
		}
	%>
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
            <a class="nav-link" href="./logout.jsp">Logout</a>
        </li>
        </ul>
    </div>
    </div>
    </nav>
	<div class="jumbotron" style="background-color:#00CED1">
		<div class="container" style="text-align:center">
			<span class="display-3" style="border:5px solid white; border-radius:10px; font-size:75px">
				예매 완료
			</span>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">예매해주셔서 감사합니다</h2>
		<p>영화는 <%out.println(shipping_shippingDate); %>에 상영할 예정입니다
		<p>좌석번호 <%out.println(shipping_zipCode); %>
	</div>
	<div class="container">
		<p><a href="./products.jsp" class="btn btn-secondary">&laquo;상품목록</a>
	</div>
</body>
</html>
<% 
	session.invalidate();

	for(int i=0; i<cookies.length; i++){
		Cookie thisCookie = cookies[i];
		String n =thisCookie.getName();
		if(n.equals("Shipping_cartId"))
			thisCookie.setMaxAge(0);
		if(n.equals("Shipping_name"))
			thisCookie.setMaxAge(0);
		if(n.equals("Shipping_shippingDate"))
			thisCookie.setMaxAge(0);
		if(n.equals("Shipping_country"))
			thisCookie.setMaxAge(0);
		if(n.equals("Shipping_zipCode"))
			thisCookie.setMaxAge(0);
		if(n.equals("Shipping_addressName"))
			thisCookie.setMaxAge(0);
		
		response.addCookie(thisCookie);
	}
%>