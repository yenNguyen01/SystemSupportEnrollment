<%-- 
    Document   : home
    Created on : Apr 8, 2023, 11:06:38 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<div id="demo" class="carousel slide" data-bs-ride="carousel">

    <!-- Indicators/dots -->
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
        <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
    </div>

    <!-- The slideshow/carousel -->
    <div class="carousel-inner">
        <c:forEach var="banner" items="${banners}">
            <div class="carousel-item active">
                <img src="<c:url value="${banner.url}"/>" alt="" class="d-block" style="width:100%; height: 500px">
            </div>
        </c:forEach>

    </div>

    <!-- Left and right controls/icons -->
    <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
    </button>
</div>

<div class="container mt-5">
    <div class="row">
        <div class="col-sm-4">
            <div style="background-color: #E8EBF4;">
            <h3 class="mt-4">Tin mới</h3>
            <ul class="nav nav-pills flex-column">
                <c:forEach items="${newPost}" var="newPostItem">
                <c:url value="/posts/${newPostItem.id}" var="dt" />
                <li class="nav-item">
                    <a class="nav-link" href="${dt}">${newPostItem.title}</a>
                </li>
                </c:forEach>
            </ul>
            <hr class="d-sm-none">
            </div>
            <br>
            <div class="row m-rightimage-bg pt-3">
                <div class="col-md-12 p-0">
                    <h3 class="h3-responsive mb-3 font-weight-bold m-primary-text pl-3 m-uppercase" data-wow-delay="0.1s">Video/Hình ảnh</h3>
                    <iframe width="100%" height="315" src="https://www.youtube.com/embed/Us1okcXiHpA?controls=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe>
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <c:forEach var="post" items="${postIndex}">
                <h2>${post.title}</h2>
                <p>${post.content}</p>
            </c:forEach>
            <c:forEach var="cate" items="${categories}">
                <div class="catinfo_22" id="aa_22">
                <div class="catinfo_19" id="aa_19">
                    <h2 class="h2-responsive font-weight-bold mb-5 m-primary-text m-uppercase" data-wow-delay="0.1s">${cate.name}</h2>
                </div>
                <div class="row">
            <c:forEach items="${postCategory}" var="post">
                <c:if test="${post.categoryId.id == cate.id}">
                <c:url value="/posts/${post.id}" var="detail" />
                <div class="single-news mb-4 m-smallpost-hr" data-wow-delay="0.1s" style="padding-top: 20px;">               
                    <div class="row">
                        <div class="col-md-3">
                            <div class="view overlay rounded z-depth-0 mb-4">
                                <c:if test="${post.image != null}">
                                    <img class="img-fluid" src="${post.image}">
                                </c:if>
                                <c:if test="${post.image == null}"> 
                                    <img src="https://tuyensinh.ou.edu.vn/tmp/rscache/350x183-no_picture.png" class="img-fluid" width="400px">
                                </c:if>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="d-flex justify-content-between">
                                <div class="col-11 pl-0 mb-3">
                                    <a href="${detail}" title="${post.title}" class="dark-grey-text m-primary-text">${post.title}</a>
                                </div>
                                <a class="m-primary-text"><i class="fa fa-angle-double-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
               </c:if>
            </c:forEach>
                </div>
                <a href="<c:url value="/category/${cate.id}"/>">Xem thêm</a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>