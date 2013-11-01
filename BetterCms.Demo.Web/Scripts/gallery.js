function GalleryModel(opts) {
    var self = this,
        options = $.extend({
            renderSlider: true,
            renderThumbnails: true,
            renderDescription: true,
            coverHeight: '334px',
            coverWidth: '500px',
            imagesSelector: '.page-frame .bcms-gallery-image-holder > img',
            imagesContainerSelector: '.page-frame section:has(>.bcms-gallery-image-holder)',
            onOpenImage: function (model) {
                var container = $($('#gallery-image-modal-template').html()),
                    image = container.find('img'),
                    imageWidth = $(window).width() - 100,
                    imageHeight = $(window).height() - 100;

                image.attr('src', model.link);
                image.attr('alt', model.title || model.description);
                image.css('max-width', imageWidth + 'px');
                image.css('max-height', imageHeight + 'px');

                container.lightbox_me({
                    destroyOnClose: true,
                    centered: true
                });
                container.on('click', function() {
                    container.trigger('close');
                });
            },
            getImageUrl: function(imgElement) {
                return imgElement.attr('src');
            }
        }, opts),
        selectors = {
            images: options.imagesSelector,
            imagesContainer: options.imagesContainerSelector,
            galleryTemplate: '#gallery-template',
            galleryThumbnailTemplate: '#gallery-thumbnail-template',
            galleryContainer: '#images-gallery-container',
            thumbnailsContainer: '#gallery-thumbnails',
            thumbnailImage: 'img',
            allThumbnails: '#gallery-thumbnails a',
            galleryScrollbar: '.gallery-scrollbar',
            gallerySlider: '.gallery-slider',
            backButton: '.bcms-gallery-title a.bcms-gallery-back-link',
            imageTitle: '.gallery-title h1',
            imageDescription: '.gallery-title h2',
            galleryContent: '#gallery-main-content'
        },
        classes = {
            activeImage: "active-image",
            albumHolder: "bcms-album-holder",
            currentImage: "current"
        },
        images = [],
        gallerySlider,
        sliderStep,
        sliderChanged = false;

    function collectImages() {
        var i = 0;
        $(selectors.images).each(function () {
            var imgSrc = $(this).attr('src'),
                imgUrl = options.getImageUrl.call(this, $(this)),
                imgCaption = $(this).attr('alt'),
                imgTitle = $(this).data('title');

            if (imgSrc) {
                images.push({
                    title: imgTitle,
                    description: imgCaption,
                    image: imgSrc,
                    link: imgUrl,
                    index: i
                });

                i++;
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
                thumbnail.data('model', this);

                // Setup image
                image = thumbnail.find(selectors.thumbnailImage);
                image.attr('src', this.image);
                image.attr('alt', this.title);

                thumbnailContainer.append(thumbnail);

                thumbnail.on('click', function () {
                    var dom = $(this),
                        model = dom.data('model');

                    if (model) {

                        $(selectors.allThumbnails).removeClass(classes.activeImage);
                        dom.addClass(classes.activeImage);

                        $(selectors.galleryContainer).coverflow('index', model.index);
                    }
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
                var left = ui.position.left + sliderWidth / 2,
                    currentStep = Math.ceil(left / sliderStep),
                    index = currentStep > sliderSteps ? sliderSteps - 1 : currentStep - 1;

                sliderChanged = true;

                $(selectors.galleryContainer).coverflow('index', index);
            });
        } else {
            galleryScrollbar.hide();
        }
    }

    function setupCoverflow() {

        $.each(images, function() {
            var model = this,
                imgDom = $('<img />');
            
            imgDom.attr('src', model.image);
            imgDom.css('max-height', options.coverHeight);
            imgDom.css('max-width', options.coverWidth);
            imgDom.data('model', model);

            $(selectors.galleryContainer).append(imgDom);
        });

        $(selectors.galleryContainer).coverflow({
            index: 0,
            select: function (cover, imgDom) {
                var image = $(imgDom),
                    maxLength = 150,
                    model,
                    title, description;
                
                if (image.hasClass(classes.currentImage)) {
                    model = image.data('model');
                    
                    if (model) {
                        if (options.renderThumbnails) {
                            $(selectors.allThumbnails).each(function () {
                                var $this = $(this);

                                if ($this.data('model') == model) {
                                    $this.addClass(classes.activeImage);
                                } else {
                                    $this.removeClass(classes.activeImage);
                                }
                            });
                        }

                        if (options.renderSlider) {
                            if (!sliderChanged) {
                                gallerySlider.css('left', model.index * sliderStep + 2);
                            }
                            sliderChanged = false;
                        }

                        if (options.renderDescription) {
                            title = model.title.length > maxLength ? model.title.substr(0, maxLength) + '...' : model.title;
                            description = model.description.length > maxLength ? model.description.substr(0, maxLength) + '...' : model.description;

                            $(selectors.imageTitle).html(title);
                            $(selectors.imageDescription).html(description);
                        }
                    }
                }
            },
            confirm: function (cover, imgDom) {
                console.log(cover);

                var model = $(imgDom).data('model');
                
                if (model && model.link) {
                    options.onOpenImage(model);
                }
            }
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
            
            // Chrome fix: refreshing after setup - sometimes on first load images are loaded distorted
            setTimeout(function () {
                $(selectors.galleryContainer).coverflow('refresh', 0);
                $(selectors.galleryContent).css('visibility', 'visible');
            }, 200);
        }
        
        // Hide back button if there is no history
        if (history.length <= 1) {
            $(selectors.backButton).hide();
        }
    };

    return self;
}
