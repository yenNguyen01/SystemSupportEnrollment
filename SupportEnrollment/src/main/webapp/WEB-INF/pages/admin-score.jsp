<%-- 
    Document   : admin-score
    Created on : Apr 27, 2023, 9:49:25 AM
    Author     : Computer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<c:url value="/contentUser/css/admin-score.css"/>"/>
<h2 class="text-center text-uppercase mt-4 mt-4" style="color:#1d559f">Thông tin điểm chuẩn</h2>
<form class="mt-4 mb-4" method="get" action="<c:url value="/admin/scores"/>">
    <div class="row filter-major">
        <div class="col-md-7 col-7">
            <select class="form-select mb-3 text-center" name="majorId" aria-label="Default select example">
                <option value="0" selected>Chọn ngành ---</option>
                <c:forEach items="${majors}" var="m">
                    <option value="${m.id}">${m.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="col-md-5 col-5">
            <button type="submit" class="btn btn-warning me-2 text-light fw-bold">Lọc</button>
            <button onclick="loadPageDefault()" type="button" class="btn btn-info text-light fw-bold">Reset</button>
        </div>
    </div>
</form>

<div id="dnoti"></div>

<div class="container-fluid btn-create mb-4">
    <a href="<c:url value="/admin/score/create"/>"><i class="fa fa-plus-square-o" aria-hidden="true"></i> Tạo mới</a>
</div>

<table class="table table-info table-striped table-hover">
    <thead>
        <tr>
            <th></th>
            <th>Năm</th>
            <th>Điểm</th>
            <th>Ngành</th>
            <th>Ngày khởi tạo</th>
        </tr>
    </thead>
    <tbody>
        <c:if test="${scores!=null}">
            <c:forEach items="${scores}" var="s">
                <tr id="score${s.id}">
                    <td>
                        <i onclick="formData(${s.id}, ${s.year}, ${s.score}, ${s.majorId.id}), '${s.note}'" 
                           class="fa fa-pencil-square me-1" aria-hidden="true" data-bs-toggle="modal" data-bs-target="#updModal"></i>
                        <c:url value="/api/score/delete/${s.id}" var="del"/>
                        <i onclick="deleteScore('${del}', ${s.id})" class="fa fa-minus-square" aria-hidden="true"></i>
                    </td>
                    <td>${s.year}</td>
                    <c:choose>
                        <c:when test="${s.score==0}">
                            <td>--/--</td>
                        </c:when>
                        <c:otherwise>
                            <td>${s.score}</td>
                        </c:otherwise>
                    </c:choose>
                    <td>${s.majorId.name}</td>
                    <td>${s.createDate}</td>
                </tr>
            </c:forEach>        
        </c:if>       
    </tbody>
</table>
<div>
    <p class="text-end">Trang ${page_now}/${total_page}</p>
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <c:forEach var="i" begin="1" step="1" end="${total_page}">
                <c:choose>
                    <c:when test="${majorid!=0}">
                        <li class="page-item"><a class="page-link" href="<c:url value="/admin/scores?majorId=${majorid}&&page=${i}"/>">${i}</a></li>
                        </c:when>
                        <c:otherwise>
                        <li class="page-item"><a class="page-link" href="<c:url value="/admin/scores?page=${i}"/>">${i}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>

</div>

<!--Modal Update-->
<div class="modal fade" id="updModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="container mt-3 mb-3" id="noti"></div>
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thông tin điểm chuẩn</h5>
                <button onclick="onLoadData()" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="id" hidden="hidden">
                    <label for="id" hidden="hidden">Mã</label>
                </div>
                <div class="form-floating mb-3">
                    <select class="form-select" id="year" aria-label="Floating label select example">
                        <c:forEach items="${years}" var="y">
                            <option value="${y}">Năm ${y}</option>
                        </c:forEach>                       
                    </select>
                    <label for="year">Năm thi</label>
                </div>
                <div class="form-floating mb-3">
                    <select class="form-select" id="majId" aria-label="Floating label select example">
                        <c:forEach items="${majors}" var="m">
                            <option value="${m.id}">Ngành ${m.name}</option>
                        </c:forEach>                       
                    </select>
                    <label for="majId">Ngành học</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="score" placeholder="Nhập điểm . . .">
                    <label for="score">Điểm</label>
                </div>
                <div class="form-floating mb-3">
                    <textarea type="text" class="form-control" id="note" style="height: 80px" 
                              placeholder="Nhập ghi chú . . ." ></textarea>
                    <label for="note">Ghi chú</label>
                </div>
            </div>
            <div class="modal-footer">
                <button onclick="onLoadData()" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <c:url value="/api/score/update/" var="upd_url"/>
                <button onclick="updateData('${upd_url}')" type="button" class="btn btn-primary">Lưu thay đổi</button>
            </div>
        </div>
    </div>
</div>


<script>
    let ma = document.getElementById("id");
    let nam = document.getElementById("year");
    let diem = document.getElementById("score");
    let ma_nganh = document.getElementById("majId");
    let ghi_chu = document.getElementById("note");
    function formData(id, year, score, majorId, note) {
        ma.value = id;
        nam.value = year;
        diem.value = score;
        ma_nganh.value = majorId;
        if (note != null)
            ghi_chu.value = note;
    }

    function updateData(endpoint) {
        endpoint = endpoint + ma.value;

        fetch(endpoint, {
            method: "put",
            body: JSON.stringify({
                id: ma.value,
                year: nam.value,
                score: diem.value,
                majId: ma_nganh.value
            }),
            headers: {
                'Content-type': 'application/json; charset=UTF-8',
            }
        }).then(res => {
            let noti = document.getElementById("noti");
            if (res.status === 200) {
                noti.innerHTML = `<div class="alert alert-info alert-dismissible fade show" role="alert">
  <strong>Thông báo!</strong> Sửa thông tin thành công.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>`;
            } else {
                noti.innerHTML = `<div class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong>Thông báo!</strong> Sửa thông tin thất bại.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>`;
            }
        });
    }

    function onLoadData() {
        window.location.reload();
    }

    function deleteScore(endpoint, id) {
        if (confirm("Bạn có chắc muốn xóa bản ghi này không?")) {
            fetch(endpoint, {
                method: "delete"
            }).then(res => {
                if (res.status === 204) {
                    document.getElementById("dnoti").innerHTML = `<div class="alert alert-info alert-dismissible fade show" role="alert">
  <strong>Thông báo!</strong> Xóa thông tin thành công.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>`;
                    document.getElementById(`score${id}`).style.display = "none";
                } else {
                    document.getElementById("dnoti").innerHTML = `<div class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong>Thông báo!</strong> Xóa thông tin thất bại.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>`;
                }
                window.scrollTo(0, 0);
            });
        }
    }

    function loadPageDefault() {
        window.location.href = '<c:url value="/admin/scores"/>';
    }
</script>

