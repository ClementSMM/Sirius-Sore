const carousel = (carouselImgs) => {
  const slides = document.getElementsByClassName(carouselImgs)

  if (slides.length !== 0){
    let currentSlide = 1;
    const imageDots = document.getElementsByClassName('image-dot')

  function showSlide(slideIndex) {
    // CHANGE SLIDE
    if (slideIndex > slides.length) { currentSlide = 1 }
    if (slideIndex < 1) { currentSlide = slides.length }
    for (var i = 0; i < slides.length; i++) {
      slides[i].style.display = 'none'
    }
    slides[currentSlide - 1].style.display = 'flex'
    fillDotHandler(imageDots, currentSlide)
  }

  function fillDotHandler (imageDots, id){
    Array.from(imageDots).forEach(imageDot => {
      imageDot.className = "far fa-circle image-dot"
    })
    imageDots[id-1].className = "fas fa-circle image-dot"
  }

  
  function nextSlide() {
    showSlide(currentSlide += 1);
  }
  
  function previousSlide() {
    showSlide(currentSlide -= 1);
  }

  
  showSlide(currentSlide);
  fillDotHandler(imageDots, 1)

  Array.from(imageDots).forEach(imageDot => {
    imageDot.addEventListener('click', () => {
      fillDotHandler(imageDots,imageDot.id )
      currentSlide = imageDot.id
      showSlide(imageDot.id)
    })
  });

  
  document.getElementById('prev'+carouselImgs).addEventListener('click', () => {
    previousSlide();
  })

  document.getElementById('next'+carouselImgs).addEventListener('click',  () => {
    nextSlide();
  })

  }



}

export  {carousel}

