<%-- 
    Document   : frequent-question
    Created on : May 1, 2023, 1:50:23 PM
    Author     : Computer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<c:url value="/contentUser/css/frequent-question.css"/>"/>
<h1 class="title">Các câu hỏi thường gặp</h1>
<div class="container">
    <c:forEach items="${questions}" var="q">
        <div class="row">
            <p class="content-question">
                <i class="fa fa-question-circle me-2" aria-hidden="true"></i>
                ${q.content}
            </p>
            <div class="content-answer">
                <c:forEach items="${q.answerSet}" var="a">
                    <p class="mb-3 ms-4">
                        <i class="fa fa-share me-2" aria-hidden="true"></i>
                        ${a.content}
                    </p>
                </c:forEach>
            </div>
        </div>
    </c:forEach>   
</div>

<div class="text-end fst-italic text-secondary fw-bold">Trang ${page_now}/${total_page}</div>

<nav aria-label="Page navigation example">
    <ul class="pagination">
        <li class="page-item">
            <a onclick="pagePrevious(${total_page}, ${page_now})" class="page-link" id="previous" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <c:forEach begin="1" end="${total_page}" step="1" var="p">
            <c:url value="/frequent-questions?page=${p}" var="url_page"/>
            <li class="page-item"><a class="page-link" href="${url_page}">${p}</a></li>
            </c:forEach>    
        <li class="page-item">
            <a onclick="pageNext(${total_page}, ${page_now})" class="page-link" id="next" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</nav>

<script>
    function pagePrevious(total, page) {
        let pre = document.getElementById("previous");
        if (page <= total && page > 1) {
            let url = "/SupportEnrollment/frequent-questions?page=" + (page - 1);
            pre.href=url;
        }
        else if(page===1){
            let url = "/SupportEnrollment/frequent-questions?page=" + total;
            pre.href=url;
        }
    }
    
    function pageNext(total, page){
        let next = document.getElementById("next");
        if (page < total && page >= 1) {
            let url = "/SupportEnrollment/frequent-questions?page=" + (page + 1);
            next.href=url;
        }
        else if(page===total){
            let url = "/SupportEnrollment/frequent-questions?page=1";
            next.href=url;
        }
    }
</script>