<%-- 
    Document   : user-dep-ma-sco
    Created on : Apr 28, 2023, 7:11:18 AM
    Author     : Computer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<c:url value="/contentUser/css/dep-ma-sco.css"/>"/>

<h2 class="title">Thông tin các khoa</h2>
<p class="text-capitalize fst-italic mb-1 linear-wipe">
    <span><i class="fa fa-hand-o-right" aria-hidden="true"></i></span> 
    Chú ý: bấm vào từng khoa để xem chi tiết ngành và điểm chuẩn
</p>
<div class="row mb-4 info-dep"> 
    <div class="col-md-6 col-6 me-5">
        <img class="img-thumbnail" src="https://res.cloudinary.com/dp50hyprx/image/upload/v1682642709/dai-hoc-mo-tp.hcm_aaffra.jpg" alt="alt"/>
    </div>
    <div class="col-md-4 col-4">
        <c:forEach items="${departments}" var="d">
            <div class="row">
                <a href="<c:url value="/department-major-score/${d.id}"/>">
                    <spans class="me-1"><i class="fa fa-snowflake-o" aria-hidden="true"></i></spans>
                    ${d.name}
                </a>
            </div>
        </c:forEach>
    </div>
</div>
