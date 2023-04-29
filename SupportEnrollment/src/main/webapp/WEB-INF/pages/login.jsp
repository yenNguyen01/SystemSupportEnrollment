<%-- 
    Document   : login
    Created on : Apr 16, 2023, 10:25:53 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<spring:url value="/login" var="action" />
<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-5">
                <div class="login-wrap p-4 p-md-5">
<!--                    <div class="icon d-flex align-items-center justify-content-center">
                        <span class="fa fa-user-o"></span>
                    </div>-->
                    <h3 class="text-center mb-4">Đăng nhập</h3>
                    <form:form method="post" action="${action}" modelAttribute="user" class="login-form">
                        <div class="form-group">
                            <input type="text" class="form-control rounded-left" placeholder="Username" required id="userName" name="userName">
                        </div>
                        <br>
                        <div class="form-group d-flex">
                            <input type="password" class="form-control rounded-left" placeholder="Password" required id="passWord" name="passWord">
                        </div>
                         <br>
                        <div class="form-group">
                            <button type="submit" class="form-control btn btn-primary rounded submit px-3">Login</button>
                        </div>
                         <br>
                        <div class="form-group d-md-flex">
                            <div class="w-50">
                                <label class="checkbox-wrap checkbox-primary">Remember Me
                                    <input type="checkbox" checked>
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="w-50 text-md-right">
                                <a href="<c:url value="/register"/>">Chưa có tài khoản</a>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</section>
