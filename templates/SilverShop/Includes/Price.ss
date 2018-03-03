<% if $PriceRange %>
	<div class="shop-product__price">
		<strong class="shop-product__price--value">$PriceRange.Min.Nice</strong>

        <% if $PriceRange.HasRange %>
			- <strong class="shop-product__price--value">$PriceRange.Max.Nice</strong>
		<% end_if %>
		<span class="shop-product__price--currency">$Price.Currency</span>
	</div>
<% else_if $Price %>
	<div class="shop-product__price">
		<strong class="shop-product__price--value">$Price.Nice</strong> <span class="shop-product__price--currency">$Price.Currency</span>
	</div>
<% end_if %>
