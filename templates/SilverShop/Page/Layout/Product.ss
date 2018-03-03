<div class="shop-layout">
    <div class="shop-product">
        <h1>$Title</h1>

        <div class="shop-breadcrumbs">
            $Breadcrumbs
        </div>

        <div class="shop-product__details">
            <% if $Image.ContentImage %>
                <img class="shop-product__image" src="$Image.ContentImage.URL" alt="<%t SilverShop\Page\Product.ImageAltText "{Title} image" Title=$Title %>" />
            <% else %>
                <div class="shop-product__imageplaceholder">
                    <%t SilverShop\Page\Product.NoImage "no image" %>
                </div>
            <% end_if %>

            <% if $InternalItemID %>
                <p class="shop-product__internalid">
                    <span class="shop-product__details--title"><%t SilverShop\Page\Product.Code "Product Code" %>:</span>
                    <span class="shop-product__details--value">{$InternalItemID}</span>
                </p>
            <% end_if %>
            <% if $Model %>
                <p class="shop-product__model">
                    <span class="shop-product__details--title"><%t SilverShop\Page\Product.Model "Model" %>:</span>
                    <span class="shop-product__details--value">$Model.XML</span>
                </p>
            <% end_if %>
            <% if $Size %>
                <p class="shop-product__size">
                    <span class="shop-product__details--title"><%t SilverShop\Page\Product.Size "Size" %>:</span>
                    <span class="shop-product__details--value">$Size.XML</span>
                </p>
            <% end_if %>
            <% include SilverShop\Includes\Price %>
            <% if $IsInCart %>
                <p class="shop-product__cart">
                    <% if $Item.Quantity == 1 %>
                        <%t SilverShop\Page\Product.NumItemsInCartSingular "You have this item in your cart" %>
                    <% else %>
                        <%t SilverShop\Page\Product.NumItemsInCartPlural "You have {Quantity} items in your cart" Quantity=$Item.Quantity %>
                    <% end_if %>
                </p>
            <% end_if %>
            $Form
        </div>
        <% if $Content %>
            <div class="shop-product__content">
                $Content
            </div>
        <% end_if %>
    </div>
    <% include SilverShop\Includes\SideBar %>
</div>
