function checkValue(){
        let tieude = document.getElementById("title").value;
        let noidung = document.getElementById("content").value;
        let thoigianbatdau = Date.parse(document.getElementById("startCalendar").value);
        let thoigianketthuc = Date.parse(document.getElementById("endCalendar").value);
        
        
        if(tieude.length > 200){
            document.getElementById("thongbao").innerHTML=`<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Thông báo!</strong> Tiêu đề không vượt quá 200 ký tự.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>`;
            window.scrollTo(0,0);
            return false;
        }
        
        if(noidung.length > 2000){
            document.getElementById("thongbao").innerHTML=`<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Thông báo!</strong> Nội dung không vượt quá 2000 ký tự.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>`;
            window.scrollTo(0,0);
            return false;
        }
        
        if(thoigianbatdau < new Date()){
            document.getElementById("thongbao").innerHTML=`<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Thông báo!</strong> Thời gian bắt đầu phải sau thời gian hiện tại.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>`;
            window.scrollTo(0,0);
            return false;
        }
        
        if(thoigianketthuc !== null && thoigianketthuc <= thoigianbatdau){
            document.getElementById("thongbao").innerHTML=`<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Thông báo!</strong> Thời gian kết thúc phải sau thời gian bắt đầu.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>`;
            window.scrollTo(0,0);
            return false;
        }
        return true;
    }

