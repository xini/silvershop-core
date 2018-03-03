<?php

namespace SilverShop\Page;

use PageController;
use SilverShop\Forms\AddProductForm;
use SilverStripe\View\Requirements;

class ProductController extends PageController
{
    private static $allowed_actions = [
        'Form',
        'AddProductForm',
    ];

    public function Form()
    {
        $form = AddProductForm::create($this, 'Form');
        $this->extend('updateForm', $form);
        return $form;
    }

    public function init()
    {
        parent::init();

        Requirements::css('silvershop/core:client/dist/css/style.css');
    }
}
