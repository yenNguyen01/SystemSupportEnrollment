<%-- 
    Document   : register
    Created on : Apr 17, 2023, 10:45:31 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:url value="/register" var="action"/>
<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-5">
                <div class="login-wrap p-4 p-md-5">
                    <h3 class="text-center mb-4">Đăng ký tài khoản</h3>
                    <form:form method="post" action="${action}" modelAttribute="user" class="login-form" enctype="multipart/form-data">
                        <div class="form-group d-flex">
                            <input type="file" class="form-control rounded-left" placeholder="Avatar" required id="file" name="file" />
                        </div>
                        <br>
                        <div class="form-group d-flex">
                            <input type="text" class="form-control rounded-left" placeholder="Name" required id="name" name="name" />
                        </div>
                         <br>
                        <div class="form-group d-flex">
                            <input type="email" class="form-control rounded-left" placeholder="Email" required id="email" name="email"/>
                        </div>
                         <br>
                        <div class="form-group">
                            <input type="text" class="form-control rounded-left" placeholder="Username" required id="userName" name="userName"/>
                        </div>
                        <br>
                        <div class="form-group d-flex">
                            <input type="password" class="form-control rounded-left" placeholder="Password" required id="passWord"  name="passWord">
                        </div>
                         <br>
                         <div class="form-group d-flex">
                            <input type="password" class="form-control rounded-left" placeholder="Repeat Password" required id="checkPassWord" name="checkPassWord">
                         </div>
                         <br>
                         <div>
                             <c:if test="${registrationError != null}">
                                 <div class="alert alert-danger">${registrationError}</div>
                             </c:if>
                         </div>
                         <br>
                         <div class="form-group">
                            <button type="submit" class="form-control btn btn-primary rounded submit px-3">Submit</button>
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
                                <a href="<c:url value="/login"/>">Đăng nhập</a>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</section>

