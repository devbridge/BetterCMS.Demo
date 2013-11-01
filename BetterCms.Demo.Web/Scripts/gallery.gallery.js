$(function() {
    function getQueryParam(param) {
        var result = window.location.search.match(
            new RegExp("(\\?|&)" + param + "(\\[\\])?=([^&]*)")
        );

        return result ? result[3] : false;
    }

    if (getQueryParam("image-gallery-folder-id")) {
        var model = new GalleryModel();
        model.initialize();
    } else {
        $('#gallery-main-content').css('visibility', 'visible');
    }
});