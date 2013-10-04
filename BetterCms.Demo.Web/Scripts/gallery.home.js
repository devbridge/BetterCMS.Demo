$(function() {
    var options = {
        renderThumbnails: false,
        renderSlider: false,
        coverwidth: 150,
        coverheight: 100,
        width: 300,
        height: 180,
        covergap: 10
    },
        model = new GalleryModel(options);
    
    model.initialize();
});