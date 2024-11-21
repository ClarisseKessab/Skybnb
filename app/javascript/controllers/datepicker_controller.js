import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["dateRange", "startDate", "endDate", "nights", "pricePerNight", "totalPrice"]

  connect() {
    this.flatpickr = flatpickr(this.dateRangeTarget, {
      mode: "range",
      minDate: "today",
      dateFormat: "Y-m-d",
      // quand la valeur du champ date change, on met à jour les champs cachés
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
      // Quand on a la date de fin, on peut calculer le nombre de nuits, et le prix
      const nights = Math.round((endDate - startDate) / (1000 * 60 * 60 * 24));
      this.nightsTarget.textContent = nights;
      this.totalPriceTarget.textContent = nights * this.pricePerNightTarget.innerText;
    } else {
      // Si endDate n'est pas encore sélectionnée, on remet le nombre de nuits à 0
      this.nightsTarget.textContent = "0";
    }
  }

  disconnect() {
    if (this.flatpickr) {
      this.flatpickr.destroy();
    }
  }
}
