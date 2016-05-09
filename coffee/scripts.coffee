# Mon Avis Javascripts
jQuery(document).ready ->
  $imagesLightbox = $('.lightbox')
  $scrollBar = $('.mCustomScrollbar')
  $carouselBlock = $('.carousel-block')
  $isotopeContainer = $('.product-isotope')
  $cartButton = $('.cart-operation')
  $cartContainer = $('.cart-content')
  $cartTotalPrice = $('.cart-total-price')
  $cartTotalCount = $('.cart-total-count')
  $loader = $('<div class="loader"><i class="fa fa-spinner fa-pulse"></i></div>')
  $ajaxModal = $('#ajaxModal')
  screenWidth = $(window).width()
  visibleSlides = 1
  lg = 1200
  md = 992
  sm = 768

  refreshCart = (cart) ->
    $($loader, $cartContainer).remove()
    $('.cart-product', $cartContainer).remove()
    if cart.products
      if $('.cart-buttons-row').hasClass('hidden')
        $('.cart-buttons-row').removeClass 'hidden'
      $.each cart.products, (idx, obj) ->
        $cartContainer.find('.cart-product-list').append '<tr class="cart-product"><td><a class="cart-operation remove" data-product_id="' + obj.id + '" data-action="remove_product" data-quantity="1" data-key="' + obj.key + '" href="#"><i class="fa fa-times"></i></a><span class="product-cart-name">' + obj.name + '</span></td><td><span class="product-cart-quantity">' + obj.quantity + '</span></td><td><span class="amount">' + obj.price + '</span></td></tr>'
        return
    else
      $('.cart-buttons-row').addClass 'hidden'
    $cartTotalPrice.html cart.total_price
    $cartTotalCount.html cart.total_count
    return

  resizeLineBlocks = (currentScreenWidth) ->
    $('.product_cat-row').each ->
      rowHeight = $(this).height()
      $(this).find('.product_cat-block').children('.product_cat-container').css 'min-height', rowHeight + 'px'
      return
    return

  responsiveCarousel = (currentScreenWidth) ->
    visibleSlides = 1
    switch true
      when currentScreenWidth >= lg
        visibleSlides = 5
      when currentScreenWidth >= md and currentScreenWidth < lg
        visibleSlides = 3
      when currentScreenWidth >= sm and currentScreenWidth < md
        visibleSlides = 2
    $carouselBlock.carousel
      elements: counter: false
      behavior: circular: true
      layout: visibleSlides: visibleSlides
      animation: step: 1
    return

  if $imagesLightbox.length
    $imagesLightbox.iLightBox
      skin: 'metro-white'
      linkId: 'gallery-image'
      overlay:
        opacity: 0.875
        blur: true
      styles:
        prevScale: 0.75
        prevOpacity: 0.75
        nextScale: 0.75
        nextOpacity: 0.75
      path: 'vertical'
      controls: thumbnail: true
  if $('.parent-cat').length
    $('.parent-cat').children('a').click ->
      $(this).parent('.parent-cat').toggleClass 'open'
      false
  $(document).on 'click', '.cart-operation', ->
    product_id = $(this).attr('data-product_id')
    quantity = $(this).attr('data-quantity')
    action = $(this).attr('data-action')
    key = $(this).attr('data-key')
    url = WPURLS.siteurl
    el = $(this)
    data =
      action: action
      product_id: product_id
      quantity: quantity
      key: key
    $cartContainer.append $loader
    $.ajax
      url: url + '/ajaxCart.php'
      data: data
      type: 'POST'
      success: (data) ->
        refreshCart data
        return
    false
  if $scrollBar.length
    $scrollBar.mCustomScrollbar scrollButtons: enable: true
  if $('.btn-number').length
    $('.btn-number').click (e) ->
      e.preventDefault()
      fieldName = $(this).attr('data-field')
      type = $(this).attr('data-type')
      input = $('input[name=\'' + fieldName + '\']')
      currentVal = parseInt(input.val())
      max = 100
      min = 1
      if parseInt(input.attr('max')) > 0
        max = parseInt(input.attr('max'))
      if parseInt(input.attr('min')) > 0
        min = parseInt(input.attr('min'))
      if !isNaN(currentVal)
        if type == 'minus'
          if currentVal > min
            input.val(currentVal - 1).change()
          if parseInt(input.val()) == min
            $(this).attr 'disabled', true
        else if type == 'plus'
          if currentVal < max
            input.val(currentVal + 1).change()
          if parseInt(input.val()) == max
            $(this).attr 'disabled', true
      else
        input.val 0
      return
    $('.input-number').focusin ->
      $(this).data 'oldValue', $(this).val()
      return
    $('.input-number').change ->
      minValue = 1
      maxValue = 100
      if parseInt($(this).attr('max')) > 0
        maxValue = parseInt($(this).attr('max'))
      if parseInt($(this).attr('min')) > 0
        minValue = parseInt($(this).attr('min'))
      valueCurrent = parseInt($(this).val())
      name = $(this).attr('name')
      if valueCurrent >= minValue
        $('.btn-number[data-type=\'minus\'][data-field=\'' + name + '\']').removeAttr 'disabled'
      else
        alert 'Sorry, the minimum value was reached'
        $(this).val $(this).data('oldValue')
      if valueCurrent <= maxValue
        $('.btn-number[data-type=\'plus\'][data-field=\'' + name + '\']').removeAttr 'disabled'
      else
        alert 'Sorry, the maximum value was reached'
        $(this).val $(this).data('oldValue')
      return
    $('.input-number').keydown (e) ->
      # Allow: backspace, delete, tab, escape, enter and .
      if $.inArray(e.keyCode, [
        46
        8
        9
        27
        13
        190
      ]) != -1 or e.keyCode == 65 and e.ctrlKey == true or e.keyCode >= 35 and e.keyCode <= 39
        # let it happen, don't do anything
        return
      # Ensure that it is a number and stop the keypress
      if (e.shiftKey or e.keyCode < 48 or e.keyCode > 57) and (e.keyCode < 96 or e.keyCode > 105)
        e.preventDefault()
      return
  if $('.bootstrap-select').length and $().selectpicker
    $('.bootstrap-select').selectpicker()
  if $().gMap and $('#map').length
    $('#map').gMap
      zoom: 16
      center: ''
      markers: [ {
        popup: false
        scrollwheel: false
        maptype: 'TERRAIN'
        latitude: 50.404243
        longitude: 30.62228127116393
        icon:
          image: WPURLS.siteurl + '/assets/img/gmap.png'
          iconsize: [
            25
            27
          ]
          iconanchor: [
            15
            24
          ]
        controls:
          panControl: false
          zoomControl: false
          mapTypeControl: true
          scaleControl: true
          streetViewControl: true
          overviewMapControl: false
      } ]

  ###if($('.ajax-modal-link').length && $ajaxModal.length) {

      $('.ajax-modal-link').click(function (e) {

          var fid = $(this).attr('data-fid');
          var post_name = $(this).attr('data-post_name');
          var url = WPURLS.siteurl;

          var data = {
              fid: fid,
              post_name: post_name
          };

          if(fid.length) {
              $ajaxModal.find('.modal-body').html($loader);
              $.ajax({
                  url: url + '/ajaxForm.php',
                  data: data,
                  type: 'POST',
                  success: function (data) {
                      $ajaxModal.find('.modal-body').html(data);
                  }
              });
          }
      });
  }
  ###

  jQuery(window).load ->
    if $carouselBlock.length
      responsiveCarousel screenWidth
    if $('.product_cat-row').length and screenWidth > md
      resizeLineBlocks screenWidth
    if $isotopeContainer.length
      $isotopeContainer.isotope
        'itemSelector': '.product-block'
        'layoutMode': 'fitRows'
      $('.product-filters a').click ->
        selector = $(this).attr('data-filter')
        $isotopeContainer.isotope filter: selector
        false
    return
  $(window).resize ->
    currentScreenWidth = $(window).width()
    if $carouselBlock.length
      responsiveCarousel currentScreenWidth
    if $('.product_cat-row').length
      $('.product_cat-row').each ->
        rowHeight = $(this).height()
        $(this).find('.product_cat-block').children('.product_cat-container').css 'height', 'auto'
        return
    return
  $('section.slider.head-slider .carousel-inner .item:nth-child(1)').addClass 'active'
  return