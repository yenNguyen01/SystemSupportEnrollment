//// Import the functions you need from the SDKs you need
//import { initializeApp } from "https://www.gstatic.com/firebasejs/9.21.0/firebase-app.js";
//import {getDatabase, set, ref, push, child, onValue} from "https://www.gstatic.com/firebasejs/9.21.0/firebase-database.js"
//        // TODO: Add SDKs for Firebase products that you want to use
//        // https://firebase.google.com/docs/web/setup#available-libraries
//
//        // Your web app's Firebase configuration
//        // For Firebase JS SDK v7.20.0 and later, measurementId is optional
//        const firebaseConfig = {
//            apiKey: "AIzaSyCik_tq9ibvgLyACEc2nXWfGcEUboGyjjM",
//            authDomain: "test-enrollment-project.firebaseapp.com",
//            databaseURL: "https://test-enrollment-project-default-rtdb.asia-southeast1.firebasedatabase.app",
//            projectId: "test-enrollment-project",
//            storageBucket: "test-enrollment-project.appspot.com",
//            messagingSenderId: "659307355199",
//            appId: "1:659307355199:web:b79f563687bc7b4e88ac8a",
//            measurementId: "G-L5XP8D3DDK"
//        };
//
//// Initialize Firebase
////firebase.initializeApp(firebaseConfig);
////const db = firebase.database();
//const app = initializeApp(firebaseConfig);
//const database = getDatabase(app);
//const username = prompt("Please Tell Us Your Name");
//
//function sendMessage(e) {
//    e.preventDefault();
//
//    // get values to be submitted
//    const timestamp = Date.now();
//    const messageInput = document.getElementById("message-input");
//    const message = messageInput.value;
//    // clear the input box
//    messageInput.value = "";
//
//    //auto scroll to bottom
//    document
//            .getElementById("messages")
//            .scrollIntoView({behavior: "smooth", block: "end", inline: "nearest"});
//
//    // create db collection and send in the data
//    const db = getDatabase();
//    set(ref(db, 'users/' + timestamp), {
//        name: username,
//        message: message
//    });
//    
////    db.ref("messages/" + timestamp).set({
////        name: username,
////        content: message
////    });
//}
//
////const fetchChat = db.ref("messages/");
////
////fetchChat.on("child_added", function (snapshot) {
////    const messages = snapshot.val();
////    const message = `<li class=${
////            username === messages.username ? "sent" : "receive"
////            }><span>${messages.username}: </span>${messages.message}</li>`;
////    // append the message on the page
////    document.getElementById("messages").innerHTML += message;
////});
//
//
