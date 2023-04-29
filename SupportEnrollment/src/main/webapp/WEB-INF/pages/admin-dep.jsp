<%-- 
    Document   : admin-dep
    Created on : Apr 24, 2023, 10:04:36 AM
    Author     : Computer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="<c:url value="/contentUser/css/admin-dep.css"/>" rel="stylesheet"/>
<h2 class="title-list-dep">Quản lý khoa</h2>
<div class="mt-3 mb-3" id="noti"></div>
<div class="row search-fm">
    <div class="col-md-3 col-4">
        <a href="<c:url value="/admin/department/create"/>"><i class="fa fa-plus me-2" aria-hidden="true"></i>Tạo</a>
    </div>
    <div class="col-md-9 col-8">
        <i class="fa fa-search" aria-hidden="true"></i>
        <input type="text" id="search" placeholder="Input keyword . . ."/>
    </div>
</div>
<table class="table text-center table-hover">
    <thead>
        <tr>
            <th></th>
            <th>Mã</th>
            <th>Tên</th>
            <th>Ngày tạo</th>
            <th>Hoạt động?</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${departments}" var="d">
            <c:url value="/admin/update/department/${d.id}" var="url" /> 
            <c:url value="/api/department/delete/${d.id}" var="url_del" /> 
            <tr>
                <td>
                    <a href="${url}"><i class="fa fa-pencil-square me-1" aria-hidden="true"></i></a><!-- comment -->
                    <i onclick="deleteDepartment('${url_del}')" class="fa fa-trash" aria-hidden="true"></i>
                </td>
                <td>${d.id}</td><!-- comment -->
                <td>${d.name}</td>
                <td>${d.createDate}</td>
                <c:choose>
                    <c:when test="${d.isActive==true}">
                        <td>
                            <input type="checkbox" checked="checked"/>
                        </td>
                    </c:when>
                    <c:otherwise>
                        <td>
                            <input type="checkbox"/>
                        </td>
                    </c:otherwise>
                </c:choose>
            </tr>
        </c:forEach>       
    </tbody>
</table>

<script src="<c:url value="/contentUser/js/department.js"/>"></script>