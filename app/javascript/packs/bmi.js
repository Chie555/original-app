window.addEventListener('load', () => {
  const heightInput = document.getElementById("user-height");
  heightInput.addEventListener("input", () => {
    const weight = document.getElementById('user-weight').value;
    const height = document.getElementById('user-height').value;
    const nowbmiDom = document.getElementById('now-bmi');
    nowbmiDom.innerHTML = (Math.floor(weight / ((height / 1000) * (height / 1000))) / 100).toFixed(1)
    })

  const bmiInput = document.getElementById("target-bmi");
  bmiInput.addEventListener("input", () => {
    const inputValue = bmiInput.value;
    const bmiDom = document.getElementById("tentative-weight");
    const height = document.getElementById('user-height').value;
    bmiDom.innerHTML = (Math.floor(inputValue * (height / 10) * (height / 10)) / 100).toFixed(1)
    })
});