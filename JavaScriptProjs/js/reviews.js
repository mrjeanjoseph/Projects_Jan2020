// In memory data object

const reviews = [
    {
        id: 1,
        name: "Veleenah Jean-Joseph",
        job: "District Attoney",
        img: "https://images.unsplash.com/photo-1607453998774-d533f65dac99?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8a2lkc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        review: 
        "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quam nam similique ab inventore, ullam iste. Et voluptatibus maxime hic, unde aspernatur incidunt consequuntur tempora vel repudiandae est accusamus id asperiores."
    },{
        id: 2,
        name: "Casteeleaux Jean-Joseph",
        job: "Astronomers",
        img: "https://media.istockphoto.com/photos/group-of-children-smiling-and-looking-at-the-camera-diversity-picture-id1270473756?s=612x612",
        review: 
        "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quam nam similique ab inventore, ullam iste. Et voluptatibus maxime hic, unde aspernatur incidunt consequuntur tempora vel repudiandae est accusamus id asperiores."
    },{
        id: 3,
        name: "Devereaux Jean-Joseph",
        job: "Cheif Information Officer",
        img: "https://images.unsplash.com/photo-1519238263530-99bdd11df2ea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjV8fGtpZHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
        review: 
        "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quam nam similique ab inventore, ullam iste. Et voluptatibus maxime hic, unde aspernatur incidunt consequuntur tempora vel repudiandae est accusamus id asperiores."
    },{
        id: 4,
        name: "Louna Jean-Joseph",
        job: "Finance Director",
        img: "https://images.unsplash.com/photo-1620592465797-41051bda5733?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Njd8fGtpZHN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        review: 
        "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quam nam similique ab inventore, ullam iste. Et voluptatibus maxime hic, unde aspernatur incidunt consequuntur tempora vel repudiandae est accusamus id asperiores."
    },{
        id: 5,
        name: "Denzel Jean-Joseph",
        job: "US Senator",
        img: "https://images.unsplash.com/photo-1605338655673-a82078d64ed5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzF8fGtpZHN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        review: 
        "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quam nam similique ab inventore, ullam iste. Et voluptatibus maxime hic, unde aspernatur incidunt consequuntur tempora vel repudiandae est accusamus id asperiores."
    }
]

const img = document.getElementById("person-img");
const author = document.getElementById("author");
const job = document.getElementById("job");
const info = document.getElementById("info");

const prevBtn = document.querySelector(".prev-btn");
const nextBtn = document.querySelector(".next-btn");
const randomBtn = document.querySelector(".random-btn");

//set starting item
let currentItem = 0;

//load initial item
window.addEventListener("DOMContentLoaded", function() {
    showPerson(currentItem);
});

//show person based on item
function showPerson(person){
        /*console.log("Shake shake shake");    
    I could have done it this way.
    img.src = reviews[currentItem].img;
    */
    const item = reviews[person];
    img.src = item.img;
    author.textContent = item.name;
    job.textContent = item.job;
    info.textContent= item.review;
}

nextBtn.addEventListener('click', function(){
    currentItem++;
    if(currentItem > reviews.length-1){
        currentItem = 0;
    }
    showPerson(currentItem);
});

prevBtn.addEventListener('click', function(){
    currentItem--;
    if(currentItem < 0){
        currentItem = reviews.length - 1;
    }
    showPerson(currentItem);
});

randomBtn.addEventListener('click', function() {
    currentItem = Math.floor(Math.random() * reviews.length);
    //console.log(currentItem);
    showPerson(currentItem);
})