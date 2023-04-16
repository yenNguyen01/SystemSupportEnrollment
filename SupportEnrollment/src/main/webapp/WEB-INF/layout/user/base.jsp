<%-- 
    Document   : base
    Created on : Apr 10, 2023, 10:33:54 PM
    Author     : admin
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            <tiles:insertAttribute name="title" />
        </title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- Favicon -->
        <!--    <link href="/resources/contentUser/img/favicon.ico" rel="icon">
        
             Google Web Fonts 
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">
        
             Icon Font Stylesheet 
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        
             Libraries Stylesheet 
            <link href="resources/contentUser/lib/animate/animate.min.css" rel="stylesheet">
            <link href="resources/contentUser/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        
             Customized Bootstrap Stylesheet 
            <link href="resources/contentUser/css/bootstrap.min.css" rel="stylesheet">
        
             Template Stylesheet 
            <link href="resources/contentUser/css/style.css" rel="stylesheet">-->
    </head>
    <body>
        <tiles:insertAttribute name="header" />
        <div class="container" id="content">
            <tiles:insertAttribute name="content" />
        </div>
        <tiles:insertAttribute name="footer" />
    </body>
</html>
