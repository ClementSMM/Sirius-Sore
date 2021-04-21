

const dynamicPrice = () => {
  const price = document.getElementById('product-price')

  if (price){
    // On récupère l'endoit où la taille est choisie
    const sizeValue = document.getElementById('order_item_size')

  
    const priceDisplay = () => {
      // on récupère touuus les prix et les infos des produits, et on le met dans un object (hash)
      const pricesOfSizes = JSON.parse(price.dataset.prices)
      let priceToDisplay = ''
      // on compare chaque ligne de l'object avec la valeur selectionnée. Si c'est la même alors bingo :) 
      pricesOfSizes.map(el => {
        if (el["size"] === sizeValue.value){
          priceToDisplay = el["price_cents"]/100
        }
      })
      // a un endroit bien spécifique, on injecte la valeur 
      price.textContent = priceToDisplay
    }

    // on lance la fonction quand on arrive sur la page et à chaque fois que l'on change la valeur 
    priceDisplay()
    sizeValue.addEventListener("change", event => {
      priceDisplay()
    })
    }



}

export { dynamicPrice }