$(function () {
    var selectors = {
        imageParent: '.bcms-album-holder:first',
        imageLink: '.bcms-album-name > h4 > a:first'
    },
        options = {
            renderThumbnails: false,
            renderSlider: false,
            renderDescription: false,
            coverHeight: '133px',
            coverWidth: '200px',
            imagesSelector: '.home-bottom .bcms-album-holder > img',
            imagesContainerSelector: '.page-frame section:has(>.bcms-album-holder)',
            onOpenImage: function(imageModel) {
                window.location.href = imageModel.link;
            },
            getImageUrl: function (imgElement) {
                return imgElement.parents(selectors.imageParent).find(selectors.imageLink).attr('href') || imgElement.attr('src');
            }
        },
        model = new GalleryModel(options);
    
    model.initialize();
});