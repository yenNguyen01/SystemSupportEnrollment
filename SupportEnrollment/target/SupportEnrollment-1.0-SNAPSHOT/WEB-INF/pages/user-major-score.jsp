<%-- 
    Document   : user-major-score
    Created on : Apr 28, 2023, 7:50:31 AM
    Author     : Computer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<c:url value="/contentUser/css/ma-sco.css"/>"/>

<div class="img-header mt-4 mb-4">
    <img src="${department.image}" alt="Image" width="100" height="60"/>
</div>
<c:if test="${department.embedVideo!=''}">
    <div class="video-info mb-4">
        <iframe src="${department.embedVideo}"></iframe>
    </div>
</c:if>

<c:if test="${scores!=null}">
    <a class="text-decoration-none text-end fw-bold fs-5" href="#table-diem">
        <p class="text-capitalize fst-italic mb-1 linear-wipe">
            <span><i class="fa fa-arrow-down me-2" aria-hidden="true"></i></span> 
            Lướt xuống cuối trang để xem điểm chuẩn

        </p>
    </a>
</c:if>

<hr style="width: 40%; margin-bottom: 2rem;"/>
<h2 class="title-dep">Giới thiệu khoa: ${department.name}</h2>
<p class="intro-content mb-2">${department.description}</p>
<p class="link-web mb-3">
    <span style="color: #1d559f;" class="me-2 text-uppercase fw-bold fs-5">Website:</span>
    <a class="fs-6" href="${department.website}">${department.website}</a>
</p>
<hr style="width: 40%; margin-bottom: 1.2rem;"/>
<div style="color: #1d559f;" class="fs-5 text-capitalize fw-bold">Gồm các ngành:</div>
<c:choose>
    <c:when test="${count_majors > 0}">
        <ul class="majors">
            <c:forEach items="${majors}" var="m">
                <li>
                    <a class="link-major" href="<c:url value="/department-major-score/${department.id}?majorId=${m.id}"/>">
                        <span class="me-2"><i class="fa fa-paper-plane" aria-hidden="true"></i></span>
                            ${m.name}
                    </a>
                    <span style="font-size: 12px;" class="ms-2 fst-italic">
                        ( <i class="fa fa-hand-o-left me-1" aria-hidden="true"></i>
                        Bấm để xem điểm chuẩn )
                    </span>
                </li>
            </c:forEach>
        </ul>
    </c:when>
    <c:otherwise>
        <p class="fst-italic fs-6">***Hiện tại chưa có thông tin</p>
    </c:otherwise>
</c:choose>


<c:if test="${scores!=null}">
    <p class="title-major text-capitalize fs-6 fw-bold ms-5">
        Điểm chuẩn ngành:
        <span style="color: darkblue; text-decoration: underline;" class="ms-2 fw-bold fs-5">${name_major}</span> 
        - 5 năm gần nhất
    </p>
    <table id="table-diem" class="table score-table table-success table-striped table-hover ms-5">
        <thead>
            <tr class="fw-bold">
                <td>Năm</td>
                <td>Điểm</td>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${scores}" var="s">
                <tr>
                    <td>${s.year}</td>
                    <c:choose>
                        <c:when test="${s.score!=0.0}">
                            <td>${s.score}</td>
                        </c:when>
                        <c:otherwise>
                            <td>-/-</td>
                        </c:otherwise>
                    </c:choose>

                </tr>
            </c:forEach>
        </tbody>
    </table>

    <p class="text-capitalize fst-italic fs-6 mt-4 mb-4">
        <a style="text-decoration: none; color: orangered; font-family: 'FontAwesome';" href="<c:url value="/department-major-score/${department.id}"/>">
            <i class="fa fa-backward me-2" aria-hidden="true"></i>
            Trở về danh sách ngành
        </a>
    </p>
</c:if>

<c:if test="${scores==null}">
    <p class="text-capitalize fst-italic fs-6 mt-4 mb-4">
        <a style="text-decoration: none; color: orangered; font-family: 'FontAwesome';" href="<c:url value="/department-major-score"/>">
            <i class="fa fa-backward me-2" aria-hidden="true"></i>
            Trở về danh sách khoa
        </a>
    </p>
</c:if>

<c:if test="${scores!=null}">
    <script>
        window.onload=function (){
            window.scrollTo(0, document.body.scrollHeight);
        }
    </script>
</c:if>