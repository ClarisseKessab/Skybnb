import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["dateRange", "startDate", "endDate"]

  connect() {
    this.flatpickr = flatpickr(this.dateRangeTarget, {
      mode: "range",
      minDate: "today",
      dateFormat: "Y-m-d",
      onChange: (selectedDates) => {
        this.updateHiddenFields(selectedDates);
      }
    });
  }

  updateHiddenFields(selectedDates) {
    const startDate = selectedDates[0];
    const endDate = selectedDates[1];

    if (startDate) {
      this.startDateTarget.value = this.flatpickr.formatDate(startDate, "Y-m-d");
    }
    if (endDate) {
      this.endDateTarget.value = this.flatpickr.formatDate(endDate, "Y-m-d");
    }
  }

  disconnect() {
    if (this.flatpickr) {
      this.flatpickr.destroy();
    }
  }
}
