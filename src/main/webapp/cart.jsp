<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<% String cartId = session.getId(); %>
<title>Insert title here</title>
<style>
@import url("https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap");
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
	button {
    margin: 20px;
}
.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-outline {
    position: relative;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-indigo {
    background-color: aliceblue;
    color: #1e6b7b;
}

.w-btn-indigo-outline {
    border: 3px solid aliceblue;
    color: #1e6b7b;
}

.w-btn-indigo-outline:hover {
    color: #1e6b7b;
    background: aliceblue;
}
.w-btn:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}

.w-btn-outline:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}

.w-btn:active {
    transform: scale(1.5);
}

.w-btn-outline:active {
    transform: scale(1.5);
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
			<span class="display-3"style="border:5px solid white; border-radius:10px; font-size:75px">예매하기</span>
		</div>
	</div>
	<div class="container" style="border:1px solid black; border-radius:10px; padding:30px; box-shadow:5px 5px 30px #000808">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId %>" class="btn btn-danger">삭제하기</a></td>
					<td align="right"><a href="./shippingInfo.jsp?cartId=<%=cartId %>" class="btn btn-success">예매하기</a></td>
					</tr>			
					</table>
		</div>
		<div style="padding-top:50px">
			<table class="table table-hover">
				<tr>
					<th>영화</th>
					<th>장르</th>
					<th>관람인수</th>
					<th>합계</th>
					<th>비고</th>
				</tr>
				<%
					int sum=0;
					ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
					if(cartList == null)
						cartList = new ArrayList<Product>();
					for(int i=0; i<cartList.size(); i++){
						Product product = cartList.get(i);
						int total = 15000*product.getQuantity();
						sum=sum+total;
				%>
				<tr>
					<td><%=product.getProductId() %>-<%= product.getPname() %></td>
					<td><%=product.getCategory() %></td>
					<td><%=product.getQuantity() %></td>
					<td><%=total %></td>
					<td><a href="./removeCart.jsp?id=<%=product.getProductId() %>" class="badge badge-danger">삭제</a></td>
					</tr>
					<% } %>
					<tr>
						<th></th>
						<th></th>
						<th>총액</th>
						<th><%=sum %></th>
						<th></th>
						</tr>
			</table>
		<button class="w-btn w-btn-indigo" onclick="location.href='./products.jsp'">
        예매 계속하기
    	</button>
		</div>
		
	</div>
	<br>
	<div ><jsp:include page="footer.jsp"/></div>
	
</body>
</html>