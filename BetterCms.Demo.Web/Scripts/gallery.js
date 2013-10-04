function GalleryModel(opts) {
    var self = this,
        options = $.extend({
            renderSlider: true,
            renderThumbnails: true,
            coverwidth: 525,
            coverheight: 355,
            width: 940,
            height: 445,
            covergap: 80
        }, opts),
        selectors = {
            images: '.page-frame .bcms-gallery-image-holder > img',
            imagesContainer: '.page-frame section:has(>.bcms-gallery-image-holder)',
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
        dragTimer,
        gallerySlider,
        sliderStep,
        sliderChanged = false;

    function collectImages() {
        $(selectors.images).each(function () {
            var imgSrc = $(this).attr('src'),
                imgCaption = $(this).attr('alt'),
                imgTitle = $(this).data('title');

            if (imgSrc) {
                images.push({
                    title: imgTitle,
                    description: imgCaption,
                    image: imgSrc,
                    link: imgSrc
                });
            }
        });
    }

    function setupThumbnails() {
        if (options.renderThumbnails) {
            var thumbnailContainer = $(selectors.thumbnailsContainer);
            
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
                    window.coverflow().to($(this).data('index'));
                });
            });
        }
    }

    function setupSlider() {
        var galleryScrollbar,
            sliderWidth,
            sliderSteps;

        gallerySlider = $(selectors.gallerySlider);
        galleryScrollbar = $(selectors.galleryScrollbar);

        if (options.renderSlider) {
            sliderSteps = images.length;
            sliderWidth = gallerySlider.width();
            if (galleryScrollbar.width() / sliderSteps > sliderWidth) {
                sliderWidth = galleryScrollbar.width() / sliderSteps;
                gallerySlider.css('width', sliderWidth);
            }
            sliderStep = galleryScrollbar.width() / sliderSteps;
            
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
        } else {
            galleryScrollbar.hide();
        }
    }

    function setupCoverflow() {
        window.coverflow(selectors.galleryContainer).setup({
            playlist: images,
            backgroundcolor: 'fff',
            mode: 'html5',
            item: 0,
            width: options.width,
            height: options.height,
            x: 0,
            y: 0,
            coverwidth: options.coverwidth,
            coverheight: options.coverheight,
            coverangle: 45,
            covergap: options.covergap,
            coverdepth: 185,
            opacitydecrease: 0.5,
            reflectionratio: 5,
            fixedsize: true,
            textoffset: 37
        }).on('ready', function () {
            this.on('focus', function (index) {
                if (options.renderThumbnails) {
                    $(selectors.allThumbnails).each(function () {
                        var $this = $(this);

                        if ($this.data('index') == index) {
                            $this.addClass(classes.activeImage);
                        } else {
                            $this.removeClass(classes.activeImage);
                        }
                    });
                }

                if (options.renderSlider) {
                    if (!sliderChanged) {
                        gallerySlider.css('left', index * sliderStep + 2);
                    }
                    sliderChanged = false;
                }
            });

            this.on('click', function (index, link) {
                if (link) {
                    window.open(link, '_blank');
                }
            });
        });
    }

    self.initialize = function () {
        var galleryDiv;

        // Collects images
        collectImages();

        if (images.length > 0) {
            // Add custom HTML with slider, thumbnails and coverflow gallery
            galleryDiv = $($(selectors.galleryTemplate).html());
            
            $(selectors.imagesContainer).first().replaceWith(galleryDiv);
            $(selectors.imagesContainer).remove();

            // Setup
            setupThumbnails();
            setupSlider();
            setupCoverflow();
        }
    };

    return self;
}
