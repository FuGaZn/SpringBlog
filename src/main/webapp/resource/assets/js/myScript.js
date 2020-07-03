function increaseViewCount(articleId) {
    $.ajax({
        async: false,
        type: "POST",
        url: "/article/view/" + articleId,
        dataType: 'json',
        contentType: 'application/json',
        success: function () {
        },
        error: function () {
        },
    });
}