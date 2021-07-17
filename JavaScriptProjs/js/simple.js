const colors = ["red", "orange", "yellow", "green", "blue", "rgba(0, 17, 255)", "#750eb5"];

const btn = document.getElementById("btn");
const color = document.querySelector(".color");

btn.addEventListener('click', function() {
    //getting a random number between 0 - lenght of array
    const randomNumber = getRandomNumber();
    console.log(randomNumber)
    document.body.style.backgroundColor = colors[randomNumber];
    color.textContent = colors[randomNumber ];
    });

function getRandomNumber(){
    return Math.floor(Math.random() * colors.length);
}