{% extends 'markdown.tpl' %}

{% block header %}---
{%- for key, value in nb.metadata.hugo.items() %}
{{ key }}:
{%- if value is string and key != 'date' -%}
{{ ' "' ~ value }}"
{%- elif value is sameas true -%}
{{ ' true' }}
{%- elif value is sameas false -%}
{{ ' false' }}
{%- else -%}
{{ ' ' ~ value }}
{%- endif -%}
{%- endfor %}
---
{% endblock header %}

{%- block any_cell scoped -%}
{{ '{{% jupyter_cell_start' }} {{ cell.cell_type }} {{ '%}}' }}
{{ super() }}
{{ '{{% jupyter_cell_end %}}' }}
{%- endblock any_cell -%}

{% block input %}
{{ '{{% jupyter_input_start %}}' }}
{{ super() }}
{{ '{{% jupyter_input_end %}}' }}
{% endblock input %}

{% block data_png %}
{{ '{{< figure src="' }}{{ output.metadata.filenames["image/png"] | path2url }}{{'" >}}' }}
{% endblock data_png %}
