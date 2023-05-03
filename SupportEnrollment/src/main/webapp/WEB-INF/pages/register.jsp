<%-- 
    Document   : register
    Created on : Apr 17, 2023, 10:45:31 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="se" uri="http://www.springframework.org/security/tags"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:choose>
    <c:when test="${user.userName != null}">
        <c:url value="/admin/users/${user.id}" var="action" />
    </c:when>
    <c:otherwise>
        <c:url value="/register" var="action"/>
    </c:otherwise>
</c:choose>
<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-5">
                <div class="login-wrap p-4 p-md-5">
                    <c:choose>
                        <c:when test="${user.id > 0}">
                            <h3 class="text-center mb-4">Thông tin tài khoản</h3>
                        </c:when>
                        <c:otherwise>
                            <h3 class="text-center mb-4">Đăng ký tài khoản</h3>
                        </c:otherwise>
                    </c:choose>
                    <form:form method="post" action="${action}" modelAttribute="user" class="login-form" enctype="multipart/form-data">
                        <div class="form-group d-flex">
                            <form:input type="file" class="form-control rounded-left" placeholder="Avatar" id="file" name="file" path="file" />
                        </div>
                        <br>
                        <c:if test="${user.avatar != null}">
                            <img src="${user.avatar}" width="200" /><br>
                        </c:if>
                        <div class="form-group d-flex">
                            <form:input type="text" class="form-control rounded-left" placeholder="Name" id="name" name="name" path="name"/>
                        </div>
                        <br>
                        <div class="form-group d-flex">
                            <form:input type="email" class="form-control rounded-left" placeholder="Email" id="email" name="email" path="email"/>
                        </div>
                        <br>
                        <div class="form-group">
                            <form:input type="text" class="form-control rounded-left" placeholder="Username" id="userName" name="userName" path="userName"/>
                        </div>
                        <br>
                        <c:if test="${user.id == null}">
                        <div class="form-group d-flex">
                            <form:input type="password" class="form-control rounded-left" placeholder="Password" id="passWord" name="passWord" path="passWord"/>
                        </div>
                        <br>
                        <div class="form-group d-flex">
                            <form:input type="password" class="form-control rounded-left" placeholder="Repeat Password" id="checkPassWord" name="checkPassWord" path="checkPassWord" />
                        </div>
                        <br>
                        </c:if>
                        <se:authorize access="hasRole('ROLE_ADMIN')">
                            <div class="form-group">
                                <form:input type="text" class="form-control rounded-left" id="role" name="role" path="role"/>
                            </div>
                            <div class="form-floating mb-3 mt-3">
                                <form:checkbox path="isActive" id="isActive" name="isActive"/>
                            </div>
                        </se:authorize>
                        <div class="form-group">
                            <c:choose>
                                <c:when test="${user.id > 0}">
                                    <form:hidden path="id" />
                                    <form:hidden path="avatar" />
                                    <form:hidden path="passWord" />
                                    <input type="submit"  value="Update" class="btn btn-success" />
                                    <a href="<c:url value="/admin/users" />" class="btn btn-primary">Back</a>
                                </c:when>
                                    <c:otherwise>
                                        <input type="submit"  value="Submit" class="form-control btn btn-primary rounded submit px-3" />
                                        <br><br>
                                        <div class="form-group d-md-flex">
                                            <div class="w-50">
                                                <label class="checkbox-wrap checkbox-primary">Remember Me
                                                    <input type="checkbox" checked>
                                                    <span class="checkmark"></span>
                                                </label>
                                            </div>
                                            <div class="w-50 text-md-right">
                                                <a href="<c:url value="/login"/>">Đăng nhập</a>
                                            </div>
                                        </div>
                                    </c:otherwise>
                            </c:choose>
                        </div>
      
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</section>

