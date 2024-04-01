<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<title>Insert title here</title>
</head>
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
        	<a class="nav-link" href="./editProduct.jsp?edit=delete">Delete Movie</a>
        </li>
        </ul>
    </div>
    </div>
</nav>
	<div class="jumbotron" style="background-color:#00CED1">
		<div class="container" style="text-align:center">
			<span class="display-3" style="border:5px solid white; border-radius:10px; font-size:75px">
				영화 수정
			</span>
		</div>
	</div>
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
			<div class="col-sm-5">
				<img src="./resources/images/<%=rs.getString("p_fileName") %>" alt="image" style="width:100%; height:80%; border:10px solid white; box-shadow: 2px 5px 15px 5px black"/>
			</div>
			<div class="col-sm-7">
				<form name="newProduct" action="./processUpdateProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2">영화 코드</label>
						<div class="com-sm-3">
							<input type="text" id="productId" name="productId" class="form-control" value='<%=rs.getString("p_id")%>'>
						</div>	
					</div>
					<div class="form-group row">
						<label class="col-sm-2">영화명</label>
						<div class="col-sm-3">
							<input type="text" id="name" name="name" class="form-control" value="<%=rs.getString("p_name")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">관객</label>
						<div class="col-sm-3">
							<input type="text" id="unitPrice" name="unitPrice" class="form-control" value="<%=rs.getInt("p_unitPrice") %>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">시놉시스</label>
						<div class="col-sm-5">
							<textarea name="description" cols="50" rows="2" class="form-control"><%=rs.getString("p_description") %></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">감독</label>
						<div class="col-sm-3">
							<input type="text" name="manufacturer" class="form-control" value="<%=rs.getString("p_manufacturer") %>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">장르</label>
						<div class="col-sm-3">
							<input type="text" name="category" class="form-control" value="<%=rs.getString("p_category") %>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">평점</label>
						<div class="col-sm-9">
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
					<label class="col-sm-2">포스터</label>
					<div class="col-sm-5">
						<input type="file" name="productImage" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-primary" value="등록">
					</div>
				</div>
				</form>
 			</div>
		</div>
	</div>
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