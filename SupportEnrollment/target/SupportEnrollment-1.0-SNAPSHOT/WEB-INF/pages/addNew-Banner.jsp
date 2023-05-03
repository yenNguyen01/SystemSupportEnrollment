<%-- 
    Document   : addNew-Banner
    Created on : May 1, 2023, 10:19:32 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:choose>
    <c:when test="${banner.id > 0}">
        <h3 class="text-center mb-4">Cập nhật banner</h3>
    </c:when>
    <c:otherwise>
        <h3 class="text-center mb-4">Thêm mới banner</h3>
    </c:otherwise>
</c:choose>
<c:url value="/admin/banners/addNew" var="action"/>
<form:form method="post" action="${action}" enctype="multipart/form-data" modelAttribute="banner">
    <form:input type="hidden" id="id" name="id" path="id"/>
    <div class="form-floating mb-3 mt-3"v>
        <form:input type="file" class="form-control" id="file" 
                    path="file" placeholder="Image" name="file"/>
        <label for="url">Ảnh</label>
    </div>
    <c:if test="${banner.url != null}">
        <div class="form-floating mb-3 mt-3">
            <img src="${banner.url}" width="120" /> 
        </div>
    </c:if>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" id="title" 
                    path="title" placeholder="Title" name="title" />
        <label for="title">Tiêu đề</label>
    </div>
    <c:if test="${banner.id > 0}">
        <div class="form-floating mb-3 mt-3">
            <form:checkbox path="isActive" id="isActive" name="isActive"/>
        </div>
    </c:if>    
    <div class="form-floating mb-3 mt-3">
        <c:choose>
            <c:when test="${banner.id > 0}">
                <form:hidden path="id" />
                <form:hidden path="url" />
                <input type="submit"  value="Update" class="btn btn-success" />
            </c:when>
            <c:otherwise>
                <input type="submit"  value="Save" class="btn btn-success" />
            </c:otherwise>
        </c:choose>
           <a href="<c:url value="/admin/banners" />" class="btn btn-primary">Back</a>

    </div>
</form:form>
