const toggleMobileNavbar = () => {
  const menu = document.getElementById('side-menu')

  if (menu) {
    const burger = document.querySelector('#nav-menu')
    const arrow = document.querySelector('#nav-menu-open')

    burger.addEventListener("click", (e) => {
      burger.style.display = 'none'
      arrow.style.display = 'inline'
      menu.style.transform = "translateX(0)"
    })
  
    arrow.addEventListener('click', (e) => {
      arrow.style.display = 'none'
      burger.style.display = 'inline'
      menu.style.transform = "translateX(-100vh)"
    })
  }
}

export { toggleMobileNavbar }