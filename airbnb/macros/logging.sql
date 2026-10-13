{% macro learn_logging() %}
    {{ log("Call your mom!", info=True) }} {# Logs to the screen, too #}
    {{ log("Call your dad!1", info=True) }} {# Logs to the screen, too #}
--  {{ log("Call your dad!2", info=True) }} {# This will be logged to the screen #}
    {# log("Call your dad!3", info=True) #} {# This won't be executed #}
{% endmacro %}