<?php

namespace SilverShop\Page;

use PageController;
use SilverShop\Extension\ViewableCartExtension;
use SilverShop\Forms\CartForm;
use SilverStripe\View\Requirements;

/**
 * Class CartPageController
 *
 * @mixin ViewableCartExtension
 */
class CartPageController extends PageController
{
    private static $url_segment = 'cart';

    private static $allowed_actions = [
        'CartForm',
        'updatecart',
    ];

    public function init()
    {
        parent::init();

        Requirements::css('silvershop/core:client/dist/css/style.css');
    }

    /**
     * Display a title if there is no model, or no title.
     */
    public function Title()
    {
        if ($this->getFailover()->Title) {
            return $this->getFailover()->Title;
        }
        return _t('SilverShop\Page\CartPage.DefaultTitle', 'Shopping Cart');
    }

    /**
     * A form for updating cart items
     */
    public function CartForm()
    {
        $cart = $this->Cart();
        if (!$cart) {
            return false;
        }
        $form = CartForm::create($this, 'CartForm', $cart);

        $this->extend('updateCartForm', $form);

        return $form;
    }
}
