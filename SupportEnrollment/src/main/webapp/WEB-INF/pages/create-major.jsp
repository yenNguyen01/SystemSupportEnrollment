<%-- 
    Document   : create-major
    Created on : Apr 25, 2023, 2:49:12 PM
    Author     : Computer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<c:url value="/contentUser/css/create-majors.css"/>"/>

<c:url value="/admin/major/create" var="action"/>
<div class="create-major">
    <h2 class="text-center text-uppercase">Thông tin ngành học</h2>
    <form:form method="post" action="${action}" enctype="multipart/form-data" modelAttribute="major">
        <div class="mb-3">
            <label for="name" class="form-label">Tên ngành</label>
            <form:input type="text" class="form-control" id="name" path="name" 
                        placeholder="Nhập tên ngành . . ." name="name"/>
        </div>
        <div class="mb-3">
            <label for="code" class="form-label">Mã ngành</label>
            <form:input type="text" class="form-control" id="code" path="code" 
                        placeholder="Nhập mã code . . ." name="code"/>
        </div>
        <div class="mb-3">
            <label for="departmentId" class="form-label">Khoa</label>
            <form:select class="form-select" id="departId" path="departId" name="departId">
                <c:forEach items="${departments}" var="d">
                    <form:option value="${d.id}">${d.name}</form:option>
                </c:forEach>
            </form:select>
        </div
        <div class="mb-3 btn-create">
            <button type="submit" class="btn btn-primary">Lưu Thông Tin</button>
        </div>
    </form:form>
</div>
