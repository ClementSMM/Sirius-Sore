const navHomePage = () => {
  const mainNav = document.querySelector('#navbar-home')

  if (mainNav){
    const tinyNav = document.querySelector('.small-home-navbar')
    mainNav.style.transform = "translateY(-100vh)"

    window.addEventListener('scroll', () => {
      if (window.scrollY <= 100){
        mainNav.style.transform = "translateY(-100vh)"

      } else {
        mainNav.style.transform = "translateY(0)"

      }
      });
  }

}

export { navHomePage }