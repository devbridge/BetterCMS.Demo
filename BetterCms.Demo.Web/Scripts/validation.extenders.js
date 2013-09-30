(function () {
    $(function () {

        $.validator.setDefaults({
            ignore: ''
        });

        function setValidationValues(options, ruleName, value) {
            options.rules[ruleName] = value;
            if (options.message) {
                options.messages[ruleName] = options.message;
            }
        };

        $.validator.unobtrusive.adapters.add('customemail', [], function (options) {
            setValidationValues(options, 'customemail', []);
        });

        $.validator.addMethod('customemail', function (value, element) {
            return this.optional(element) || /^([ ])*([a-zA-Z0-9_\-\.\+]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)([ ])*$/.test(value);
        });

        $('form').each(function () {
            var form = $(this);
            form.removeData("validator");
            form.removeData("unobtrusiveValidation");

            $.validator.unobtrusive.parse(form);
        });
    });
})();