const carouselHome = (carouselImgs) => {
  const slides = document.getElementsByClassName(carouselImgs)
  console.log(slides)

  if (slides.length !== 0){
    let currentSlide = 1;

  function showSlide(slideIndex) {
    // CHANGE SLIDE
    if (slideIndex > slides.length) { currentSlide = 1 }
    if (slideIndex < 1) { currentSlide = slides.length }
    for (var i = 0; i < slides.length; i++) {
      slides[i].style.display = 'none'
    }
    slides[currentSlide - 1].style.display = 'flex'
  }


  
  function nextSlide() {
    showSlide(currentSlide += 1);
  }
  
  function previousSlide() {
    showSlide(currentSlide -= 1);
  }

  
  showSlide(currentSlide);

  const interval = setInterval(function() {
    nextSlide()
  }, 3000);


  }



}

export  {carouselHome}

