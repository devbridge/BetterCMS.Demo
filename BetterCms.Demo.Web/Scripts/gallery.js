$(function () {
    function getQueryParam(param) {
        var result =  window.location.search.match(
            new RegExp("(\\?|&)" + param + "(\\[\\])?=([^&]*)")
        );

        return result ? result[3] : false;
    }

    var selectors = {
        images: '.page-frame .bcms-gallery-image-holder > img',
        imagesContainer: '.page-frame section:has(.bcms-gallery-image-holder)',
        galleryContainerId: 'images-gallery-container'
    },
        images = [],
        galleryDiv,
        imgSrc, imgTitle;

    if (getQueryParam("image-gallery-album-id")) {
        $(selectors.images).each(function() {
            imgSrc = $(this).attr('src');
            imgTitle = $(this).attr('alt');
            if (imgSrc) {
                images.push({
                    title: imgTitle,
                    description: imgTitle,
                    image: imgSrc
                });
            }
        });

        if (images.length > 0) {
            galleryDiv = $('<div class="gallery-view" id="' + selectors.galleryContainerId + '"></div>');

            $(selectors.imagesContainer).first().replaceWith(galleryDiv);
            $(selectors.imagesContainer).remove();
            
            window.coverflow(selectors.galleryContainerId).setup({
                playlist: images,
                backgroundcolor: 'fff',
                mode: 'html5',
                item: 0,
                width: 940,
                height: 445,
                x: 0,
                y: 0,
                coverwidth: 525,
                coverheight: 355,
                coverangle: 45,
                covergap: 80,
                coverdepth: 185,
                opacitydecrease: 0.5,
                reflectionratio: 5,
                fixedsize: true,
                textoffset: 37
            });
        }
    }
});
