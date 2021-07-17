//classList - shows/gets all classes
//contains - checks classList for specific class
//add - add class
//remove - remove class
//toggle - toggles class

const navToggle = document.querySelector(".nav-toggle");
const links = document.querySelector(".links");

navToggle.addEventListener("click", function() {
    /*console.log(links.classList );
    console.log(links.classList.contains("random")); // return false
    console.log(links.classList.contains("links")); // return true*/

    // if(links.classList.contains("show-links")){
    //     links.classList.remove("show-links");
    // }else{
    //     links.classList.add("show-links");
    // }
    // This one liner can be resolved using this one liner.
    links.classList.toggle("show-links");
});

