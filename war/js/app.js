;
var SaveForm = (function(player, modal, form){
  var input = $('input[name="username"]', form);

  form.submit(function(e){
    e.preventDefault;
    $.ajax({
      type    : 'GET',
      url     : form.action || '/setname',
      data    : input,
      success : function(data) {
        modal.modal('hide');
        player.sync(data);
      },
      error   : function(jqXHR, status, err){
        console.error(status);
        console.error(err);
      },
    });
    return false;
  });

  $('.submit', modal).click(function(e){
    form.submit();
  });

  input.keydown(function(event){
    if(event.keyCode == 13) {
      event.preventDefault();
      form.submit();
      return false;
    }
  });

  return {
    'show'   : function(){
                 modal.modal('show');
                 input.focus();
              },
    'hide'   : function(){ modal.modal('hide') },
    'toggle' : function(){ modal.modal('togle') },
  }
});


var Player = (function(player, ele){
  var score_high  = $('.score.score_high', ele)[0];
  var score_total = $('.score.score_total', ele)[0];
  var player_name = $('.player_name', ele)[0];
  var save_modal  = $("#save_scores")
  var interface   = {}
  var save_form   = SaveForm(interface, save_modal, $('form', save_modal));

  interface['sync'] = function(data) {
    if (data['name']) {
      if(player_name) { player_name.innerText = 'Player: ' + data['name']; }
    }  else {
      save_form.show();
    }
    if (data['score_high'] && score_high)
      score_high.innerText = data['score_high'];
    if (data['score_total'] && score_total)
      score_total.innerText = data['score_total'];
  }
  return interface;
});


var PalindromeApp = (function() {
  var alert_block   = $('div.alert');
  var alert         = $('.alert-msg', alert_block)[0];
  var alert_heading = $('.alert-heading', alert_block)[0];
  var alert_row     = $('div.alert-row');
  return {
    'start' : function(player, form) {
      if (!form) {
        console.error("A palindrome form is required");
        return;
      }
      var input = $('input[name="palindrome"]', form);
      if (!input) {
        console.error("A palindrome input element is required");
        return;
      }

      var append_to_list = function(data){
        if (data['error']) {
          if (alert && alert_row[0]) {
            alert.innerText = data['error'];
            alert_row.append(alert_block);
            alert_block.addClass("fade").addClass("in");
          } else {
            console.error(data['error']);
          }
        } else {
          input.val('');
          player.sync(data);
        }
      };

      $('button[type="submit"]', form).click(function(e){
        e.preventDefault();
        $.ajax({
          type    : 'GET',
          url     : form.action || '/submit',
          data    : input,
          success : append_to_list,
          error   : function(jqXHR, status, err){
            console.error(status);
            console.error(err);
          },
        });
      });
    } // start
  }
});
