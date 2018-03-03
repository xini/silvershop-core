<div class="shop-layout">
    <div class="shop-productgroup">
        <h1 class="shop-pagetitle">$Title</h1>

        <% if $Content %>
            <div class="shop-productgroup__content">
                $Content
            </div>
        <% end_if %>

        <% if $Products %>
            <div id="shop-productlist" class="shop-productgroup__category">
                <ul>
                    <% loop $Products %>
                        <% include SilverShop\Includes\ProductGroupItem %>
                    <% end_loop %>
                </ul>

                <% include SilverShop\Includes\ProductGroupPagination %>
            </div>
        <% end_if %>
    </div>

    <% include SilverShop\Includes\SideBar %>
</div>
