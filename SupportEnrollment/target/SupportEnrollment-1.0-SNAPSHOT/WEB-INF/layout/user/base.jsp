<%-- 
    Document   : base
    Created on : Apr 10, 2023, 10:33:54 PM
    Author     : admin
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            <tiles:insertAttribute name="title" />
        </title>
        <link href="<c:url value="/resources/contentUser/img/favicon.ico"/>" rel="icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">

        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <link href="<c:url value="resources/contentUser/lib/animate/animate.min.css"/>" rel="stylesheet">
        <link href="<c:url value="resources/contentUser/lib/owlcarousel/assets/owl.carousel.min.css"/>" rel="stylesheet">

        <link href="<c:url value="resources/contentUser/css/bootstrap.min.css"/>" rel="stylesheet">

        <link href="<c:url value="resources/contentUser/css/style.css"/> " rel="stylesheet">
    </head>
    <body>
        <tiles:insertAttribute name="header" />
        <div class="container" id="content">
            <tiles:insertAttribute name="content" />
        </div>
        <tiles:insertAttribute name="footer" />
    </body>
</html>
