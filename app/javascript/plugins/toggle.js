
const toggler = () => {
  let first = document.querySelector("ul")
  console.log(first)
  let tooltip = document.getElementsByClassName('.symp')
  console.log(tooltip)
  tooltip.forEach((element) =>{
    element.addEventListener("click", event=>{
      let text = document.querySelector('.tooltiptext');
      if (text.style.display === "none") {
        text.style.display = "block";
      } else {
        text.style.display = "none";
      }
    });
  })

}

export default toggler
