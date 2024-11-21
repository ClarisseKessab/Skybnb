import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["dateRange", "startDate", "endDate"]

  connect() {
    this.flatpickr = flatpickr(this.dateRangeTarget, {
      mode: "range",
      dateFormat: "Y-m-d",
      onChange: this.updateHiddenFields.bind(this)
    });
  }

  updateHiddenFields(selectedDates) {
    const [startDate, endDate] = selectedDates;

    if (startDate) {
      this.startDateTarget.value = this.formatDate(startDate);
    }
    if (endDate) {
      this.endDateTarget.value = this.formatDate(endDate);
    }
  }

  formatDate(date) {
    const year = date.getFullYear();
    const month = ("0" + (date.getMonth() + 1)).slice(-2);
    const day = ("0" + date.getDate()).slice(-2);
    return `${year}-${month}-${day}`;
  }


  disconnect() {
    if (this.flatpickr) {
      this.flatpickr.destroy();
    }
  }
}
