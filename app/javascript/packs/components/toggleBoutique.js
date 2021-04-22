const toggleBoutique = () => {
  const dropdown = document.getElementById('dropdown-boutique')
  if (dropdown) {
    const boutiqueBtn = document.getElementById('boutique-btn')
    const modalBackground = document.querySelector(".modal-background")


    const toggleDropdown = () => {
      if (dropdown.style.display === 'grid'){
        dropdown.style.display = 'none'
        modalBackground.style.visibility = 'hidden'
        modalBackground.style.opacity = '0'
      } else {
        dropdown.style.display = 'grid'
        modalBackground.style.visibility = 'visible'
        modalBackground.style.opacity = '1'
      }
    }

    boutiqueBtn.addEventListener('click', event => {
      toggleDropdown();
    })

    window.onclick = (event) => {
      if (event.target == modalBackground) {
        dropdown.style.display = 'none'
        modalBackground.style.opacity = "0";
        modalBackground.style.visibility = "hidden" 
      }
    }

  } 
}

export { toggleBoutique }