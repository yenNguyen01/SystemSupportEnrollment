<%-- 
    Document   : create-scores
    Created on : Apr 27, 2023, 12:04:02 PM
    Author     : Computer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<c:url value="/contentUser/css/create-score.css"/>"/>

<c:url value="/admin/score/create" var="action" />
<div class="mt-3 mb-3">
    <c:if test="${errMsg!=null}">
        <div class="alert alert-danger alert-dismissible">
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            <strong>Thông báo!</strong> ${errMsg}
        </div>
    </c:if>
    <c:if test="${succMsg!=null}">
        <div class="alert alert-success alert-dismissible">
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            <strong>Thông báo!</strong> ${succMsg}
        </div>
    </c:if>
    <form:form method="post" action="${action}" modelAttribute="diem">
        <h2 class="title-create">Thông tin điểm chuẩn</h2>
        <div class="mb-3">
            <form:select path="year" name="year" id="year" class="form-select" aria-label="Default select example">
                <c:forEach items="${years}" var="y">
                    <option value="${y}">Năm ${y}</option>
                </c:forEach>           
            </form:select>
        </div>
                
        <div class="mb-3">
            <form:select id="search-major" class="form-select" path="majId" name="majId" aria-label="Default select example">
                <c:forEach items="${majors}" var="m">                
                    <option value="${m.id}">${m.name}</option>
                </c:forEach>           
            </form:select>
        </div>
                
        <div class="mb-3 row">
            <label for="score" class="col-sm-2 col-form-label">Điểm</label>
            <div class="col-sm-10">
                <form:input type="text" name="score" path="score" class="form-control" id="score"/>
            </div>
        </div>
     
        <div class="mb-3 row">
            <label for="note" class="col-sm-2 col-form-label">Ghi chú</label>
            <div class="col-sm-10">
                <form:textarea path="note" name="note" class="form-control" id="note" rows="3"/>
            </div>            
        </div>
            
        <div style="width: 100%;" class="container-fluid text-center">
            <button style="width: 80%;" type="submit" class="btn btn-primary">Thêm thông tin</button>
        </div>
    </form:form>
</div>
<div class="container text-center text-capitalize mb-4 back">
    <a href="<c:url value="/admin/scores"/>"><i class="fa fa-arrow-left me-2" aria-hidden="true"></i>Trở về trang danh sách điểm chuẩn</a>
</div>

<script>
    window.onload=function (){
        document.getElementById("year").value=new Date().getFullYear();
    }
</script>