<%-- 
    Document   : managePost
    Created on : Apr 25, 2023, 6:16:31 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/admin/posts" var="action" />
<c:if test="${errMsg != null}">
    ${errMsg}
</c:if>
<br>  
<h1 class="text-center text-success"> QUẢN TRỊ BÀI ĐĂNG </h1>
<c:url value="/admin/posts" var="action" />
<form class="d-flex" action="${action}">
    <input class="form-control me-2" type="text" name="kw" placeholder="Nhập tên...">
    <button class="btn btn-primary" type="submit">Tìm</button>
</form>
<div class="container mt-3">
     <div class="col-md-3 col-4">
        <a href="<c:url value="/admin/posts/addNew"/>"><i class="fa fa-plus me-2" aria-hidden="true"></i>Add new</a>
    </div>
</div>
<table class="table">
    <tr>
        <th>Id</th>
        <th>Image</th>
        <th>Title</th>
        <th>Category</th>
        <th></th>
    </tr>
    <c:forEach items="${pagination.getPage()}" var="p">
        <c:url value="/admin/posts/update/${p.id}" var="update"/>
        <tr id="post${p.id}">
            <td>${p.id}</td>
            <td>
                <c:if test="${p.image != null}">
                  <img src="${p.image}" width="200" />
              </c:if>
              <c:if test="${p.image == null}"> 
                  <img src="https://tuyensinh.ou.edu.vn/tmp/rscache/350x183-no_picture.png" class="img-fluid" width="400px">
              </c:if>
                
            </td>
            <td>${p.title}</td>
                <c:forEach items="${categories}" var="c">
                    <c:choose>
                        <c:when test="${p.categoryId.id == c.id}">
                        <td value="${c.id}" selected>${c.name}</td>
                    </c:when>
                    </c:choose>
                </c:forEach>
            <td style="width:200px">
                <c:url value="/api/posts/${p.id}" var="endpoint" />
                <input type="button" onclick="deletePost('${endpoint}', ${p.id})" value="Xóa" class="btn btn-danger" />
                <a href="<c:url value="/admin/posts/${p.id}" />" class="btn btn-info">Cập nhật</a>
            </td>
        </tr>
    </c:forEach>
</table>
    
<div>
<ul class="pagination pagination-lg">
        <c:if test="${pagination.hasPreviousPage()}">
        <li class="page-item"><a class="page-link" href="<c:url value="?pageNo=${pagination.getPreviousPage().getPageNo()}"/>">Previous</a></li>
        </c:if>
        <c:forEach begin="1" end="${pagination.getTotalPages()}" var="page">
        <li class="${page == pagination.getPageNo() ? 'page-item active' : 'page-item'}"><a class="page-link" href="<c:url value="?pageNo=${page}&amp;pageSize=${pagination.getPageSize()}"/>">${page}</a>
        </c:forEach>
        <c:if test="${pagination.hasNextPage()}">
        <li class="page-item"><a class="page-link" href="<c:url value="?pageNo=${pagination.getNextPage().getPageNo()}"/>">Next</a></li>
        </c:if>
    <!--<li class="page-item"><a class="page-link" href="<c:url value="?pageNo=${pagination.getTotalPages()}"/>">Last</a></li>-->
</ul>
</div>

<script src="<c:url value="/js/post.js" />"></script>



