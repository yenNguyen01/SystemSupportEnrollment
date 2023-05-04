<%-- 
    Document   : question-page
    Created on : Apr 29, 2023, 9:36:11 PM
    Author     : Computer
--%>

<%@taglib prefix="se" uri="http://www.springframework.org/security/tags"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<c:url value="/contentUser/css/question-page.css" />"/>

<div class="container noti">
    <h3>${notiDtl.title}</h3>
    <p>${notiDtl.content}</p>
    <small class="me-3"><i class="fa fa-calendar me-1" aria-hidden="true"></i>Ngày tạo: ${notiDtl.createDate}</small> 
    <small class="me-3"><i class="fa fa-calendar-plus-o me-1" aria-hidden="true"></i>Thời gian bắt đầu: ${notiDtl.startTime}</small>
    <c:if test="${notiDtl.endTime!=null}">
        <small class="me-3"><i class="fa fa-calendar-minus-o me-1" aria-hidden="true"></i>Thời gian kết thúc: ${notiDtl.endTime}</small>
    </c:if>    
</div>

<c:if test="${errMsg!=null}">
    <div class="alert alert-danger alert-dismissible fade show container text-center" role="alert">
        <strong>Thông báo!</strong> ${errMsg}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>

<c:url value="/question-create" var="action" />
<form:form onsubmit="return checkValueTextArea('qContent','qAlert')" class="poser-form" method="post" action="${action}" modelAttribute="question">
    <div id="qAlert"></div>
    <h5 class="text-uppercase">Nhập câu hỏi</h5>
    <form:input type="hidden" path="notificationId" name="notificationId"/>
    <div class="form-floating mb-3 was-validated">
        <form:textarea class="form-control is-invalid" id="qContent" path="content" name="content" style="height: 120px" required="true"/>
        <label for="content">Nội dung câu hỏi</label>
    </div>
    <div class="mb-3 text-center">
        <c:choose>
            <c:when test="${pageContext.request.userPrincipal.name == null}">
                <span class="fst-italic">Vui lòng 
                    <a class="text-warning" href="<c:url value="/login"/>">đăng nhập</a> 
                    để thực hiện chức năng đăng câu hỏi.
                </span>
            </c:when>
            <c:otherwise>
                <c:if test="${(isLs&&!isQ)||(!isLs&&isQ)}">
                    <button type="submit" class="btn btn-primary w-25 text-light fw-bold text-uppercase">Đăng tải</button>
                </c:if>
                <c:if test="${!isLs&&!isQ}">
                    <button type="submit" class="btn btn-primary w-25 text-light fw-bold text-uppercase" disabled="true">Đăng tải</button>
                    <small class="text-center fst-italic d-block mt-2">Hết thời gian hoặc chưa đến thời gian đăng tải.</small>
                </c:if>
            </c:otherwise>
        </c:choose>
    </div>
</form:form>

<div class="container poser-content">
    <h5>Danh sách câu hỏi</h5>
    <c:if test="${questionsByNotiId!=null}">
        <c:forEach items="${questionsByNotiId}" var="q" >
            <div class="row mt-3 mb-3">
                <div class="col-md-2 col-2 text-center">
                    <img class="w-50 rounded-circle" src="${q.userId.avatar}" alt="Avatar"/>
                </div>
                <div class="col-md-9 col-9">
                    <p>${q.content}</p>
                    <span class="me-4"><i class="fa fa-user me-1" aria-hidden="true"></i>${q.userId.userName}</span>
                    <span><i class="fa fa-hourglass-half me-1" aria-hidden="true"></i>${q.createDate}</span>
                </div>
                <se:authorize access="hasRole('ROLE_ADMIN')">
                    <c:if test="${notiDtl.endTime!=null}">
                        <div class="col-md-1 col-1">
                            <span onclick="formData(${notiDtl.id}, ${q.id}, '${q.content}')" data-bs-toggle="modal" data-bs-target="#addAnswer">
                                <i class="fa fa-reply me-1" aria-hidden="true"></i>
                                Trả Lời
                            </span>
                        </div>
                    </c:if>
                </se:authorize>                           
                <hr class="mt-3"/>    
            </div>
            <c:if test="${notiDtl.endTime!=null && q.answerSet!=null}">
                <c:forEach items="${q.answerSet}" var="a">
                    <div class="row ms-5 mb-4">
                        <div class="col-md-2 col-2 text-center">
                            <img class="rounded-circle w-50" src="${a.userId.avatar}" alt="Avatar"/>
                        </div>
                        <div class="col-md-8 col-8">
                            <p>${a.content}</p>
                            <small>
                                <span class="me-4"><i class="fa fa-user me-1" aria-hidden="true"></i>${a.userId.userName}</span>
                                <span><i class="fa fa-hourglass-half me-1" aria-hidden="true"></i>${a.createdDate}</span>                               
                            </small>
                        </div>
                        <hr class="mt-4"/>
                    </div>
                </c:forEach>
            </c:if>
        </c:forEach> 
    </c:if>
</div>

<!--add answer-->
<div class="modal fade" id="addAnswer" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Trả Lời</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div id="aAlert"></div>
            <div class="modal-body">
                <c:url value="/admin/answer-create" var="action_ans"/>
                <form:form onsubmit="return checkValueTextArea('aContent','aAlert')" method="post" action="${action_ans}" modelAttribute="answer">
                    <form:input type="hidden" path="notificationId" id="thongbao" name="notificationId"/>
                    <form:input type="hidden" path="questId" id="cauhoi" name="questId"/>
                    <div class="form-floating mb-4 was-validated">
                        <form:textarea class="form-control is-invalid" placeholder="Leave a comment here" id="aContent" path="content" name="content" style="height: 120px" required="true"/>
                        <label for="content">Nội dung câu trả lời</label>
                    </div>
                    <div>
                        <button type="button" class="btn btn-secondary me-4" data-bs-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary">Lưu Câu Trả Lời</button>
                    </div>
                </form:form>
            </div>

        </div>
    </div>
</div>

<script>
    function formData(notiId, questionId, noidung) {
        document.getElementById("thongbao").value=notiId;
        document.getElementById("cauhoi").value=questionId;   
        document.getElementById("exampleModalLabel").innerHTML+=" Cho Câu Hỏi: "+noidung;
    }
    
    function checkValueTextArea(id, alertId){
        let value = document.getElementById(id).value;
        if(value.length > 2000){
            document.getElementById(alertId).innerHTML=`<div class="alert alert-warning alert-dismissible fade show text-center me-1 ms-1" role="alert">
  <strong>Thông báo!</strong> Nội dung không vượt quá 2000 ký tự.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>`;
            return false;
        }
        return true;
    }
</script>