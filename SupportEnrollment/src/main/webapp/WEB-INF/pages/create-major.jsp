<%-- 
    Document   : create-major
    Created on : Apr 25, 2023, 2:49:12 PM
    Author     : Computer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<c:url value="/contentUser/css/create-majors.css"/>"/>

<div class="text-center me-4 ms-4 mt-4" id="thongbao"></div>
<c:url value="/admin/major/create" var="action"/>
<div class="create-major">
    <h2 class="text-center text-uppercase">Thông tin ngành học</h2>
    <form:form onsubmit="return checkValue()" method="post" action="${action}" enctype="multipart/form-data" modelAttribute="major">
        <div class="mb-3 was-validated">
            <label for="name" class="form-label">Tên ngành</label>
            <form:input type="text" class="form-control is-invalid" id="name" path="name" 
                        placeholder="Nhập tên ngành . . ." name="name" required="true"/>
        </div>
        <div class="mb-3 was-validated">
            <label for="code" class="form-label">Mã ngành</label>
            <form:input type="text" class="form-control is-invalid" id="code" path="code" 
                        placeholder="Nhập mã code . . ." name="code" required="true"/>
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

<script>
    function checkValue(){
        let ten = document.getElementById("name").value;
        let maNganh = document.getElementById("code").value;
        
        if(ten.length > 200){
            document.getElementById("thongbao").innerHTML=`<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Thông báo!</strong> Tên ngành không vượt quá 200 ký tự.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>`;
            return false;
        }
        
        if(maNganh.length > 100){
            document.getElementById("thongbao").innerHTML=`<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Thông báo!</strong> Mã ngành không vượt quá 100 ký tự.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>`;
            return false;
        }
        return true;
    }
</script>