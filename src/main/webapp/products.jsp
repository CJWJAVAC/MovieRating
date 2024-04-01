<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<title>Welcome</title>
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
            <a class="nav-link" href="./logout.jsp">Logout</a>
        </li>
        <li class="nav-item">
        	<a class="nav-link" href="./editProduct.jsp?edit=update" >Edit Movie</a>
        </li>
        <li class="nav-item">
        	<a class="nav-link" href="./editProduct.jsp?edit=delete">Delete Movie</a>
        </li>
        </ul>
    </div>
    </div>
</nav>
	<div class="jumbotron" style="background-color:#00CED1">
		<div class="container"style="text-align:center">
			<span class="display-3" style="border:5px solid white; border-radius:10px; font-size:75px">
				영화 목록
			</span>
			</div>
	</div> 
	<%
		ProductRepository dao = ProductRepository.getInstance();
		ArrayList<Product> listOfProducts = dao.getAllProducts();
	%>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp" %>
			<% 
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select * from product";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
			%>
		<%--
		 for(int i=0; i<listOfProducts.size(); i++){
			Product product = listOfProducts.get(i); --%>
			<div class="col-md-4">
			<img src="./resources/images/<%=rs.getString("p_fileName") %>" style="width:100%; height:60%; border:10px solid white; box-shadow: 2px 5px 15px 5px black">
			<br><br>
				<h3><%=rs.getString("p_name") %></h3>
				<p><%= rs.getString("p_description") %>
				<p><%= rs.getString("p_unitPrice") %>명
				 <p style="font-size:25px; color:#FFD700"><% String str = rs.getString("p_condition");
						int a = Integer.parseInt(str);
						for(int k=0; k<a; k++){
							out.print("★");
						}
				%>
				<% int x = Integer.parseInt(rs.getString("p_condition"));
				if(x>=4){
				%>
				<p style="border:3px solid gray; font-weight:bold; border-radius:10px">
				<% 
						out.print("관객들의 평이 좋은 작품");
				%></p>
				<% } %>
				<% int y = Integer.parseInt(rs.getString("p_unitPrice"));
					if(y>=5000000){
				%>
				<p style="border:3px solid gray; font-weight:bold; border-radius:10px"><%
						out.print("이번 분기의 흥행작");
				%><%} %><% else if(y>=10000000){%>
					<%
						out.print("올해의 흥행작");
				%><% } %><% else if(y>=15000000){%>
					<%
						out.print("올타임급 흥행작");
					%><% } %>
				</p>
				<p><a href="./product.jsp?id=<%= rs.getString("p_id")%>"
				class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
			</div>
		 <%
		 }
		 if(rs!=null)
		 rs.close();
		 if(pstmt!=null)
		 pstmt.close();
		 if(conn!=null)
		 conn.close();
		 %>
		</div>		
		<hr>
	</div>
	<div><%@ include file="footer.jsp" %></div>
	
</body>
</html>