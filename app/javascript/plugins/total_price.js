const calculateTotalPrice = () => {
  const dailyPrice = document.getElementById("daily-price")
  const startDate = (flatpickr("#reservation_start_date", {})).selectedDates[0];
  const endDate = (flatpickr("#reservation_end_date", {})).selectedDates[0];
  // const startDate = document.getElementById("reservation_start_date")
  // const endDate = document.getElementById("reservation_end_date")
  const totalPrice = document.getElementById("total-price")

  const totalDays = parseInt(endDate) - parseInt(startDate)
  totalPrice.innerText = totalDays * parseInt(dailyPrice.innerText)
};

// const changeAutomaticallyEndDate = () => {
  // const startDate = (flatpickr("#reservation_start_date", {})).selectedDates[0];
  // const endDate = (flatpickr("#reservation_end_date", {})).selectedDates[0];

  // if (parseInt(startDate.value) > parseInt(endDate.value)) {
  //   endDate.selectedIndex = parseInt(startDate.selectedIndex) + 1
  // }

//   calculateTotalPrice();
// };

const initTotalPrice = () => {
  const dailyPrice = document.getElementById("daily-price")
  if (!dailyPrice) return;

  const startDate = document.getElementById("reservation_start_date")
  const endDate = document.getElementById("reservation_end_date")
  // const startDate = (flatpickr("#reservation_start_date", {})).selectedDates[0];
  // const endDate = (flatpickr("#reservation_end_date", {})).selectedDates[0];

  startDate.addEventListener("change", calculateTotalPrice)
  // startDate.addEventListener("change", changeAutomaticallyEndDate)
  // endDate.addEventListener("change", changeAutomaticallyEndDate)
  endDate.addEventListener("change", calculateTotalPrice)
};

export {
  initTotalPrice
}
