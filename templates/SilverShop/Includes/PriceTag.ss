<div class="shop-pricetag">
    <% if $DiscountedPrice %>
        <span class="shop-pricetag__original shop-pricetag__strikeout">
            <span class="shop-pricetag__symbol">$Price.Symbol</span>
            <strong class="shop-pricetag__main">$Price.Main</strong>
            <small class="shop-pricetag__fractional">$Price.Fractional</small>
            <span class="shop-pricetag__code">$Price.CurrencyCode</span>
        </span>
        <span class="shop-pricetag__discounted">$DiscountedPrice.Nice</span> <%t SilverShop\Includes\PriceTag.SAVE "Save" %>: <span class="shop-pricetag__savings">$DiscountedPrice.Savings</span>
    <% else %>
        <span class="shop-pricetag__original"><strong class="shop-pricetag__price">$Price.Nice</strong></span>
    <% end_if %>
    <% if $RecommendedPrice %><span class="shop-pricetag__recommended">$RecommendedPrice.Nice</span><% end_if %>
</div>
