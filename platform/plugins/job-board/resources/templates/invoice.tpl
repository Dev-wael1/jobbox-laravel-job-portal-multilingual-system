<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>{{ 'plugins/job-board::invoice.heading'|trans }} - #{{ invoice.code }}</title>
    {% if settings.using_custom_font_for_invoice %}
        <link href="https://fonts.googleapis.com/css2?family={{ settings.custom_font_family | urlencode }}:wght@400;500;600;700;900&display=swap" rel="stylesheet">
    {% endif %}
    <style>
        body {
            font-size: 15px;
            font-family: '{{ settings.font_family }}', Arial, sans-serif !important;
        }

        table {
            border-collapse: collapse;
            width: 100%
        }

        table tr td {
            padding: 0
        }

        table tr td:last-child {
            text-align: right
        }

        .bold, strong, b, .total, .stamp {
            font-weight: 700
        }

        .right {
            text-align: right
        }

        .large {
            font-size: 1.75em
        }

        .total {
            color: #fb7578;
        }

        .logo-container {
            margin: 20px 0 50px
        }

        .invoice-info-container {
            font-size: .875em
        }

        .invoice-info-container td {
            padding: 4px 0
        }

        .line-items-container {
            font-size: .875em;
            margin: 70px 0
        }

        .line-items-container th {
            border-bottom: 2px solid #ddd;
            color: #999;
            font-size: .75em;
            padding: 10px 0 15px;
            text-align: left;
            text-transform: uppercase
        }

        .line-items-container th:last-child {
            text-align: right
        }

        .line-items-container td {
            padding: 10px 0
        }

        .line-items-container tbody tr:first-child td {
            padding-top: 25px
        }

        .line-items-container.has-bottom-border tbody tr:last-child td {
            border-bottom: 2px solid #ddd;
            padding-bottom: 25px
        }

        .line-items-container th.heading-quantity {
            width: 50px
        }

        .line-items-container th.heading-price {
            text-align: right;
            width: 100px
        }

        .line-items-container th.heading-subtotal {
            width: 100px
        }

        .payment-info {
            font-size: .875em;
            line-height: 1.5;
            width: 38%
        }

        small {
            font-size: 80%
        }

        .stamp {
            border: 2px solid #555;
            color: #555;
            display: inline-block;
            font-size: 18px;
            left: 30%;
            line-height: 1;
            opacity: .5;
            padding: .3rem .75rem;
            position: fixed;
            text-transform: uppercase;
            top: 40%;
            transform: rotate(-14deg)
        }

        .is-failed {
            border-color: #d23;
            color: #d23
        }

        .is-completed {
            border-color: #0a9928;
            color: #0a9928
        }
    </style>

    {{ invoice_header_filter | raw }}
</head>
<body>
{% if settings.enable_invoice_stamp %}
    {% if invoice.status == 'canceled' %}
        <span class="stamp is-failed">
            {{ invoice.status }}
        </span>
    {% else %}
        <span class="stamp {% if invoice.payment.status == 'completed' %} is-completed {% else %} is-failed {% endif %}">
            {{ invoice.payment.status }}
        </span>
    {% endif %}
{% endif %}

<table class="invoice-info-container">
    <tr>
        <td>
            <p>
                <strong>{{ 'plugins/job-board::invoice.heading'|trans }}</strong>: #{{ invoice.code }}
            </p>
            <div class="logo-container">
                {% if logo %}
                    <img src="{{ logo_full_path }}" style="max-height: 150px;" alt="{{ settings.company_name_for_invoicing }}">
                {% endif %}
            </div>
        </td>
        <td>
            <p>
                <strong>{{ invoice.created_at|date('F d, Y') }}</strong>
            </p>
            <div class="logo-container">
                {% if invoice.company_logo %}
                    <img src="{{ company_logo_full_path }}" style="max-height: 60px;" alt="{{ invoice.company_name }}">
                {% endif %}
            </div>
        </td>
    </tr>
</table>

<table class="invoice-info-container">
    <tr>
        <td>
            <p>{{ settings.company_name_for_invoicing }}</p>
            <p>{{ settings.company_address_for_invoicing }}</p>
            <p>{{ settings.company_email_for_invoicing }}</p>
            <p>{{ settings.company_phone_for_invoicing }}</p>
        </td>
        <td>
            <p>{{ invoice.company_name }}</p>
            <p>{{ invoice.customer_name }}</p>
            <p>{{ invoice.customer_address }}</p>
            <p>{{ invoice.customer_phone }}</p>
            {% if tax_id %}
                <p>
                    <strong>{{ 'plugins/job-board::invoice.detail.tax_id'|trans }}:</strong>
                    {{ tax_id }}
                </p>
            {% endif %}
        </td>
    </tr>
</table>

<table class="line-items-container">
    <thead>
    <tr>
        <th class="heading-description">{{ 'plugins/job-board::invoice.detail.description'|trans }}</th>
        <th class="heading-quantity">{{ 'plugins/job-board::invoice.detail.qty'|trans }}</th>
        <th class="heading-price">{{ 'plugins/job-board::invoice.detail.amount'|trans }}</th>
        <th class="heading-subtotal">{{ 'plugins/job-board::invoice.total_amount'|trans }}</th>
    </tr>
    </thead>
    <tbody>
    {% for item in invoice.items %}
        <tr>
            <td>
                <p>{{ item.name }}</p>
                {% if item.description %}
                <small>{{ item.description }}</small>
                {% endif %}
            </td>
            <td>{{ item.qty }}</td>
            <td class="right">{{ item.sub_total|price_format }}</td>
            <td>{{ (item.amount * item.qty)|price_format }}</td>
        </tr>
    {% endfor %}

    {% if (invoice.amount != invoice.sub_total) %}
        <tr>
            <td colspan="3" class="right">
                {{ 'plugins/job-board::invoice.detail.sub_total'|trans }}
            </td>
            <td class="bold">
                {{ invoice.sub_total|price_format }}
            </td>
        </tr>
    {% endif %}

    {% if invoice.tax_amount %}
        <tr>
            <td colspan="3" class="right">
                {{ 'plugins/job-board::invoice.detail.tax'|trans }}
            </td>
            <td class="bold">
                {{ invoice.tax_amount|price_format }}
            </td>
        </tr>
    {% endif %}

    {% if invoice.shipping_amount %}
        <tr>
            <td colspan="3" class="right">
                {{ 'plugins/job-board::invoice.detail.shipping_fee'|trans }}
            </td>
            <td class="bold">
                {{ invoice.shipping_amount|price_format }}
            </td>
        </tr>
    {% endif %}

    {% if invoice.discount_amount %}
        <tr>
            <td colspan="3" class="right">
                {{ 'plugins/job-board::invoice.detail.discount'|trans }}
            </td>
            <td class="bold">
                {{ invoice.discount_amount|price_format }}
            </td>
        </tr>
    {% endif %}

    <tr>
        <td colspan="3" class="right">
            {{ 'plugins/job-board::invoice.detail.total'|trans }}
        </td>
        <td class="bold">
            {{ invoice.amount|price_format }}
        </td>
    </tr>
    </tbody>
</table>

<table class="line-items-container">
    <thead>
    <tr>
        <th>{{ 'plugins/job-board::invoice.payment_info'|trans }}</th>
        <th>{{ 'plugins/job-board::invoice.total_amount'|trans }}</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td class="payment-info">
            <div>
                {{ 'plugins/job-board::invoice.payment_method'|trans }}: <strong>{{ payment_method }}</strong>
            </div>
            <div>
                {{ 'plugins/job-board::invoice.payment_status'|trans }}: <strong>{{ payment_status }}</strong>
            </div>
            {% if payment_description %}
            <div>
                {{ 'plugins/job-board::invoice.payment_info'|trans }}: <strong>{{ payment_description }}</strong>
            </div>
            {% endif %}
        </td>
        <td class="large total">{{ invoice.amount|price_format }}</td>
    </tr>
    </tbody>
</table>
{{ job_board_invoice_footer | raw }}
</body>
</html>
