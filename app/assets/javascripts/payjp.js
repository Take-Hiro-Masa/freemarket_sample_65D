$(function(){
  var form = $("#charge-form");
  Payjp.setPublicKey('pk_test_e6a9c40caefb266695329e1b'); //(自身の公開鍵)
  $("#charge-form").on("click", "#token_submit", function(e) {
    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);
    var card = {
        number: parseInt($("#number").val()),
        cvc: parseInt($("#cvc").val()),
        exp_month: parseInt($("#exp_month").val()),
        exp_year: parseInt($("#exp_year").val())
    };
    Payjp.createToken(card, (status, response) => {
      if (status === 200) { //成功した場合
        $("#number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name"); //データを自サーバにpostしないように削除
        $("#card_token").append(
        $('<input type="hidden" name="payjp-token">').val(response.id)
        ); //取得したトークンを送信できる状態にします
        document.inputForm.submit();
        alert("登録が完了しました"); //確認用
      }
      else {
        alert("error")
        form.find('#token_submit').prop('disabled', false);
      }
    });
  });
});










