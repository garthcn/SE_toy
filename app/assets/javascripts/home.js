(function() {
  Oolong.Home = {
    init : function() {

      // pjax stuff
      $('a').pjax('#wrap');

      $('body').on('click', 'table.clickable tbody tr', function(evt) {
        var link = $(evt.currentTarget).attr('data-link')
        $.pjax({
          url: link,
          container: '#wrap'
        });
      });

      $(document)
        .on('pjax:beforeSend', function() { 
          $('#wrap').hide(); 
          $('.no-pjax').hide(); 
        })
        .on('pjax:end', function() { 
          Oolong.Home.updateTab();
          $('#wrap').fadeIn(500); 
          $('.no-pjax').fadeIn(500); 
        })

      // Handle Tab focus
      Oolong.Home.updateTab();
      $('.navbar ul.nav li').click(Oolong.Home.toggleTab);
    },

    updateTab : function() {
      $($('.navbar ul.nav li')).removeClass('active');
      var active = Oolong.Home.currentTab();
      $($('.navbar ul.nav li')[active]).addClass('active');
    },

    toggleTab : function(evt) {
      $('.navbar ul.nav li').removeClass('active');
      $(evt.currentTarget).addClass('active');
    },

    //goToLink : function(link) {
      //$.ajax({
        //url: link
      //}).done(function(data) {
        //var html_content = $(data).find('#wrap').html();
        //$('#wrap').hide().html(html_content).fadeIn('slow');
        //history.pushState(null, null, link);
      //});
    //},

    //swap : function(evt) {
      //evt.preventDefault();
      //Oolong.Home.goToLink(evt.target.href);
    //},

    currentTab : function() {
      switch(window.location.pathname.split('/')[1]) {
        case 'users': 
          return 1;
        case 'courses':
          return 2;
        default:
          return 0;
      }
    }
  }

  console.log('home');
  $(document).ready(Oolong.Home.init);
}).call(this);
