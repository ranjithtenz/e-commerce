Feature: Creating Products

  Affinchè gli utenti (buyer) possano avere dei prodotti da scegliere 
  Come utente (administrator) 
  Voglio creare facilmente i prodotti in vendita nel mio negozio. 
  
Background: 
  Given I am on the homepage
  And I follow "Go To Store Admin" 
  And I follow "Products"
  And I follow "Add New Product"
  And I fill in "Describe your product" with "Delicious vegetables used among other things, for the Tzazichi-Sauce"
  And I fill in "Selling price" with "1.50"
  And I fill in "Inventory" with "10"
  
Scenario: Create a product
  And I fill in "Product title" with "Cucumbers"
  When I press "Create Product"
  Then I should see "Cucumbers was successful created! View it in your store or continue and create another product"

Scenario: Creating an invalid product(without title)
  And I press "Create Product"
  Then I should not see "Cucumbers was successful created! View it in your store or continue and create another product"
  And I should see "Title can't be blank"

Scenario: Creating an invalid product(with wrong inventory number)
   And I fill in "Inventory" with "wibble"
   And I fill in "Product title" with "Cucumbers"
   And I press "Create Product"
   Then I should not see "Cucumbers was successful created! View it in your store or continue and create another product"
   And I should see "Qty is not a number"
   
@javascript
Scenario: Creating a product with an attachment
	And I fill in "Product title" with "Cucumbers"
	And I follow "Add product images"
	And I attach the file "spec/fixtures/snort.txt" to "product_assets_attributes_0_image"
	And I press "Create Product"
	Then I should see "Cucumbers was successful created! View it in your store or continue and create another product"
    
