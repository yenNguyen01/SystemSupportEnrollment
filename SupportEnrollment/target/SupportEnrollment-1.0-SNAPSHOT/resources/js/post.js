/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function deletePost(endpoint, id) {
    if (confirm("Bạn chắc chắn xóa không?") === true) {
        fetch(endpoint, {
            method: 'delete'
        }).then(res => {
            if (res.status === 204) {
                document.getElementById(`post${id}`).style.display = "none";
            } else
                alert("Hệ thống đang có lỗi!!!");
        });
    }
}

function displayModal() {
  $('#myModal').modal('show');
}


