(function() {
  var init = function() {
    $('.navbar ul.nav li').click(toggleTab);
    $('a').click(swap);
    var active = currentTab();
    $($('.navbar ul.nav li')[active]).addClass('active');
  }

  var toggleTab = function(evt) {
    $('.navbar ul.nav li').removeClass('active');
    $(evt.currentTarget).addClass('active');
  }

  var swap = function(evt) {
    evt.preventDefault();
    $.ajax({
      url: evt.target.href
    }).done(function(data) {
      var html_content = $(data).find('#wrap').html();
      $('#wrap').hide().html(html_content).fadeIn('slow');
      history.pushState(null, null, evt.target.href);
    });
  }

  var currentTab = function() {
    switch(window.location.pathname) {
      case '/users': 
        return 1;
      case '/courses':
        return 2;
      default:
        return 0;
    }
  }

  $(document).ready(init);
}).call(this);
