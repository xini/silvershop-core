<div class="shop-sidebar">
    <% if $GroupsMenu %>
        <% include SilverShop\Includes\ProductMenu %>
    <% else %>
        <% with $Parent %>
            <% include SilverShop\Includes\ProductMenu %>
        <% end_with %>
    <% end_if %>

    <div class="shop-sidebar__cart">
        <% include SilverShop\Cart\SideCart %>
    </div>
</div>
