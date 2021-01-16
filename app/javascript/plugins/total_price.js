const calculateTotalPrice = () => {
  const dailyPrice = document.getElementById("daily-price")
  const startDate = document.getElementById("reservation_start_date_3i")
  const endDate = document.getElementById("reservation_end_date_3i")
  const totalPrice = document.getElementById("total-price")

  const totalDays = parseInt(endDate.value) - parseInt(startDate.value)
  totalPrice.innerText = totalDays * parseInt(dailyPrice.innerText)
};

const changeAutomaticallyEndDate = () => {
  const startDate = document.getElementById("reservation_start_date_3i")
  const endDate = document.getElementById("reservation_end_date_3i")

  if (parseInt(startDate.value) > parseInt(endDate.value)) {
    endDate.selectedIndex = parseInt(startDate.selectedIndex) + 1
  }

  calculateTotalPrice();
};

const initTotalPrice = () => {
  const dailyPrice = document.getElementById("daily-price")
  if (!dailyPrice) return;

  const startDate = document.getElementById("reservation_start_date_3i")
  const endDate = document.getElementById("reservation_end_date_3i")

  startDate.addEventListener("change", calculateTotalPrice)
  startDate.addEventListener("change", changeAutomaticallyEndDate)
  endDate.addEventListener("change", changeAutomaticallyEndDate)
  endDate.addEventListener("change", calculateTotalPrice)
};

export {
  initTotalPrice
}
