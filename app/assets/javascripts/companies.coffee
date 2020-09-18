# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#company_postcode").jpostal({
    postcode : [ "#company_postcode" ],
    address  : {
                  "#company_prefecture_code" : "%3",
                  "#company_address_city"            : "%4",
                  "#company_address_street"          : "%5%6%7"
                }
  })