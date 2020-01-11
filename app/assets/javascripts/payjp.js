// document.addEventListener
//   ('turbolinks:load', function(){
//     if (document.getElementById("token_submit") != null) { //token_submitというidがnullの場合、下記コードを実行しない
//       Payjp.setPublicKey("pk_test_e6a9c40caefb266695329e1b"); //ここに公開鍵を直書き
//       let btn = document.getElementById("token_submit"); //IDがtoken_submitの場合に取得されます
//       btn.addEventListener("click", e => { //ボタンが押されたときに作動します
//         e.preventDefault(); //ボタンを一旦無効化します
//         let card = {
//           card_number: document.getElementById("number").value,
//           cvc: document.getElementById("cvc").value,
//           exp_month: document.getElementById("exp_month").value,
//           exp_year: document.getElementById("exp_year").value
//         }; //入力されたデータを取得します。
//         Payjp.createToken(card, (status, response) => {
//           console.log(status);
//           console.log(card);
//           if (status === 200) { //成功した場合
//             $("#number").removeAttr("name");
//             $("#cvc").removeAttr("name");
//             $("#exp_month").removeAttr("name");
//             $("#exp_year").removeAttr("name"); //データを自サーバにpostしないように削除
//             $("#charge-form").append(
//             $('<input type="hidden" name="payjp-token">').val(response.id)
//             ); //取得したトークンを送信できる状態にします
//             document.inputForm.submit();
//             alert("登録が完了しました"); //確認用
//           } else {
//             alert("カード情報が正しくありません。"); //確認用
//           }
//         });
//       });
//     }
//   },
//   false
// );

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










