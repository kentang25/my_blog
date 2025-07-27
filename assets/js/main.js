$('.set-bg').each(function(){
    var bg = $(this).data('setbg');
    $(this).css({
        'background-image': 'url(' + bg + ')',
        'background-repeat': 'no-repeat',
        'background-size': 'cover',
        'background-position': 'center center'
    });
});
