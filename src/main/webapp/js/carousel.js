const slides1 = document.querySelectorAll('.slide');
const slides2 = document.querySelectorAll('.slideText');
let currentSlide1 = 0;
let currentSlide2 = 0;

function showSlide1(n) {
    slides1[currentSlide1].style.opacity = 0;
    currentSlide1 = (n + slides1.length) % slides1.length;
    slides1[currentSlide1].style.opacity = 1;
}

function showSlide2(n) {
    slides2[currentSlide2].style.opacity = 0;
    currentSlide2 = (n + slides2.length) % slides2.length;
    slides2[currentSlide2].style.opacity = 1;
}

function nextSlide() {
    showSlide1(currentSlide1 + 1);
    showSlide2(currentSlide2 + 1);
}

// Iniciar o carrossel
showSlide1(currentSlide1);
showSlide2(currentSlide2);

// Trocar automaticamente as imagens a cada 5 segundos (5000 ms)
setInterval(nextSlide, 5000);
