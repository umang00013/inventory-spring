<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
            <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Manager</title>
<link rel="stylesheet" href="/ims/resources/static/css/style1.css">
</head>
<body>

<div align="center">
<div id="top">
Welcome ${dealer.fname} ${dealer.lname} - ${dealer.address.city}
</div>
<div align="right"><a href="logout">Log Out 
<% out.print(request.getSession().getAttribute("user")); %></a></div>
<hr color="blue">
<img src="/ims/resources/static/images/inventory.jpg" style="width:300px; height:200px; text-align:center"><br><br>
<hr color="blue">
<a href="new">Create New Product</a>
<br/><br/>

<h1>Product List</h1>
<table border="1" cellpadding="10">
<thead>
<tr>
<th>Product ID</th>
<th>Name</th>
<th>Brand</th>
<th>Made In</th>
<th>Price</th>
<th>Actions</th>
</tr>
</thead>
<tbody>
<c:forEach var="product" items="${listProducts}">
<!-- construct an "update" link with product id -->
<c:url var="updateLink" value="/edit">
<c:param name="id" value="${product.id}" />
</c:url> <!-- construct an "delete" link with customer id -->
<c:url var="deleteLink" value="/delete">
<c:param name="id" value="${product.id}" />
</c:url>
<tr>
<td>${product.id}</td>
<td>${product.name}</td>
<td>${product.brand}</td>
<td>${product.madein}</td>
<td>${product.price}</td>
<td>
<!-- display the update link -->
<a href="${updateLink}">Update</a>
| <a href="${deleteLink}"
onclick="if (!(confirm('Are you sure you want to delete this Product?'))) return false">Delete</a>
</td>
</tr>
</c:forEach>
</tbody>
</table>
</div>





<hr color="blue">
</div>
</body>
</html>