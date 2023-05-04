<%-- 
    Document   : statsUser
    Created on : May 2, 2023, 9:41:14 AM
    Author     : Computer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<c:url value="/contentUser/css/stats.css"/>"/>

<h3 class="text-center mt-5 mb-5 text-uppercase">${alert}</h3>
<form class="row g-3 text-secondary">
    <div class="col-md-6">
        <label for="from" class="form-label">Ngày bắt đầu</label>
        <input type="datetime-local" class="form-control" id="from" name="from">
    </div>
    <div class="col-md-6">
        <label for="to" class="form-label">Ngày kết thúc</label>
        <input type="datetime-local" class="form-control" id="to" name="to">
    </div>
    <div class="col-md-6">
        <button type="submit" class="btn btn-primary w-75 fw-bold">Lọc</button>
    </div>
    <div class="col-md-6">
        <button onclick="refresh()" type="button" class="btn btn-warning text-light w-75 fw-bold">Reset</button>
    </div>
</form>
<!--<div class="col-md-4">
    <label for="type" class="form-label">Loại Biểu Đồ</label>
    <select id="type" class="form-select">
        <option selected>Choose...</option>
        <option>...</option>
    </select>
</div>-->
<div class="row">
    <div class="col-md-5 col-5">
        <table class="table">
            <thead>
                <tr>
                    <th>Tháng</th>
                    <th>Số lượng</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${stats}" var="c">
                    <tr>
                        <td>${c[0]}</td>
                        <td>${c[1]}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="col-md-7 col-7">
        <canvas id="myChart"></canvas>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    function drawChart(type = 'bar', label, data, title) {
        const ctx = document.getElementById('myChart');

        new Chart(ctx, {
            type: type,
            data: {
                labels: label,
                datasets: [{
                        label: title,
                        data: data,
                        borderWidth: 1
                    }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true,
                    }
                }
            }
        });

    }

    window.onload = function () {
        let title = '${alert}';
        let data = [], label = [];

    <c:forEach items="${stats}" var="s">
        label.push('Tháng ' + '${s[0]}');
        data.push(${s[1]});
    </c:forEach>
        drawChart('bar', label, data, title);
    }

    function refresh(){
        window.location.href="/SupportEnrollment/admin/stats";
    }
</script>
