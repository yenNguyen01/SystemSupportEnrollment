<%-- 
    Document   : addnew-Post
    Created on : May 1, 2023, 8:58:30 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:choose>
    <c:when test="${post.id > 0}">
        <h3 class="text-center mb-4">Cập nhật bài đăng</h3>
    </c:when>
    <c:otherwise>
        <h3 class="text-center mb-4"> Thêm mới bài đăng</h3>
    </c:otherwise>
</c:choose>
<c:url value="/admin/posts/addNew" var="action"/>
<c:if test="${errMsg != null}">
    ${errMsg}
</c:if>
<form:form method="post" action="${action}" enctype="multipart/form-data" modelAttribute="post">
    <form:input type="hidden" id="id" name="id" path="id"/>
    <div class="form-floating mb-3 mt-3"v>
        <form:input type="file" class="form-control" id="file" 
                    path="file" placeholder="Image" name="file"/>
        <label for="image">Ảnh</label>
    </div>
    <c:if test="${post.image != null}">
        <div class="form-floating mb-3 mt-3">
            <img src="${post.image}" width="120" /> 
        </div>
    </c:if>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" id="title" 
                    path="title" placeholder="Title" name="title" />
        <label for="title">Tiêu đề</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:textarea type="text" class="form-control" id="content" style="height: 250px"
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
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" id="url" 
                    path="url" placeholder="Link URL" name="url" />
        <label for="url">Link Url (nếu có)</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <c:choose>
            <c:when test="${post.id > 0}">
                <form:hidden path="id" />
                <form:hidden path="image" />
                <input type="submit"  value="Update" class="btn btn-success" />
            </c:when>
            <c:otherwise>
                <input type="submit"  value="Save" class="btn btn-success" />
                
            </c:otherwise>
        </c:choose>
          <a href="<c:url value="/admin/posts" />" class="btn btn-primary">Back</a>
    </div>
</form:form>
