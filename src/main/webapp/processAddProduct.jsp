<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%@ page import = "java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
 
<title>Insert title here</title>
</head>
<body>

<% 
	request.setCharacterEncoding("UTF-8");

	String filename="";
	String realFolder="C:\\jsp-work\\MovieRate\\src\\main\\webapp\\resources\\images";
	int maxSize = 5*1024*1024;
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	

	String productId=multi.getParameter("productId");
	String name=multi.getParameter("name");
	String unitPrice=multi.getParameter("unitPrice");
	String description=multi.getParameter("description");
	String manufacturer=multi.getParameter("manufacturer");
	String category=multi.getParameter("category");
	String condition=multi.getParameter("condition");
	String unitsInStock=multi.getParameter("unitsInStock");
	/*out.println(productId);
	out.println(name);
	out.println(unitPrice);
	out.println(description);
	out.println(manufacturer);
	out.println(category);
	out.println(unitsInStock);
	out.println(condition);*/
	Integer price;
	
	if(unitPrice.isEmpty())
		price=0;
	else
		price=Integer.valueOf(unitPrice);

	
	
	Enumeration files = multi.getFileNames();
	String fname = (String)files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	PreparedStatement pstmt = null;
	String sql = "insert into product values(?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,productId);
	pstmt.setString(2,name);
	pstmt.setInt(3,price);
	pstmt.setString(4,description);
	pstmt.setString(5,category);
	pstmt.setString(6,manufacturer);
	pstmt.setString(7,condition);
	pstmt.setString(8,fileName);
	pstmt.executeUpdate();
	if(pstmt!=null)
		pstmt.close();
	if(conn!=null)
		conn.close();
	
	/*ProductRepository dao=ProductRepository.getInstance();
	
	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setCondition(condition);
	newProduct.setFilename(fileName);
	
	dao.addProduct(newProduct); */
	
	response.sendRedirect("products.jsp");
%>

</body>
</html>

