<%--Document   : admin-major
Created on : Apr 25, 2023, 2:48:17 PM
Author     : Computer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<c:url value="/contentUser/css/admin-majors.css"/>"/>

<div id="dNoti" class="container mt-5 mb-4"></div>
<h1 class="major-title">Thông tin ngành học</h1>
<div class="row search-fm mb-4">
    <div class="col-md-3 col-4">
        <a href="<c:url value="/admin/major/create"/>">
            <i class="fa fa-plus-square me-2" aria-hidden="true"></i>Tạo mới
        </a>
    </div>
    <div class="col-md-9 col-8">
        <input onkeyup="searchContent()" type="text" id="search" placeholder="Nhập từ khóa . . .">
    </div>
</div>

<table class="table text-center table-hover">
    <thead>
        <tr>
            <th></th>
            <th>Mã</th>
            <th>Tên</th>
            <th>Mã ngành</th>
            <th>Trực thuộc khoa</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${majors}" var="m">
            <c:url value="/api/major/delete/${m.id}" var="action_del" />
            <tr class="tr-search" id="major${m.id}">
                <td>
                    <i onclick="formData(${m.id}, '${m.name}', '${m.code}', ${m.departmentId.id})" 
                       class="fa fa-pencil-square me-1" aria-hidden="true" data-bs-toggle="modal" 
                       data-bs-target="#editMajor"></i>
                    <i onclick="deleteMajor('${action_del}',${m.id})" class="fa fa-trash" aria-hidden="true"></i>
                </td>
                <td>${m.id}</td><!-- comment -->
                <td>${m.name}</td><!-- comment -->
                <td>${m.code}</td>
                <td>${m.departmentId.name}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>


<div class="modal fade" id="editMajor" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="container-fluid text-center mt-3" id="noti"></div>
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Chỉnh sửa thông tin</h5>
                <button onclick="loadData()" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="idMajor" name="id" readonly="true">
                    <label for="id">Mã</label>
                </div>
                <div class="form-floating mb-3 was-validated">
                    <input type="text" class="form-control is-invalid" id="nameMajor" name="name" required="true">
                    <label for="name">Tên ngành</label>
                </div>
                <div class="form-floating mb-3 was-validated">
                    <input type="text" class="form-control is-invalid" id="codeMajor" name="codeMajor" required="true">
                    <label for="code">Mã ngành</label>
                </div>
                <select class="form-select mb-3" id="depIdMajor" name="depIdMajor">
                    <option selected>Chọn khoa trực thuộc--</option>
                    <c:forEach items="${departments}" var="d">
                        <option value="${d.id}">${d.name}</option>
                    </c:forEach>                                 
                </select>
            </div>
            <div class="modal-footer">
                <c:url value="/api/major/update/" var="action_upd" />
                <button onclick="loadData()" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button onclick="updateMajor('${action_upd}')" type="button" class="btn btn-primary">Lưu Thay Đổi</button>
            </div>
        </div>
    </div>
</div>

<script src="<c:url value="/contentUser/js/major.js"/>"></script>