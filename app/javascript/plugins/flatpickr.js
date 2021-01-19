import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

// flatpickr(".datepicker", {
//   altInput: true
// });

flatpickr("#reservation_start_date", {
  altInput: true,
  plugins: [new rangePlugin({ input: "#reservation_end_date"})]
});
