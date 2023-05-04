function checkValue() {
    let sco = document.getElementById("score").value;
    let ghichu = document.getElementById("note").value;

    if (!Number(sco))
    {
        document.getElementById("thongbao").innerHTML = `<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Thông báo!</strong> Trường điểm không chứa ký tự chữ cái hoặc một vài ký tự đặc biệt.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>`;
        return false;
    }
    if (Number(sco) < 0) {
        document.getElementById("thongbao").innerHTML = `<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Thông báo!</strong> Trường điểm không phải số âm.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>`;
        return false;
    }

    if (ghichu.length > 500) {
        document.getElementById("thongbao").innerHTML = `<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Thông báo!</strong> Ghi chú không vượt quá 500 ký tự.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>`;
        return false;
    }

    return true;
}

