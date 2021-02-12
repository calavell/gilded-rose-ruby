# Gilded Rose Tech Test

"Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

All items have a SellIn value which denotes the number of days we have to sell the item. All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

- Once the sell by date has passed, Quality degrades twice as fast
- The Quality of an item is never negative
- “Aged Brie” actually increases in Quality the older it gets
- The Quality of an item is never more than 50
- “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
- “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

* “Conjured” items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we’ll cover for you)."

## Running the app

- Clone this repository to your local machine.
- ```cd``` into the project directory.
- Run ```bundle install```.
- If you do not have bundler on your local machine, run  ```rspec --init```  in the commandline to intall the testing suite.
- To run your tests, run  ```rspec```  in the command line and the output will show in your terminal.
- To run that app, from within the root directory run  ```irb -r './lib/shop.rb'```
- There are 4 types of products you can currently supply to the shop, brie, backstage passes, sulfuras, and conjured goods. To begin stocking the shop, you need to first create some products. Each product has a name, a sellin figure, and a quality figure. The name can be any string, the sellin figure can be a positive integer, the quality must be a positive integer 50 or lower.
- To create product instances

```brie = Item.new('Aged Brie', 10, 20)```

```pass = Item.new('Backstage pass', 16, 23)```

```sulfuras = Item.new('Sulfuras', 8, 46)```

```conjured = Item.new('Conjured', 43, 30)```

```car = Item.new('Car', 43, 30)```

- To create a shop which has these products in stock:

``` gilded_rose = Shop.new([brie, pass, sulfuras, conjured, car])```

- To update the stock of the shop, run  ```gilded_rose.update_quality```
- To verify the result, run ```gilded_rose.items``` and you will see the list of stock with the adjusted quality and sellin values.

## Approach
My approach to this challenge was to optimise a strong object oriented design which would stick to the solid principals. I wanted to create a functionality for any 'basic products'. This would decrease in sellin value by 1 each day, and that would decrease in value by 1 each day unless the sellin was negative in which case it would decrease by 2, while sticking to the maximum and minimum quantity values of 50 and 0. I also wanted to create a sort of 'template' layout so that it will be straightforward to add in any new products with particular properties.


## Code Structure
The core of the project is based on the shop class and the item class. I initially stuck to those classes and built all of the functionality out within the shop class which would update all of its items' quality and sellin values itself. I then realised that it would be more appropriate for the item class to be responsible for changing its own state. This led me to extracting modules for each product type, and these modules being applied to specific instances of the item class depending on their name.

As there was a similar flow and certain 'standard' rules, I created a module called 'StandardProcedures' which I then imported into each product module. Using polymorphism, I created specific update_item methods which would act differently for each product.
