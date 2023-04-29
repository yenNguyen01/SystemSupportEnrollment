let id = document.getElementById("idMajor");
let name = document.getElementById("nameMajor");
let code = document.getElementById("codeMajor");
let departmentId = document.getElementById("depIdMajor");
function formData(ma, n, c, depId) {
    id.value = ma;
    name.value = n;
    code.value = c;
    departmentId.value = depId;
}

function updateMajor(endpoint) {
    endpoint = endpoint + String(id.value);
    fetch(endpoint, {
        method: "put",
        body: JSON.stringify({
            id: Number(id.value),
            name: String(name.value),
            code: String(code.value),
            departId: Number(departmentId.value)
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

function loadData() {
    document.getElementById("noti").innerHTML = ``;
    window.location.reload();
}

function deleteMajor(endpoint, id) {
    if (confirm("Bạn thực sự muốn xóa ngành này?")) {
        fetch(endpoint, {
            method: "delete"
        }).then(res => {
            let dnoti = document.getElementById("dNoti");
            if (res.status === 204) {
                document.getElementById(`major${id}`).style.display = "none";
                window.scrollTo(0, 0);
                dnoti.innerHTML = `<div class="alert alert-success alert-dismissible">
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    <strong>Thông báo!</strong> Xóa bản ghi thành công.
  </div>`;

            } else {
                window.scrollTo(0, 0);
                dnoti.innerHTML = `<div class="alert alert-warning alert-dismissible">
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    <strong>Thông báo!</strong> Xóa bản ghi thất bại.
  </div>`;
            }

        });
    }

}




