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
        galleryTemplate: '#gallery-template',
        galleryThumbnailTemplate: '#gallery-thumbnail-template',
        galleryContainer: 'images-gallery-container',
        thumbnailsContainer: '#gallery-thumbnails',
        thumbnailImage: 'img',
        allThumbnails: '#gallery-thumbnails a',
        galleryScrollbar: '.gallery-scrollbar',
        gallerySlider: '.gallery-slider',
    },
        classes = {
            activeImage: "active-image"
        },
        images = [],
        galleryDiv,
        imgSrc,
        imgCaption,
        imgTitle,
        thumbnailContainer,
        dragTimer,
        galleryScrollbar,
        gallerySlider,
        sliderWidth,
        sliderSteps,
        sliderStep,
        sliderChanged = false;

    if (getQueryParam("image-gallery-album-id")) {
        $(selectors.images).each(function() {
            imgSrc = $(this).attr('src');
            imgCaption = $(this).attr('alt');
            imgTitle = $(this).data('title');
            if (imgSrc) {
                images.push({
                    title: imgTitle,
                    description: imgCaption,
                    image: imgSrc
                });
            }
        });

        if (images.length > 0) {
            galleryDiv = $($(selectors.galleryTemplate).html());

            // Setup cover flow plugin
            $(selectors.imagesContainer).first().replaceWith(galleryDiv);
            $(selectors.imagesContainer).remove();
            
            // Setup thumbnails
            thumbnailContainer = $(selectors.thumbnailsContainer);
            $(images).each(function (index) {
                // Setup thumbnail
                var thumbnail = $($(selectors.galleryThumbnailTemplate).html()),
                    image;
                if (index == 0) {
                    thumbnail.addClass(classes.activeImage);
                }
                thumbnail.data('index', index);

                // Setup image
                image = thumbnail.find(selectors.thumbnailImage);
                image.attr('src', this.image);
                image.attr('alt', this.title);
                
                thumbnailContainer.append(thumbnail);
                
                thumbnail.on('click', function () {
                    var self = $(this);

                    window.coverflow().to(self.data('index'));
                });
            });

            galleryScrollbar = $(selectors.galleryScrollbar);
            gallerySlider = $(selectors.gallerySlider);
            sliderSteps = images.length;
            sliderWidth = gallerySlider.width();
            if (galleryScrollbar.width() / sliderSteps > sliderWidth) {
                sliderWidth = galleryScrollbar.width() / sliderSteps;
                gallerySlider.css('width', sliderWidth);
            }
            sliderStep = galleryScrollbar.width() / sliderSteps;

            // Setup coverflow gallery
            window.coverflow(selectors.galleryContainer).setup({
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
            }).on('focus', function (index) {
                $(selectors.allThumbnails).each(function () {
                    var self = $(this);
                    
                    if (self.data('index') == index) {
                        self.addClass(classes.activeImage);
                    } else {
                        self.removeClass(classes.activeImage);
                    }
                });

                if (!sliderChanged) {
                    gallerySlider.css('left', index * sliderStep + 2);
                }
                sliderChanged = false;
            });

            // Setup gallery slider
            $(gallerySlider).draggable({
                axis: "x",
                containment: "parent"
            }).on('drag', function (event, ui) {
                clearTimeout(dragTimer);
                dragTimer = setTimeout(function () {
                    var left = ui.position.left + sliderWidth / 2,
                        currentStep = Math.ceil(left / sliderStep);

                    sliderChanged = true;
                    window.coverflow().to(currentStep > sliderSteps ? sliderSteps - 1 : currentStep - 1);
                }, 30);
            });
        }
    }
});
