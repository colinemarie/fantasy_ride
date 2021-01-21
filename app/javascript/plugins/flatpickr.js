import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

flatpickr("#reservation_start_date", {
  plugins: [new rangePlugin({ input: "#reservation_end_date"})],
  minDate: new Date().fp_incr(1),
  dateFormat: "d-m-Y",
  disable: ["28-01-2021"],
  locale: {
  "firstDayOfWeek": 1 // start week on Monday
    },
});


export {
  flatpickr
}
