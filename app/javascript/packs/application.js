// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'

// window.$ = window.jQuery = require('jquery');
require("./slick")

Rails.start()
// Turbolinks.start()
ActiveStorage.start()

/*global jQuery */
/*global $*/
jQuery(document).on("turbolinks:load", function() {
  $('#user_postcode').jpostal({
    postcode : [
      // 取得する郵便番号のテキストボックスをidで指定
      '#user_postcode'
    ],
    address: {
      // %3 => 都道府県、 %4 => 市区町村 %5 => 町域 %6 => 番地 %7 => 名称
      // それぞれを表示するコントロールをidで指定
      "#user_prefecture_code"  : "%3",
      "#user_address_city"   : "%4%5",
      "#user_address_street" : "%6%7"
    }
  });
});

$(function () {
  $(window).scroll(function () {
    const windowHeight = $(window).height();
    const scroll = $(window).scrollTop();

    $('.element').each(function () {
      const targetPosition = $(this).offset().top;
      if (scroll > targetPosition - windowHeight + 100) {
        $(this).addClass("is-fadein");
      }
    });
  });
});

$(function(){
  $('a[href*="#"]').click(function(){
    var href= $(this).attr("href");
    var header = $('header').height();
    var target = $(href == "#" || href == "" ? 'html' : href);
    var position = target.offset().top-header;
    $("html, body").animate({scrollTop:position}, 500, "swing");
    return false;
  });
});
