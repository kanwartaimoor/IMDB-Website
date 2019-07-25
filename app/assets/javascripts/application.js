//= require rails-ujs
//= require jquery3
//= require_tree

var fun;

fun = function(obj) {
    var a;
    $('#comment_box').show();
    $('#myPost').attr('method', 'post');
    $('#myPost').attr('action', '/reviews/' + $(obj).data('id'));
    $('<input>').attr({
        type: 'hidden',
        value: 'patch',
        name: '_method'
    }).appendTo('#myPost');
    a = $(obj).parent().siblings('#description').text();
    $('#review_description').val(a);
    return true;
};

total = $('form').find('input');
i=0;
while (i < total.length)
{
    total[i].addClass("form-control")
    if( total[i].hasAttribute('required'))
    {
        total[i].previousElementSibling.after('*');
    }

}


