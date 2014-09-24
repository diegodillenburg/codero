function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).closest(".row").before(content.replace(regexp, new_id));
}

$(function () {
    $('.billing-checkbox').on('click', function () {
        if ($('.billing-checkbox').is(":checked")) {
            $('.debt-checkbox').prop('checked', true);
        } else {
            $('.debt-checkbox').prop('checked', false);
        }
    });
    });

$(function () {
    $('.debt-checkbox').on('click', function () {

        var list = $(".debt-checkbox").map(function () {
            return $(this).is(":checked");
        }).get();
        trueCounter = 0;
console.log(list.length);

        list.forEach(function (is_checked) {
            if (is_checked == true) {
                trueCounter++;
            }
        });

        if (trueCounter == list.length) {
            $('.billing-checkbox').prop('checked', true);
        } else if (trueCounter !== list.length) {
            $('.billing-checkbox').prop('checked', false);
        } else {
            return;
        }
    });
});