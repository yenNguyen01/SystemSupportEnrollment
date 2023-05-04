<%-- 
    Document   : manageBanner
    Created on : May 4, 2023, 6:40:06 AM
    Author     : Computer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/admin/banners" var="action" />
<c:if test="${errMsg != null}">
    ${errMsg}
</c:if>
<br>  
<h1 class="text-center text-success"> QUẢN LÝ BANNER </h1>

<div class="container mt-3">
     <div class="col-md-3 col-4">
        <a href="<c:url value="/admin/banners/addNew"/>"><i class="fa fa-plus me-2" aria-hidden="true"></i>Add new</a>
    </div>
</div>
<table class="table">
    <tr>
        <th>Id</th>
        <th>Title</th>
        <th>Image</th>
        <th>Active</th>
        <th></th>
    </tr>
    <c:forEach items="${banners}" var="b">
         <tr id="banner${b.id}">
            <td>${b.id}</td>
            <td>${b.title}</td>
            <td><img src="${b.url}" width="200" /></td>
            <td>
                <label class="switch">
                    <input type="checkbox" ${!b.isActive ? '' : 'checked'}>
                    <span class="slider round"></span>
                </label>
            </td>
            <td>
                <a href="<c:url value="/admin/banners/${b.id}" />" class="btn btn-info">Cập nhật</a>
            </td>
        </tr>
    </c:forEach>
</table>
