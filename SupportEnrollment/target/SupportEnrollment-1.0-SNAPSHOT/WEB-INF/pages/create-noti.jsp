<%-- 
    Document   : create-dep
    Created on : Apr 24, 2023, 11:24:46 AM
    Author     : Computer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<link rel="stylesheet" href="<c:url value="/contentUser/css/create-noti.css"/>"/>

<c:if test="${errMsg!=null}">
    <div class="alert alert-danger alert-dismissible fade show text-center mt-4" role="alert">
        <strong>Thông báo!</strong> ${errMsg}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>
<c:if test="${updSuccMsg!=null}">
    <div class="alert alert-success alert-dismissible fade show text-center mt-4" role="alert">
        <strong>Thông báo!</strong> ${updSuccMsg}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>
<c:if test="${updErrMsg!=null}">
    <div class="alert alert-danger alert-dismissible fade show text-center mt-4" role="alert">
        <strong>Thông báo!</strong> ${updErrMsg}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>

<div id="thongbao" class="text-center mt-4 me-2 ms-2"></div>

<div class="container">
    <c:choose>
        <c:when test="${notification.content==null}">
            <c:url value="/admin/notification/create" var="action"/>
        </c:when>
        <c:otherwise>
            <c:url value="/admin/notification-update/${notification.id}" var="action"/>
        </c:otherwise>
    </c:choose>

    <form:form onsubmit="return checkValue()" method="post" action="${action}" modelAttribute="notification">
        <h2 class="text-center text-uppercase mt-4 mb-4">Thông tin bài đăng thông báo</h2>
        <div class="mb-3 was-validated">
            <label for="title" class="form-label text-secondary">Tiêu đề</label>
            <form:input type="text" class="form-control is-invalid" id="title" name="title" placeholder="Nhập tiêu đề . . ." path="title" required="true"/>
        </div>
        <div class="mb-3 was-validated">
            <label for="content" class="form-label text-secondary">Nội dung</label>
            <form:textarea class="form-control is-invalid" id="content" rows="3" path="content" name="content" placeholder="Nhập nội dung . . ." required="true"/>
        </div>
        <div class="mb-3 was-validated">
            <label for="startCalendar" class="form-label text-secondary">Thời gian bắt đầu</label>
            <form:input type="datetime-local" name="startCalendar" class="form-control is-invalid" id="startCalendar" path="startCalendar" required="true"/>
        </div>

        <div class="form-check mb-3">
            <input onclick="onChangeStatus()" class="form-check-input" type="checkbox" id="flexCheck">
            <label class="form-check-label text-secondary" for="flexCheck">
                ? Đặt thời gian khóa chức năng đặt câu hỏi
            </label>
        </div>
        <div class="mb-4">
            <label for="endCalendar" class="form-label text-secondary">Thời gian kết thúc</label>
            <form:input type="datetime-local" name="endCalendar" class="form-control" id="endCalendar" path="endCalendar" disabled="true"/>
        </div>
        <div class="mb-4 mt-5 w-100 text-center">
            <c:choose>
                <c:when test="${notification.content==null}">
                    <button class="btn btn-info text-light text-uppercase fw-bold w-75" type="submit">Thêm bài đăng</button>
                </c:when>
                <c:otherwise>
                    <button class="btn btn-warning text-light text-uppercase fw-bold w-75" type="submit">Sửa bài đăng</button>
                </c:otherwise>
            </c:choose>            
        </div>
    </form:form>
</div>

<<script src="<c:url value="/contentUser/js/create-noti.js"/>"></script>

<script>
    function onChangeStatus() {
        let check = document.getElementById("flexCheck");
        if (check.checked === true) {
            document.getElementById("endCalendar").disabled = false;
        } else {
            document.getElementById("endCalendar").disabled = true;
            document.getElementById("endCalendar").value = null;
        }
    }
    

</script>
