<%-- 
    Document   : create-dep
    Created on : Apr 24, 2023, 11:24:46 AM
    Author     : Computer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<link href="<c:url value="/contentUser/css/create-dep.css"/>" rel="stylesheet"/>
<c:if test="${errMsg!=null}">
    <div class="alert alert-danger alert-dismissible">
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        <strong>Thông báo!</strong> ${errMsg}
    </div>
</c:if>

<c:choose>
    <c:when test="${department.name!=null}">
        <c:url value="/admin/update/department/${department.id}" var="action" />
    </c:when>
    <c:otherwise>
        <c:url value="/admin/department/create" var="action" />
    </c:otherwise>
</c:choose>

<div class="container create-dep-fm">
    <h2 class="create-dep">Thông tin khoa</h2>
    <form:form method="post" action="${action}" enctype="multipart/form-data" modelAttribute="department">
        <div class="form-floating mb-3">
            <form:input type="text" class="form-control" id="name" path="name" placeholder="Nhập tên khoa . . ." name="name"/>
            <label for="name">Tên khoa</label>
        </div>
        <div class="form-floating mb-3">
            <form:textarea class="form-control" placeholder="Nhập mô tả" style="height: 150px" id="description" path="description" name="description"/>
            <label for="description">Mô tả</label>
        </div>
        <div class="form-floating mb-3">
            <form:input type="text" class="form-control" id="website" path="website" placeholder="Nhập đường link website . . ." name="website"/>
            <label for="website">Link website</label>
        </div>
        <div class="form-floating mb-3">
            <form:input type="text" class="form-control" id="embedVideo" path="embedVideo" placeholder="Nhập đường link website . . ." name="embedVideo"/>
            <label for="embedVideo">Link nhúng video</label>
        </div>
        <div class="input-group mb-3">
            <label class="input-group-text" for="file">Ảnh đại diện</label>
            <form:input type="file" class="form-control" id="file" path="file" name="file" accept="image/*"/>
        </div>
        <c:choose>
            <c:when test="${department.name!=null}">
                <div class="mb-3 text-center">
                    <img src="${department.image}" width="240" height="100"/>
                </div>
                <div class="form-check mb-3">
                    <label class="form-check-label" for="isActive">Hoạt động?</label>
                    <form:checkbox class="form-check-input" id="isActive" path="isActive" name="isActive"/>
                </div>
                <div class="btn-create container">
                    <button type="submit" class="btn btn-primary">Sửa Thông Tin </button>
                </div>
            </c:when>
            <c:otherwise>
                <div class="btn-create container">
                    <button type="submit" class="btn btn-primary">Thêm Thông Tin</button>
                </div>
            </c:otherwise>
        </c:choose>
    </form:form>
</div>
