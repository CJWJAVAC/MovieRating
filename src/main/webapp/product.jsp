<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%@ page errorPage="exceptionNoProductId.jsp" %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<title>Insert title here</title>
<script type="text/javascript">
	function addToCart(){
		if(confirm("영화를 예매하시겠습니까?")){
			document.addForm.submit();
		}else{
			document.addForm.reset();
		}
	}
</script>
<style>
p{
	color:white;
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
<body style="background-color:rgb(0 0 0 / 70%)">
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
            <a class="nav-link" href="./products">My Movie</a>
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
				영화 정보
			</span>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
		ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(id);
	%>
	<%@ include file="dbconn.jsp" %>
	<%
		String productId = request.getParameter("id");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select*from product where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,productId);
		rs = pstmt.executeQuery();
		if(rs.next()){
	%>
	<div class="container">
		<div class="row">
		<div class="col-md-5">
			<img src="./resources/images/<%= rs.getString("p_filename") %>" style="width:100%; height:80%; border:10px solid white; box-shadow: 2px 5px 15px 5px black"/>
		</div>
			<div class="col-md-6" >
			<div style="background-color:#E2E2E2; border-radius:10px; width:500px; padding:5px">
				<h3><%= rs.getString("p_id") %></h3>
				<p style="color:black"><%= rs.getString("p_description") %></p></div>
				<p><b>영화코드 : </b><span class="badge badge-danger">
					<%= rs.getString("p_id") %></span></p>
				<p><b>감독</b> : <%= rs.getString("p_manufacturer") %></p>
				<p><b>장르</b> : <%= rs.getString("p_category") %></p>
				<h4 style="color:white"><%=rs.getString("p_unitPrice") %>명</h4>
				<p><b>별점</b> : <% int a = Integer.parseInt(rs.getString("p_condition"));
					for(int j=0; j<a; j++){
						out.print("★");
					}
				%>
				<p><form name="addForm" action="./addCart.jsp?id=<%=rs.getString("p_id") %>" method="post">
				<a href="#" class="btn btn-info" onclick="addToCart()">영화예매 &raquo;</a>
				<a href="./cart.jsp" class="btn btn-warning">티켓모음&raquo;</a>
					<a href="./products.jsp" class="btn btn-secondary">영화목록 &raquo;</a></form>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>
	<% } 
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	%>
</body>
</html>