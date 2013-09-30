(function () {
    function onDone(result, form) {
        if (result.success) {
            onSuccess(result.message, form);
        } else {
            onError(result.message);
        }
    }

    function onSuccess(message, form) {
        form[0].reset();
        userMessages.addSuccess(message);
    }
    
    function onError(message) {
        userMessages.addError(message || "Sorry there has been an error, please try again later.");
    }

    function postFormData(url, form) {
        var data = form.serialize();
        
        $.post(url, data)
            .done(function (result) {
                onDone(result, form);
            }).fail(function () {
                onError();
            }).always(function () {
            });
    }
    
    function attacheHandlers() {
        var $form = $('form.autobind'),
            $link = $('form.autobind > a.btn-primary'),
            url = $link.data('url');
        
        if ($form && $link) {
            $link.click(function () {
                if ($form.valid()) {
                    postFormData(url, $form);
                }
            });
        }
    }

    $(document).ready(function () {
        attacheHandlers();
    });
})();