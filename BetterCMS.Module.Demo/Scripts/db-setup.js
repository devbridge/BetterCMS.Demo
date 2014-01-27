$(function () {
    var selectors = {
        servername: '#bcms-server-name',
        databaseName: '#bcms-database-name',
        createDatabase: '#bcms-create-database',
        integratedSecurity: '#bcms-integrated-security',
        username: '#bcms-username',
        password: '#bcms-password',
        testConnectionButton: '#bcms-test-connection',
        connectionString: '#bcms-connection-string',
        connectionStringBox: '#bcms-connection-string-box',
        advancedUser: '#bcms-advanced-user',
        userCredentials: '.bcms-user-credentials',
        configurationFields: '.bcms-configuration-field',
        successMessageContainer: '.bcms-messages ul.bcms-success-messages',
        errorMessageContainer: '.bcms-messages ul.bcms-error-messages',
        submit: '#bcms-submit-configuration'
    };

    function recreateConnectionString() {
        var serverName = $(selectors.servername).val() || '{ServerName}',
            databaseName = $(selectors.databaseName).val() || '{DatabaseName}',
            createDatabase = $(selectors.createDatabase).val(),
            isIntegratedSecurity = $(selectors.integratedSecurity).attr('checked'),
            username = $(selectors.username).val() || '{UserName}',
            password = $(selectors.password).val() || '{Password}',
            connectionString = 'Server=' + serverName + ';Database=' + databaseName + ';';

        if (isIntegratedSecurity) {
            connectionString += "Integrated Security=SSPI;";
        } else {
            connectionString += 'User Id=' + username + ';Password=' + password + ';';
        }

        $(selectors.connectionString).val(connectionString);
    }

    function showHideUserCredentials() {
        var self = $(selectors.integratedSecurity),
            checked = self.attr('checked');

        if (checked) {
            $(selectors.userCredentials).hide();

            $(selectors.username).val('');
            $(selectors.password).val('');
        } else {
            $(selectors.userCredentials).show();
        }
    }

    function showHideConnectionString() {
        var self = $(selectors.advancedUser),
            checked = self.attr('checked');

        if (checked) {
            $(selectors.configurationFields).hide();
            $(selectors.connectionStringBox).show();

            recreateConnectionString();
        } else {
            $(selectors.configurationFields).show();
            $(selectors.connectionStringBox).hide();

            $(selectors.connectionString).val('');
            showHideUserCredentials();
        }
    }

    function submitForm(url, onSuccess) {
        var form = $('form'),
            onComplete = function (json) {
                form.hideLoading();

                var successMessages = $(selectors.successMessageContainer),
                    errorMessages = $(selectors.errorMessageContainer);

                successMessages.find('li').remove();
                errorMessages.find('li').remove();

                successMessages.hide();
                errorMessages.hide();

                if ($.isArray(json.Messages) && json.Messages.length > 0) {
                    if (json.Success) {
                        successMessages.show();
                        successMessages.append($('<li>').html(json.Messages[0]));
                        
                        if (onSuccess && $.isFunction(onSuccess)) {
                            onSuccess();
                        }
                    } else {
                        errorMessages.show();
                        errorMessages.append($('<li>').html(json.Messages[0]));
                    }
                }
            };

        form.showLoading();
        
        $.ajax({
            type: 'POST',
            url: url,
            contentType: 'application/x-www-form-urlencoded',
            dataType: 'json',
            data: form.serialize()
        })
            .done(function (json) {
                onComplete(json);
            })
            .fail(function () {
                onComplete({
                    Success: false,
                    Messages: 'Failed to submit form.'
                });
            });
    }

    function testConnection() {
        submitForm('bcms-test-connection');

        return false;
    }

    function submit() {
        submitForm('bcms-setupdb', function () {
            setTimeout(function () {
                $('form').hide();
                window.location.href = "/";
            }, 1000);
        });

        return false;
    }

    $(selectors.servername).focus();
    $(selectors.integratedSecurity).on('change', showHideUserCredentials);
    $(selectors.advancedUser).on('change', showHideConnectionString);
    $(selectors.testConnectionButton).on('click', testConnection);
    $(selectors.submit).on('click', submit);

    showHideUserCredentials();
    showHideConnectionString();
});