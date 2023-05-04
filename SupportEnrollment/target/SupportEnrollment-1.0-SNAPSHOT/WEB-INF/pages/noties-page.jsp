<%-- 
    Document   : noties-page
    Created on : Apr 29, 2023, 11:14:39 AM
    Author     : Computer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="se" uri="http://www.springframework.org/security/tags"  %>

<link rel="stylesheet" href="<c:url value="/contentUser/css/noties-page.css"/>"/>


<h1 class="text-center text-uppercase mt-5 mb-4 title-noties">Thông báo</h1>

<div class="text-center" id="alert-del"></div>

<se:authorize access="hasRole('ROLE_ADMIN')">
    <a class="btn-create" href="<c:url value="/admin/notification/create"/>"> Tạo thông báo mới</a>
</se:authorize>

<c:forEach items="${noties}" var="n">
    <div id="noti${n.id}" class="row mt-4">
        <div class="col-md-2 col-2 text-center">
            <img class="w-75" class="rounded-circle" src="https://res.cloudinary.com/dp50hyprx/image/upload/v1682819395/bell-1096280__340_qarpp3.png" alt="Notification"/>
        </div>
        <div class="col-md-9 col-9 noti">
            <h5 class="text-secondary">${n.title} <i class="fa fa-arrows-h text-warning" aria-hidden="true"></i> ${n.createDate}</h5>
            <p>${n.content}</p>
            <p>
                <span class="text-decoration-underline fw-bold text-primary">Bắt đầu</span>: <span>${n.startTime}</span> 
                <c:if test="${n.endTime!=null}">
                    <span class="text-decoration-underline fw-bold text-primary ms-3">Kết thúc</span>: <span>${n.endTime}</span>
                </c:if>
            </p>
            <a href="<c:url value="/questions/${n.id}"/>">
                <span class="me-2"><i class="fa fa-location-arrow" aria-hidden="true"></i></span>
                Đặt câu hỏi
            </a>
        </div>
        <div class="col-md-1 col-1">
            <se:authorize access="hasRole('ROLE_ADMIN')">
                <a class="text-decoration-none" href="<c:url value="/admin/notification-update/${n.id}"/>">
                    <i class="fa fa-pencil me-2" aria-hidden="true"></i>
                </a>
                <c:url value="/api/notification-delete/${n.id}" var="del_url" />
                <i onclick="deleteNotification('${del_url}', ${n.id})" class="fa fa-trash" aria-hidden="true"></i>
            </se:authorize>
            <c:if test="${n.createDate >= date}">
                <div class="tag mt-3">
                    <span>Mới</span>
                </div>
            </c:if>
        </div>
    </div>
    <hr/>
</c:forEach>

<div class="text-end fst-italic fw-bold text-secondary">Trang ${page_now}/${total_page}</div>

<nav aria-label="Page navigation example">
    <ul class="pagination">
        <li class="page-item">
            <a onclick="pagePrevious(${total_page}, ${page_now})" class="page-link" id="previous" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <c:forEach begin="1" end="${total_page}" step="1" var="p">
            <c:url value="/list-notifications?page=${p}" var="url_page"/>
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

    function loadPage() {
        window.location.reload();
    }

    function deleteNotification(endpoint, ma) {
        if (confirm("Bạn có chắc chắn muốn xóa bản ghi này?")) {
            fetch(endpoint, {
                method: "delete"
            }).then(res => {
                if (res.status === 204) {
                    document.getElementById("alert-del").innerHTML = `<div class="alert alert-info alert-dismissible fade show" role="alert">
  <strong>Thông báo!</strong> Xóa bản ghi thành công.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>`;
                    let hi = "noti" + ma;
                    document.getElementById(hi).style.display = "none";
                } else {
                    document.getElementById("alert-del").innerHTML = `<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Thông báo!</strong> Xóa bản ghi thất bại.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>`;
                }
            });
        }

    }

    function pagePrevious(total, page) {
        let pre = document.getElementById("previous");
        if (page <= total & page > 1) {
            let url = "/SupportEnrollment/list-notifications?page=" + String(page - 1);
            pre.href = url;
        } else if (page === 1) {
            let url = "/SupportEnrollment/list-notifications?page=" + String(total);
            pre.href = url;
        }
    }

    function pageNext(total, page) {
        let next = document.getElementById("next");
        if (page >= 1 & page < total) {
            let url = "/SupportEnrollment/list-notifications?page=" + String(page + 1);
            next.href = url;
        } else if (page === total) {
            let url = "/SupportEnrollment/list-notifications?page=1";
            next.href = url;
        }
    }
</script>