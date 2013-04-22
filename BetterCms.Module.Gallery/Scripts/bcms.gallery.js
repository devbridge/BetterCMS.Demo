/*jslint unparam: true, white: true, browser: true, devel: true */
/*global define, console */

define('bcms.gallery', ['bcms.jquery', 'bcms', 'bcms.modal', 'bcms.siteSettings', 'bcms.dynamicContent', 'bcms.datepicker', 'bcms.htmlEditor', 'bcms.grid', 'bcms.pages', 'bcms.ko.extenders', 'bcms.media', 'bcms.pages.tags', 'bcms.ko.grid', 'bcms.messages', 'bcms.redirect', 'bcms.pages.history', 'bcms.preview', 'bcms.security'],
    function ($, bcms, modal, siteSettings, dynamicContent, datepicker, htmlEditor, grid, pages, ko, media, tags, kogrid, messages, redirect, history, preview, security) {
        'use strict';

        var gallery = {},
            selectors = {
                
            },
            links = {
                loadSiteSettingsGalleryUrl: null
            },
            globalization = {
                createNewAlbumDialogTitle: null
            };

        // Assign objects to module.
        gallery.links = links;
        gallery.globalization = globalization;
        gallery.selectors = selectors;

        /**
        * Loads a gallery view to the site settings container.
        */
        gallery.loadSiteSettingsGallery = function () {
            dynamicContent.bindSiteSettings(siteSettings, links.loadSiteSettingsGalleryUrl, {
                contentAvailable: initializeSiteSettingsGallery
            });
        };
        
        /**
        * Initializes gallery.
        */
        function initializeSiteSettingsGallery(content) {
            var dialogContainer = siteSettings.getModalDialog().container;
            // TODO:
        }

        /**
        * Initializes gallery module.
        */
        gallery.init = function () {
            console.log('Initializing bcms.gallery module.');
        };
        
        /**
        * Register initialization
        */
        bcms.registerInit(gallery.init);

        return gallery;
    });
