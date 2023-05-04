function showSpinner(status) {
    let spinners = document.getElementsByClassName("spinner");
    for (let s of spinners)
        s.style.display = status;
} 

function addComment(endpoint) {
    showSpinner("block")
    fetch(endpoint, {
        method: "POST",
        body: JSON.stringify({
            "content": document.getElementById("comment-content").value
        }), 
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json'
        }
    }).then(res => res.json()).then(c => {
        showSpinner("none")
        console.log(res);
//        let d = document.getElementById("comments");
//        d.innerHTML = `
//              <div class="row bg-light m-1">
//                    <div class="col-md-1 col-xs-3">
//                        <h5> ${c.userId.name}</h5>
//                    </div>
//                    <div class="col-md-10 col-xs-9">
//                        <p>${c.content}</p>
//                        <small>
//                            Bình luận bởi <a href="#">${c.userId.userName}</a> luc ${moment(c.createdDate).locale("vi").fromNow()}
//                        </small>
//                    </div>
//                </div>
//            ` + d.innerHTML;
    });
}
