<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLDecoder" %>

<% 
	request.setCharacterEncoding("UTF-8");
	
	String cartId = session.getId();
	
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
			if(n.equals("Shipping_cartId"))
				shipping_cartId=URLDecoder.decode((thisCookie.getValue()),"utf-8");
			if(n.equals("Shipping_name"))
				shipping_name=URLDecoder.decode((thisCookie.getValue()),"utf-8");
			if(n.equals("Shipping_shippingDate"))
				shipping_shippingDate=URLDecoder.decode((thisCookie.getValue()),"utf-8");
			if(n.equals("Shipping_country"))
				shipping_country=URLDecoder.decode((thisCookie.getValue()),"utf-8");
			if(n.equals("Shipping_zipCode"))
				shipping_zipCode=URLDecoder.decode((thisCookie.getValue()),"utf-8");
			if(n.equals("Shipping_addressName"))
				shipping_addressName=URLDecoder.decode((thisCookie.getValue()),"utf-8");
		}
	}
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<title>예매 정보</title>
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
		<div class="container" style="text-align:center">
			<span class="display-3" style="border:5px solid white; border-radius:10px; font-size:75px">
				예매 정보
			</span>
		</div>
	</div>
	<div class="container col-8 alert alert-info">
		<div class="text-center">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
			<strong>배송 주소</strong><br>성명 : <%out.println(shipping_name); %><br>
			좌석번호 : <%out.println(shipping_zipCode); %><br>
			주소 : <%out.println(shipping_country); %><br>
		</div>
		<div class="col-4" align="right">
			<p><em>배송일 : <%out.println(shipping_shippingDate); %></em>
		</div>
	</div>
	<div>
		<table class="table table-hover">
			<tr>
			<th class="text-center">도서</th>
			<th class="text-center">관람인수</th>
			<th class="text-center">장르</th>
			<th class="text-center">소계</th>
			</tr>
			<%
				int sum = 0;
				ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
				if(cartList==null)
					cartList=new ArrayList<Product>();
				for(int i=0; i<cartList.size(); i++){
					Product product = cartList.get(i);
					int total = 15000*product.getQuantity();
					sum=sum+total;
			%>
			<tr>
			<td class="text-center"><em><%=product.getPname() %></em></td>
			<td class="text-center"><%=product.getQuantity() %></td>
			<td class="text-center"><%=product.getCategory()%></td>
			<td class="text-center"><%=total %>원</td>
			</tr>
			<% } %>
			<tr>
				<td></td>
				<td></td>
				<td class="text-right"><strong>총액:</strong></td>
				<td class="text-center text-danger"><strong><%=sum %></strong></td>
			</tr>
		</table>
		<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId %>" class="btn btn-secondary" role="button">이전</a>
		<a href="./thankCustomer.jsp" class="btn btn-success" role="button">주문 완료</a>
		<a href="./thankCustomer.jsp" class="btn btn-secondary" role="button">취소</a>
	</div>
	</div>
</body>
</html>