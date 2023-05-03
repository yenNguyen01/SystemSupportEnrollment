
<%-- 
    Document   : header
    Created on : Apr 10, 2023, 10:45:06 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="se" uri="http://www.springframework.org/security/tags"  %>
<nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
    <a href="index.html" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
        <h2 class="m-0 text-primary"><i class="fa fa-book me-3"></i>eLEARNING</h2>
    </a>
    <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav ms-auto p-4 p-lg-0">
            <a href="<c:url value="/"/>" class="nav-item nav-link">Trang chủ</a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Chương trình đào tạo</a>
                <div class="dropdown-menu fade-down m-0">
                    <c:forEach items="${categories}" var="c">
                        <a href="<c:url value="/category/${c.id}" />" class="dropdown-item">${c.name}</a>
                    </c:forEach>
                </div>
            </div>
        </div>
        <se:authorize access="hasRole('ROLE_ADMIN')">
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Quản trị</a>
                <div class="dropdown-menu fade-down m-0">
                    <a href="<c:url value="/admin/posts" />" class="dropdown-item">Post</a>
                    <a href="<c:url value="/admin/banners" />" class="dropdown-item">Banner</a>
                    <a href="<c:url value="/admin/users" />" class="dropdown-item">User</a>
                </div>
            </div>
        </se:authorize>
        <c:choose>
            <c:when test="${pageContext.request.userPrincipal.name == null}">
                <a class="nav-link text-danger" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block" href="<c:url value="/login" />">Đăng nhập</a>
            </c:when>
            <c:when test="${pageContext.request.userPrincipal.name != null}">
                <a class="nav-link text-danger" href="<c:url value="/" />">${pageContext.request.userPrincipal.name}</a>
                <a class="nav-link text-success" href="<c:url value="/logout" />">Đăng xuất</a>
            </c:when>
        </c:choose>
                <c:url value="/" var="action" />
                <form class="d-flex" action="${action}">
                    <input class="form-control me-2" type="text" name="kw" placeholder="Nhập tên...">
                    <button class="btn btn-primary" type="submit">Tìm</button>
                </form>
    </div>
</nav>  
</header>
