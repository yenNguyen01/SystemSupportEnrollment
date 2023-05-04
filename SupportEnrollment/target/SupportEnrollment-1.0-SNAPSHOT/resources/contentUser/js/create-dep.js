function checkValue(){
    let ten = document.getElementById("dname").value;
    let mota = document.getElementById("ddescription").value;
    let web = document.getElementById("dwebsite").value;
    let video = document.getElementById("dembedVideo").value;
    
    if(ten.length > 200){
        document.getElementById("thongbao").innerHTML=`<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Thông báo!</strong> Tên khoa không vượt quá 200 ký tự.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>`;
        return false;
    }
    
    if(mota.length > 5000){
        document.getElementById("thongbao").innerHTML=`<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Thông báo!</strong> Mô tả khoa không vượt quá 5000 ký tự.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>`;
        return false;
    }
    
    if(web.length > 200){
        document.getElementById("thongbao").innerHTML=`<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Thông báo!</strong> Link Website khoa không vượt quá 200 ký tự.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>`;
        return false;
    }
    
    if(video.length > 200){
        document.getElementById("thongbao").innerHTML=`<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Thông báo!</strong> Link video giới thiệu khoa không vượt quá 200 ký tự.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>`;
        return false;
    }
    
    var regex = /(http|https):\/\/(\w+:{0,1}\w*)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%!\-\/]))?/;
    if((web.length > 0 && !regex.test(web)) || (video.length > 0 && !regex.test(video))){
        document.getElementById("thongbao").innerHTML=`<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Thông báo!</strong> Link video giới thiệu khoa hoặc Link website của khoa không đúng định dạng. Ví dụ: https://ou.edu.vn/
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>`;
        return false;
    }
    
    return true;
}

