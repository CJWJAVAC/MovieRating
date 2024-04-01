<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<title>Insert title here</title>
<script type="text/javascript">
	function deleteConfirm(id){
		if(confirm("해당 영화를 삭제합니다!!")==true)
			location.href="./deleteProduct.jsp?id="+id;
		else
			return;
	}
</script>
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
	String edit = request.getParameter("edit");
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
        <li class="nav-item">
        	<a class="nav-link" href="./editProduct.jsp?edit=delete">Delete Movie</a>
        </li>
        </ul>
    </div>
    </div>
</nav>
	<div class="jumbotron" style="background-color:#00CED1">
		<div class="container" style="text-align:center">
			<span class="display-3" style="border:5px solid white; border-radius:10px; font-size:75px">
				영화 편집
			</span>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select*from product";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
			%>
			<div class="col-md-4">
				<img src="./resources/images/<%=rs.getString("p_fileName") %>" style="width:100%; height:70%; border:10px solid white; box-shadow: 2px 5px 15px 5px black">
				<br><br>
				<h3><%= rs.getString("p_name") %></h3>
				<p><%= rs.getString("p_description") %>
				<p><%= rs.getString("p_unitPrice") %>명
				<p><%
					if(edit.equals("update")){
						%>
					<a href="./updateProduct.jsp?id=<%= rs.getString("p_id") %>" class="btn btn-success" role="button">수정&raquo;</a>
					<%
					} else if(edit.equals("delete")){
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("p_id") %>')" class="btn btn-danger" role="button">삭제&raquo;</a>
				<% 
					}
				%>
			</div>
			<% }
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
	<jsp:include page="footer.jsp"/>
</body>
</html>