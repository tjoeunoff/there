$(function(){

    // mobile menu
    $('.m-menu-btn').on('click', function(){
        if($(this).hasClass('on')) {
            $(this).removeClass('on').next('#mGnb').stop().fadeOut(300);
            $('body').css('overflow', 'auto');
        } else {
            $(this).addClass('on').next('#mGnb').stop().fadeIn(300);
            $('body').css('overflow', 'hidden');
        }

        
    });

});