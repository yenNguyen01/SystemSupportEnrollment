<%-- 
    Document   : manageUser
    Created on : May 4, 2023, 6:41:28 AM
    Author     : Computer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/admin/users" var="action" />
<c:if test="${errMsg != null}">
    ${errMsg}
</c:if>
<br>  
<h1 class="text-center text-success"> QUẢN LÝ USER </h1>
<c:url value="/admin/users" var="action" />
<form class="d-flex" action="${action}">
    <input class="form-control me-2" type="text" name="kw" placeholder="Nhập tên...">
    <button class="btn btn-primary" type="submit">Tìm</button>
</form>
<div class="container mt-3">
     <div class="col-md-3 col-4">
        <a href="<c:url value="/register"/>"><i class="fa fa-plus me-2" aria-hidden="true"></i>Tạo tài khoản</a>
    </div>
</div>
<table class="table">
    <tr>
        <th>Id</th>
        <th>Avatar</th>
        <th>UserName</th>
        <th>Name</th>
        <th>Email</th>
        <th>Role</th>
        <th>Active</th>
    </tr>
    <c:forEach items="${lstUser}" var="u">
         <tr id="user${b.id}">
            <td>${u.id}</td>
             <td><img src="${u.avatar}" class="rounded-circle" alt="Avatar" width="80" height="70" /></td>
            <td>${u.userName}</td>
            <td>${u.name}</td>
            <td>${u.email}</td>
            <td>${u.role}</td>
            <td>
                <label class="switch">
                    <input type="checkbox" ${!u.isActive ? '' : 'checked'}>
                    <span class="slider round"></span>
                </label>
            </td>
            <td>
                <a href="<c:url value="/admin/users/${u.userName}" />" class="btn btn-info">Cập nhật</a>
            </td>
        </tr>
    </c:forEach>
</table>
