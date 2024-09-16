{{ header }}

<p>Hi Admin!</p>
<p>Payment received from {{ account_name }}:</p>
<p>Account: {{ account_name }} ({{ account_email }})</p>
<p>Package: <strong>{{ package_name }}</strong></p>
<p>Price: <strong>{{ package_price_per_credit | price_format }}/credit</strong></p>
<p>Total: <strong>{{ package_price | price_format }} for {{ package_number_of_listings }} credits {% if package_percent_discount > 0 %} (Save {{ package_percent_discount }}%) {% endif %}</strong></p>

{{ footer }}
