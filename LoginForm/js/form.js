// validate user login

function autenticate() {
    
    var username = document.getElementById("username").value;
    var enterpass = document.getElementById("enterpass").value;
    var reenterpass = document.getElementById("reenterpass").value;
    var btn = document.getElementById("myBtn");
    var mDP = document.getElementById("myDropdown");

    var text;
    if (username == "user"&& enterpass == "pass"&& reenterpass == "pass") {
        
            mDP.style.display = "block";
          
    }
    else {
        text = "Invalid username and password. Please try again";      
    }
    document.getElementById("demo").innerHTML = text;
    document.getElementById("demo").style.color = "red";

}