<%-- 
    Document   : chat-realtime
    Created on : May 2, 2023, 1:48:03 PM
    Author     : Computer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script type="module" src="<c:url value="/contentUser/js/chat.js"/>"></script>

<form>
    <input type="text" id="name" autocomplete="off"/>
    <input id="message" placeholder="Nhập tin nhắn. . ." autocomplete="off" class="form-control"/>
    <input id="submit" type="submit"/>
</form>
