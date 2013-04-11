function reset() {

    var replacement = document.createElement('div');
    replacement.id = 'gallery';

    var el = document.getElementById('gallery');
    el.parentNode.replaceChild(replacement, el);

    window.coverflow('gallery').setup({
        playlist: [
            {
                'title': 'Image 1',
                'description': 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed',
                'image': '/Content/images/gallery-1.jpg'
            },
            {
                'title': 'Image 2',
                'description': 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed',
                'image': '/Content/images/gallery-2.jpg'
            },
            {
                'title': 'Image 3',
                'description': 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed',
                'image': '/Content/images/gallery-3.jpg'
            },
            {
                'title': 'Image 4',
                'description': 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed',
                'image': '/Content/images/gallery-4.jpg'
            },
            {
                'title': 'Image 5',
                'description': 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed',
                'image': '/Content/images/gallery-5.jpg'
            },
            {
                'title': 'Image 6',
                'description': 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed',
                'image': '/Content/images/gallery-6.jpg'
            },
            {
                'title': 'Image 7',
                'description': 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed',
                'image': '/Content/images/gallery-1.jpg'
            },
            {
                'title': 'Image 8',
                'description': 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed',
                'image': '/Content/images/gallery-2.jpg'
            },
            {
                'title': 'Image 9',
                'description': 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed',
                'image': '/Content/images/gallery-3.jpg'
            },
            {
                'title': 'Image 10',
                'description': 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed',
                'image': '/Content/images/gallery-4.jpg'
            },
            {
                'title': 'Image 11',
                'description': 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed',
                'image': '/Content/images/gallery-5.jpg'
            },
            {
                'title': 'Image 12',
                'description': 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed',
                'image': '/Content/images/gallery-6.jpg'
            }
        ],
        backgroundcolor: 'fff',
        mode: 'html5',
        item: 1,
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
reset();
