$(function () {
    var selectors = {
        imageParent: '.bcms-album-holder:first',
        imageLink: '.bcms-album-name > h4 > a:first'
    },
        options = {
            renderThumbnails: false,
            renderSlider: false,
            coverwidth: 150,
            coverheight: 100,
            width: 300,
            height: 180,
            covergap: 10,
            imagesSelector: '.home-bottom .bcms-album-holder > img',
            imagesContainerSelector: '.page-frame section:has(>.bcms-album-holder)',
            onOpenImage: function(link) {
                window.location.href = link;
            },
            getImageUrl: function (imgElement) {
                return imgElement.parents(selectors.imageParent).find(selectors.imageLink).attr('href') || imgElement.attr('src');
            }
        },
        model = new GalleryModel(options);
    
    model.initialize();
});