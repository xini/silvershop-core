Feature: Browse By Category
  In order to see products I might want to buy
  As a potential customer
  I want to browse products in a category and to add or remove them from my shopping cart

  Background:
    Given a "product category" "Shirts"
    And there are "15" products in "Shirts"
    And the page size is "10"
    And I am on "Shirts"

  Scenario: First Viewing
    Then I should see 10 ".productItem" elements

  Scenario: Sorting
    When I click "Price" in the ".sorter" element
    Then the products should be ordered by price

  Scenario: Paging
    When I click "next" in the "#PageNumbers" element
    Then I should see 10 ".productItem" elements

  Scenario: Add to Cart
    When I click "Add to Cart" in the ".productItem" element
    Then I should see "There is 1 item in your cart."

# TODO: I think the following should be default behaviours but that should go in a separate unit of work
    #And I should see "Remove from Cart"

#  Scenario: Remove from Cart
#    When I click "Add to Cart"
#    And I click "Remove from Cart"
#    Then I should not see "Remove from Cart"
#    And I should see "There is 1 item in your cart."
