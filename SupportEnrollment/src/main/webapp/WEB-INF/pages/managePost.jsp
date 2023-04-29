<%-- 
    Document   : managePost
    Created on : Apr 25, 2023, 6:16:31 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:url value="/admin/managePost" var="action" />
<c:if test="${errMsg != null}">
    ${errMsg}
</c:if>
<br>  
<h1 class="text-center text-success"> QUẢN TRỊ BÀI ĐĂNG </h1>

<div class="container mt-3">
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
        Add new
    </button>
</div>
<table class="table">
    <tr>
        <th></th>
        <th>Id</th>
        <th>Title</th>
        <th>Content</th>
        <th>Category</th>
        <th></th>
    </tr>
    <c:forEach items="${posts}" var="p">
        <tr id="product${p.id}">
            <!--<td><img src="${p.title}" width="200" /></td>-->
            <td></td>
            <td>${p.id}</td>
            <td>${p.title}</td>
            <td>${p.content}</td>
            <c:forEach items="${categories}" var="c">
                <c:choose>
                    <c:when test="${p.categoryId.id == c.id}">
                        <td value="${c.id}" selected>${c.name}</td>
                    </c:when>
                </c:choose>
            </c:forEach>
            <!--        <td>
            <c:url value="/api/products/${p.id}" var="endpoint" />
            <input type="button" onclick="deleteProduct('${endpoint}', ${p.id})" value="Xóa" class="btn btn-danger" />
            <a href="<c:url value="/admin/products/${p.id}" />" class="btn btn-info">Cập nhật</a>
        </td>-->
        </tr>
    </c:forEach>
</table>


<!-- The Modal -->
<div class="modal" id="myModal">
    <div class="modal-dialog" style="max-width: 800px">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header" style="background-color: #1150A0;">
                <h4 class="modal-title">Thêm mới bài đăng</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form:form method="post" action="${action}" enctype="multipart/form-data" modelAttribute="post">
                    <div class="form-floating mb-3 mt-3">
                        <form:input type="text" class="form-control" id="title" 
                                    path="title" placeholder="Title" name="title" />
                        <label for="title">Tiêu đề</label>
                    </div>
                    <div class="form-floating mb-3 mt-3">
                        <form:textarea type="text" class="form-control" id="content" rows="5"
                                       path="content" placeholder="Giá sản phẩm" name="content" ></form:textarea>
                        <label for="content">Nội dung</label>
                    </div>
                    <div class="form-floating">
                        <form:select class="form-select" path="categoryId" id="categoryId" name="categoryId">
                            <c:forEach items="${categories}" var="c">
                                <c:choose>
                                    <c:when test="${post.categoryId.id == c.id}">
                                        <option value="${c.id}" selected>${c.name}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${c.id}">${c.name}</option>
                                    </c:otherwise>
                                </c:choose>

                            </c:forEach>
                        </form:select>
                        <label for="categoryId" class="form-label">Danh mục bài đăng</label>
                    </div>
                </form:form>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>
