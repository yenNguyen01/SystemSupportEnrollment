function deleteDepartment(endpoint) {
    if (confirm("Bạn thực sự muốn xóa thông tin khoa này")) {
        fetch(endpoint, {
            method: "delete"
        }).then(res => {
            console.info(res);
            if (res.status === 204) {
                alert("Xóa Thành Công");
                window.location.reload();
            } else {
                document.getElementById("noti").innerHTML = `<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Thông báo!</strong> Xóa thất bại.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>`
            }
        });
    }
}


