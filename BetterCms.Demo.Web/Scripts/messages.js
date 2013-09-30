var userMessages  = (function () {

    function userMessagesContainer(container) {

        var userMessages = {},
            $container = $(container);

        userMessages.showAndRemove = function (options) {
            
            var target = $(options.container),
                time = options.removeAfter || 3000,
                dataKey = 'TempIntervalId',
                intervalId = target.data(dataKey),

                fadeInCallback = function () {

                    if (time > 0) {

                        clearInterval(intervalId);

                        intervalId = setTimeout(function () {
                            target.fadeOut(function () {
                                target.empty();
                                if (typeof options.callback === 'function') {
                                    options.callback();
                                };
                            });
                        }, time);
                    };

                    target.data(dataKey, intervalId);
                };

            target.hide()
                .html(options.data)
                .fadeIn(fadeInCallback);
        };
        
        userMessages.addError = function (message) {
            userMessages.clearAll();

            $container.find('.error-user-message-container').show();
            userMessages.showAndRemove({
                container: $container.find('.error.user-message'),
                data: '<p>' + message + '</p>',
                callback: function () {
                    $container.find('.error-user-message-container').hide();
                }
            });
        };

        userMessages.addSuccess = function (message) {
            userMessages.clearAll();
            
            $container.find('.success-user-message-container').show();
            userMessages.showAndRemove({
                container: $container.find('.success.user-message'),
                data: '<p>' + message + '</p>',
                callback: function () {
                    $container.find('.success-user-message-container').hide();
                }
            });

            return userMessages;
        };

        userMessages.clearErrors = function () {
            $container.find('.error.user-message').empty();
            $container.find('.error-user-message-container').hide();
        };

        userMessages.clearSuccess = function () {
            $container.find('.success.user-message').empty();
            $container.find('.success-user-message-container').hide();
            return userMessages;
        };

        userMessages.clearAll = function () {
            userMessages.clearErrors();
            userMessages.clearSuccess();
        };

        return userMessages;
    }

    return userMessagesContainer($('.default-messages-container'));

}());