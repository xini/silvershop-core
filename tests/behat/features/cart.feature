@cart
Feature: Cart
  In order to select products for purchase
  As a visitor
  I want to be able to add and remove products to and from my cart

  Background:
    Given there are the following ProductCategory records
      apparel:
        Title: Apparel
        URLSegment: apparel
      stationery:
        Title: Stationery
        URLSegment: stationery
    And there are the following ProductAttributeType records
      shirtsize:
        Name: Shirt Size
        Label: Size
      shirtcolor:
        Name: Shirt Colour
        Label: Colour
    And there are the following Product records
      pens:
        Title: Ball Point Pens (7 pack)
        InternalItemID: abc123
        Price: 12
        Weight: 0.1
        Width: 5
        Height: 10
        Depth: 3
        Parent: =>ProductCategory.stationery
      tshirt:
        Title: T-Shirt
        InternalItemID: abc128
        Price: 25
        Parent: =>ProductCategory.apparel
        URLSegment: t-shirt
        AllowPurchase: 1
        Weight: 0.3
        Height: 28
        Width: 18.5
        Depth: 2
        Stock: 1000
        Content: <p>This popular t-shirt could make you popular.</p>
        VariationAttributeTypes: =>ProductAttributeType.shirtsize,=>ProductAttributeType.shirtcolor
    And there are the following ProductAttributeValue records
      shirtsize_large:
        Value: Large
        Type: =>ProductAttributeType.shirtsize
      shirtsize_medium:
        Value: Medium
        Type: =>ProductAttributeType.shirtsize
      shirtsize_small:
        Value: Small
        Type: =>ProductAttributeType.shirtsize
      shirtcolor_red:
        Value: Red
        Type: =>ProductAttributeType.shirtcolor
      shirtcolor_blue:
        Value: Blue
        Type: =>ProductAttributeType.shirtcolor
    And there are the following ProductVariation records
      tshirt_1:
        Product: =>Product.tshirt
        Price: 25
        InternalItemID: abc128-lr
        AttributeValues: =>ProductAttributeValue.shirtsize_large,=>ProductAttributeValue.shirtcolor_red
      tshirt_2:
        Product: =>Product.tshirt
        Price: 25
        InternalItemID: abc128-mb
        AttributeValues: =>ProductAttributeValue.shirtsize_medium,=>ProductAttributeValue.shirtcolor_blue
    Given a "page" "homepage" with "URL"="home"
    And a "CartPage" "cart" with "URL"="cart"
    And all pages are published

  Scenario: Seeing empty cart
    Given I am on "homepage"
    When I follow "View cart"
    Then I should be on the cart summary page
    And I should see "Your cart is empty"

  Scenario: Adding simple product to cart via list
    Given I am on the store homepage
    And I follow "T-Shirts"
    When I press "Add to cart"
    Then I should be on the cart summary page
    And I should see "Item has been added to cart."

  Scenario: Adding simple product to cart via product page
    Given I am on the store homepage
    And I follow "PHP T-Shirts"
    And I click "Git T-Shirt"
    When I press "Add to cart"
    Then I should be on the cart summary page
    And I should see "Item has been added to cart."

  Scenario: Added simple products appear on the cart summary
    Given I am on the store homepage
    And I follow "PHP T-Shirts"
    When I press "Add to cart"
    Then I should be on the cart summary page
    And I should see 1 item in the list

  Scenario: Correct unit price is displayed in cart summary
    Given I am on the store homepage
    And I follow "PHP T-Shirts"
    And I click "PHP Top"
    When I press "Add to cart"
    Then I should be on the cart summary page
    And I should see item with price "€5.99" in the list

  Scenario: Correct cart total is displayed after adding the item
    Given I am on the store homepage
    And I follow "PHP T-Shirts"
    And I click "PHP Top"
    When I press "Add to cart"
    Then I should be on the cart summary page
    And I should see 1 item in the list
    And "Grand total: €5.99" should appear on the page

  Scenario: Adding item and specifying the quantity
    Given I am on the store homepage
    And I follow "PHP T-Shirts"
    And I click "PHP Top"
    When I fill in "Quantity" with "3"
    And I press "Add to cart"
    Then I should be on the cart summary page
    And I should see 1 item in the list
    And "Grand total: €17.97" should appear on the page

  Scenario: Correct item total is displayed for each item
    Given I am on the store homepage
    And I follow "PHP T-Shirts"
    And I click "PHP Top"
    When I fill in "Quantity" with "2"
    And I press "Add to cart"
    Then I should be on the cart summary page
    And I should see item with total "€11.98" in the list

  Scenario: Adding product to cart by selecting just one option
    Given I am on the store homepage
    And I follow "PHP T-Shirts"
    And I click "Git T-Shirt"
    When I select "M" from "Size"
    And I press "Add to cart"
    Then I should be on the cart summary page
    And I should see "Item has been added to cart."

  Scenario: Adding product to cart by selecting multiple options
    Given I am on the store homepage
    And I follow "T-Shirts"
    And I click "Super T-Shirt"
    When I select "S" from "Size"
    And I select "Blue" from "Color"
    And I press "Add to cart"
    Then I should be on the cart summary page
    And I should see "Item has been added to cart."

  Scenario: Products added by selecting options appear on the cart summary
    Given I am on the store homepage
    And I follow "T-Shirts"
    And I click "Super T-Shirt"
    When I select "S" from "Size"
    And I select "Blue" from "Color"
    And I press "Add to cart"
    Then I should be on the cart summary page
    And I should see 1 item in the list

  Scenario: Correct cart total is displayed after adding the item by selecting options
    Given I am on the store homepage
    And I follow "T-Shirts"
    And I click "Super T-Shirt"
    When I select "S" from "Size"
    And I select "Blue" from "Color"
    And I press "Add to cart"
    Then I should be on the cart summary page
    And "Grand total: €20.00" should appear on the page

  Scenario: Adding same variant twice does not create new item
    Given I am on the product page for "Super T-Shirt"
    And I select "M" from "Size"
    And I press "Add to cart"
    When I go to the product page for "Super T-Shirt"
    And I select "M" from "Size"
    And I press "Add to cart"
    Then I should be on the cart summary page
    And I should see 1 cart item in the list
    And "Grand total: €40.00" should appear on the page
