<%-- 
    Document   : detailPost
    Created on : May 4, 2023, 6:38:13 AM
    Author     : Computer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="moment" uri="http://java.sun.com/jsp/jstl/fmt" %>
<br>
<br>
<c:url value="/posts/${post.id}" var="action"/>
<c:if test="${errMsg != null}">
    ${errMsg}
</c:if>
<div class="container">
    <div class="row">
            <div class="single-news mb-lg-0 mb-4">
                <h2 class="h2-responsive font-weight-bold mb-3 m-primary-text">${post.title}</h2>
            </div>
            <div>
                <textarea type="text" class="form-control" style="height: 500px">
                    ${post.content}</textarea>
            </div><br><br>
            <sec:authorize access="isAuthenticated()">
                <div>
                    <form:form method="post" action="${action}" modelAttribute="comment">
                        <form:textarea class="form-control" rows="3" name="content" id="content" path="content"></form:textarea>
                            <input type="submit"  value="Thêm bình luận" class="btn btn-danger m-1" />
                    </form:form>
                </div>
            </sec:authorize>
            <div class="spinner-grow text-primary spinner" style="display:none"></div>

            <c:forEach items="${comments}" var="c">
                
                <div id="comments">
                    <div class="row bg-light m-1">
                        <div class="row">
                            <c:if test="${c.userId.avatar != null}">
                                <div class="col-md-1">
                                    <img src="${c.userId.avatar}" class="rounded-circle" alt="Cinque Terre" width="50" height="40" /></div>
                                </c:if>
                            <div class="col-md-11"> 
                                <h5> ${c.userId.name}</h5>
                            </div><br><br>
                        </div>
                        <div class="col-md-10 col-xs-8">
                            <p>${c.content}</p>
                            <small>
                                Bình luận bởi <a href="#">${c.userId.userName}</a> lúc ${c.createDate}
                            </small>
                        </div>
                    </div>
                </div>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <c:url value="/posts/${post.id}/${c.id}" var="url"/>
                    <a href="${url}">Trả lời</a>
                    <div>
                        <form:form method="post" action="${url}" modelAttribute="reply">
                            <form:textarea class="form-control" rows="3" name="content" id="content" path="content"></form:textarea>
                                <input type="submit"  value="Đăng" class="btn btn-secondary" />
                        </form:form>
                    </div>
                </sec:authorize>
                <c:forEach items="${replys}" var="r">
                    <c:if test="${r.parentId.id == c.id}">
                    <div class="row bg-light m-1">
                        <div class="row">
                            <c:if test="${r.userId.avatar != null}">
                                <div class="col-md-1">
                                    <img src="${r.userId.avatar}" class="rounded-circle" alt="Cinque Terre" width="50" height="40" /></div>
                                </c:if>
                            <div class="col-md-11"> 
                                <h5> ${r.userId.name}</h5>
                            </div><br><br>
                        </div>
                        <div class="col-md-10 col-xs-8">
                            <p>${r.content}</p>
                            <small>
                                Trả lời bởi <a href="#">${r.userId.userName}</a> lúc ${c.createDate}
                            </small>
                        </div>
                    </div><br>
                    </c:if>
                </c:forEach>               
            </c:forEach>
    </div>
</div>
<br>
<br><br>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"></script>