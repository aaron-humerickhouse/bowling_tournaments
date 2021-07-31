// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

function toggleMenu() {
  const burger = $("#navbar-burger")

  if (burger.hasClass('is-active')) {
    burger.removeClass('is-active')
    $('#navbar').removeClass('is-active')
  } else {
    burger.addClass('is-active')
    $('#navbar').addClass('is-active')
  }
}

document.addEventListener('turbolinks:load', () => {
  const clickButton = document.getElementById("navbar-burger");
  clickButton.addEventListener('click', (event) => {
    toggleMenu()
  });
});
