function autenticate()
{
    var username=document.getElementById("username").value;
    var enterpass=document.getElementById("enterpass").value;
    var reenterpass=document.getElementById("reenterpass").value;

    if(username=="user"&& enterpass=="password"&& reenterpass=="password"){
        alert("login successful!");
        return false;
    }
    else{
        alert("login failed!");
    }
}