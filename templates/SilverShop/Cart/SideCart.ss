<div class="shop-sidecart">
    <h3><%t SilverShop\Cart\ShoppingCart.Headline "Shopping cart" %></h3>

    <% if $Cart %>
        <% with $Cart %>
            <p class="shop-sidecart__itemcount">
                <% if $Items.Plural %>
                    <%t SilverShop\Cart\ShoppingCart.ItemsInCartPlural 'There are <a href="{link}">{quantity} items</a> in your cart.' link=$Top.CartLink quantity=$Items.Quantity %>
                <% else %>
                    <%t SilverShop\Cart\ShoppingCart.ItemsInCartSingular 'There is <a href="{link}">1 item</a> in your cart.' link=$Top.CartLink %>
                <% end_if %>
            </p>

            <div class="shop-sidecart__checkout">
                <a href="$Top.CheckoutLink"><%t SilverShop\Cart\ShoppingCart.Checkout "Checkout" %></a>
            </div>

            <% loop $Items %>
                <div class="shop-sidecart__item $EvenOdd $FirstLast">
                    <% if $Product.Image %>
                        <div class="shop-sidecart__image">
                            <a href="$Product.Link" title="<%t SilverShop\Generic.ReadMoreTitle "Click here to read more on &quot;{Title}&quot;" Title=$Title %>">
                                <% with $Product %>$Image.setWidth(45)<% end_with %>
                            </a>
                        </div>
                    <% end_if %>
                    <p class="shop-sidecart__title">
                        <a href="$Product.Link" title="<%t SilverShop\Generic.ReadMoreTitle "Click here to read more on &quot;{Title}&quot;" Title=$Title %>">
                            $TableTitle
                        </a>
                    </p>
                    <p class="shop-sidecart__quantityprice"><span class="shop-sidecart__quantity">$Quantity</span> <span class="shop-sidecart__times">x</span> <span class="shop-sidecart__unitprice">$UnitPrice.Nice</span></p>
                    <% if $SubTitle %><p class="shop-sidecart__subtitle">$SubTitle</p><% end_if %>
                    <a class="shop-sidecart__remove" href="$removeallLink" title="<%t SilverShop\Cart\ShoppingCart.RemoveTitle "Remove &quot;{Title}&quot; from your cart." Title=$TableTitle %>">x</a>
                </div>
            <% end_loop %>
        <% end_with %>
    <% else %>
        <div class="alert alert-warning">
            <p><%t SilverShop\Cart\ShoppingCart.NoItems "There are no items in your cart." %></p>
        </div>
    <% end_if %>
</div>
