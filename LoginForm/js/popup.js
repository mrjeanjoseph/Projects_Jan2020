
var dropdown = document.getElementById("myDropdown");

var btn = document.getElementById("myBtn");

var span =
document.getElementsByClassName("close")[0];

btn.onclick = function() {
    dropdown.style.display = "block";
}

span.onclick = function(){
    dropdown.style.display = "none";
}

window.onclick = function(event){
    if (event.target == dropdown) {
        dropdown.style.display = "none";
    }
}