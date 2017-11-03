$(document).on 'ready turbolinks:load', ->
  $(".button-collapse").sideNav()
  $('.dropdown-button').dropdown()
  $('.modal').modal()
  $('select').material_select()
  Waves.displayEffect()

  $('textarea').trigger('autoresize')
  $('span.help-text').each ->
    $value = $(this)[0].innerHTML
    $(this).addClass 'hide'
    $(this).parents('div.input-field').children('label').attr(
      'data-hint', $value
    )

  $('.datepicker').pickadate
    selectMonths: true
    selectYears: 15
    monthsFull:  ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
    monthsShort: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
    weekdaysFull: ["日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"]
    weekdaysShort:  ["日", "月", "火", "水", "木", "金", "土"]
    weekdaysLetter: ["日", "月", "火", "水", "木", "金", "土"]
    labelMonthNext: "翌月"
    labelMonthPrev: "前月"
    labelMonthSelect: "月を選択"
    labelYearSelect: "年を選択"
    today: "今日"
    clear: "クリア"
    close: "閉じる"
    format: 'yyyy-mm-dd'

  initCocoon()

  console.log "load init on ready or turbolinks:load"

# Cocoon event hooks
initCocoon = ->
  $('.js-cocoon')
    .on 'cocoon:before-insert', (e, item_to_be_added) ->
      console.log('before insert')
    .on 'cocoon:after-insert', (e, added_item) ->
      console.log('after insert')
      $('select').material_select()
      added_item.css 'border-color', 'red'
    .on 'cocoon:before-remove', (e, item_to_be_removed) ->
      console.log('before remove')
      $(@).data 'remove-timeout', 1000
      item_to_be_removed.fadeOut 'slow'
    .on 'cocoon:after-remove', (e, removed_item) ->
      console.log('after remove')
