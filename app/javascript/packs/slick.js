/* global $*/
$(function () {
  $(".sliders").slick({
    variableWidth: true,
    adaptiveHeight: true,
    centerMode: true,
    focusOnSelect: true,
    arrows: true,
    autoplay: true,
    autoplaySpeed: 2000,
    dots: true,
    infinite: true,
    // speed: 300,
    slidesToShow: 1,
    // adaptiveHeight: true
  });
});