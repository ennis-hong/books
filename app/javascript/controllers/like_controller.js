import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="like"
export default class extends Controller {
  connect() {
    // console.log("123");
  }
  toggle(e) {
    e.preventDefault();
    console.log("click liked");
  }
}
