import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";


// const initFlatpickr = () => {
  // const unavailableDates = JSON.parse(document.querySelector('#vehicle-booking-dates').dataset.unavailable);
  flatpickr("#reservation_start_date", {
    plugins: [new rangePlugin({ input: "#reservation_end_date"})],
    minDate: new Date().fp_incr(1),
    dateFormat: "d-m-Y",
    // disable: unavailableDates,
    locale: {
    "firstDayOfWeek": 1 // start week on Monday
      },
    onChange: function(selectDates){
      const dailyPrice = document.getElementById("daily-price")
      const totalPrice = document.getElementById("total-price")
      const totalDays = (selectDates[1] - selectDates[0] + 86400000) / 86400000
      totalPrice.innerText = totalDays * parseInt(dailyPrice.innerText)
    }
  });
// }



// export {
//   initFlatpickr
// }



