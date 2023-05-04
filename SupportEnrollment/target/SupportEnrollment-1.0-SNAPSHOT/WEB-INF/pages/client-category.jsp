<%-- 
    Document   : client-category
    Created on : May 4, 2023, 6:37:26 AM
    Author     : Computer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<h1 class="text-center text-success">${cate.name}</h1>
<div class="row">
    <c:forEach items="${pagination.getPage()}" var="p">
    <div class="col-lg-6 col-md-12 mb-lg-4 mb-4 mt-5">
          <div class="view overlay rounded z-depth-1">
              <c:if test="${p.image != null}">
                  <img src="${p.image}" class="img-fluid" width="400px">
              </c:if>
              <c:if test="${p.image == null}"> 
                  <img src="https://tuyensinh.ou.edu.vn/tmp/rscache/350x183-no_picture.png" class="img-fluid" width="400px">
              </c:if>
            <a href="" title="${p.title}">
              <div class="mask rgba-white-slight waves-effect waves-light"></div>
            </a>
          </div>
          <!--Excerpt-->
          <div class="card-body pb-0 cat-post-item" style="height: 100px;">
            <div class="news-data d-flex justify-content-between">
                <p class="dark-grey-text small"><i class="far fa-clock pr-1"></i>${p.createDate}</p>
            </div>
                <a href="<c:url value="/posts/${p.id}"/>" title="${p.title}">
                <h5 style="width: 450px" class="font-weight-bold dark-grey-text mb-3 m-primary-text">${p.title}</h5>
            </a>
          </div>
      </div>
    </c:forEach>
    <ul class="pagination pagination-lg">
        <c:if test="${pagination.hasPreviousPage()}">
        <li class="page-item"><a class="page-link" href="<c:url value="?pageNo=${pagination.getPreviousPage().getPageNo()}"/>">Previous</a></li>
        </c:if>
        <c:forEach begin="1" end="${pagination.getTotalPages()}" var="page">
        <li class="${page == pagination.getPageNo() ? 'page-item active' : 'page-item'}"><a class="page-link" href="<c:url value="?pageNo=${page}&amp;pageSize=${pagination.getPageSize()}"/>">${page}</a>
        </c:forEach>
        <c:if test="${pagination.hasNextPage()}">
        <li class="page-item"><a class="page-link" href="<c:url value="?pageNo=${pagination.getNextPage().getPageNo()}"/>">Next</a></li>
        </c:if>
<!--    <li class="page-item"><a class="page-link" href="<c:url value="?pageNo=${pagination.getTotalPages()}"/>">Last</a></li>-->
</ul>
</div>
