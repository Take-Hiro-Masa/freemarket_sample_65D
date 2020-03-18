$(function() {

  //  insert_img  //

  var preview = $('#preview');
  var dropzone = $('.dropzone-area');
  var input_area = $('.input_area');
  var images = [];
  var inputs  =[];

  $(document).on('change', 'input[type= "file"].upload-image',function(event){
    var file = $(this).prop('files')[0];
    var reader = new FileReader();
    inputs.push($(this));
    var img = $(`<div class= "img_view"><img></div>`);
    reader.onload = function(e) {
      var btn_wrapper = $('<div class="upload-image__prev--btn"><div class="edit-btn">編集</div><div class="delete-btn">削除</div></div>');
      img.append(btn_wrapper);
      img.find('img').attr({src: e.target.result
      })
    }
    reader.readAsDataURL(file);
      images.push(img);
      $('#preview').empty();
      $('.input_area__img').css('background-image', 'url()');
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        if (index < 5 ){
          $('#preview').append(image);
        } else if (index >= 5){
          $('#preview2').append(image);
        }
      })
      var len = images.length % 5;
      if(images.length <= 9){
        dropzone.css({
          'width': `calc(100% - (120px * ${len}))`
        })
      } else if ( images.length >= 10) {
        dropzone.css({
          'display': `none`
        })
      }
      if(images.length >= 5) {
        $('.sell-upload-box').css({
          'height': `490px`
        })
      }
      
      if(images.length == 5) {
        $(".dropzone-area").attr('id', 'nothing');
      }

  //  insert_input  //

      var new_image = $(`<input id="upload-image__btn" class="upload-image" data-image= ${images.length} type="file", name="item[images[]][${images.length}][image]" `);
      input_area.prepend(new_image);
  });

  //  img_edit_and_destroy  //

  $(document).on('click', '.delete-btn', function() {
    var target_image = $(this).parent().parent();
    $.each(inputs, function(index, input){
      if ($(this).data('image') == target_image.data('image')){
        $(this).remove();
        target_image.remove();

        var num = $(this).data('image');
        images.splice(num, 1);
        inputs.splice(num, 1);
                                    
        if(inputs.length == 0) {
          $('input[type= "file"].upload-image').attr({
            'data-image': 0
          })
        }
      }
    })
    $('input[type= "file"].upload-image:first').attr({
      'data-image': inputs.length
    })
    $.each(inputs, function(index, input) {
      var input = $(this)
      input.attr({
        'data-image': index
      })
      $('input[type= "file"].upload-image:first').after(input)
    })
    dropzone.css({
      'display': 'block'
    })
    $.each(images, function(index, image) {
      image.attr('data-image', index);
      preview.append(image);
    })
    dropzone.css({
      'width': `calc(100% - (120px * ${images.length}))`
    })
  })



  /// img-delete-btn
  $(document).on('click', '.sell-main-upload__btn__delete', function() {
    var target_image = $(this).parent().parent();
      if ($(this).data('image') == target_image.data('image')){
        $(this).remove();
        target_image.remove();
        var num = $(this).data('image');
        images.splice(num, 1);
        inputs.splice(num, 1);
        if(inputs.length == 0) {
          $('input[type= "file"].sell-main-upload').attr({
            'data-image': 0
          })
        }
      }
    $('input[type= "file"].sell-main-upload').attr({
      'data-image': inputs.length
    })
    $.each(inputs, function(index, input) {
      var input = $(this)
      input.attr({
        'data-image': index
      })
      $('input[type= "file"].sell-main-upload').after(input)
    })
    dropzone.css({
      'display': 'block'
    })
    $.each(images, function(index, image) {
      image.attr('data-image', index);
      preview.append(image);
    })
    dropzone.css({
      'width': `calc(100% - (120px * ${images.length}))`
    })
  })
  
  // 価格入力時に、手数料、利益計算
  $('#sell_center').on('keyup', function(){
    var price = $(this).val();
    var mercari_fee = Math.floor(price * 0.1)
    var seller_gain = price - mercari_fee

    if (price >= 300 && price <= 9999999) {
      $('#mercari_fee').text('¥' + mercari_fee.toLocaleString())
      $('#seller_gain').text('¥' + seller_gain.toLocaleString())
    } else {
      $('#mercari_fee').text('--')
      $('#seller_gain').text('--')
    }
  })
})