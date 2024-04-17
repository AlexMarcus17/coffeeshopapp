import '../models/product.dart';

class Products {
  static List<Product> list = [
    Product(
        subtitle: "Intense Coffee Shot",
        categoryid: 1,
        name: "Espresso",
        imagepath: "assets/espresso.png",
        price: 4,
        isvegan: true,
        description:
            "A strong and concentrated shot of finely ground coffee beans, offering a bold and intense flavor.",
        isreward: true,
        tokenprice: 40,
        tokens: 8,
        decaff: true),
    Product(
        subtitle: "Powerful Caffeine Boost",
        categoryid: 1,
        name: "Double Espresso",
        imagepath: "assets/doubleespresso.png",
        price: 6.5,
        isvegan: true,
        description:
            "For those seeking an extra kick, our double espresso delivers twice the intensity and richness in a single cup.",
        isreward: false,
        tokenprice: 0,
        tokens: 13,
        decaff: true),
    Product(
        subtitle: "Smooth Italian Blend",
        categoryid: 1,
        name: "Cappuccino",
        imagepath: "assets/cappuccino.png",
        price: 6,
        isvegan: false,
        description:
            "A classic Italian favorite, our cappuccino combines equal parts espresso, steamed milk, and velvety milk foam, resulting in a balanced and creamy indulgence.",
        isreward: true,
        tokenprice: 60,
        tokens: 12,
        decaff: true),
    Product(
        subtitle: "Creamy Coffee Delight",
        categoryid: 1,
        name: "Cafe Latte",
        imagepath: "assets/caffelatte.png",
        price: 7,
        isvegan: false,
        description:
            "A harmonious blend of smooth espresso, steamed milk, and a thin layer of froth on top, creating a mellow and satisfying coffee experience.",
        isreward: false,
        tokenprice: 0,
        tokens: 14,
        decaff: true),
    Product(
        subtitle: "Layered Espresso Elegance",
        categoryid: 1,
        name: "Latte Macchiato",
        imagepath: "assets/lattemacchiato.png",
        price: 8,
        isvegan: false,
        description:
            "Layers of rich, steamed milk poured over a shot of espresso, topped with a touch of froth, creating a striking visual presentation and a delightful contrast of flavors.",
        isreward: false,
        tokenprice: 0,
        tokens: 16,
        decaff: true),
    Product(
        subtitle: "Rich Chocolate Espresso",
        categoryid: 1,
        name: "Mocha",
        imagepath: "assets/mocha.png",
        price: 9,
        isvegan: false,
        description:
            "A delightful fusion of espresso, steamed milk, and decadent chocolate syrup, creating a luscious and indulgent beverage with a hint of sweetness.",
        isreward: true,
        tokenprice: 90,
        tokens: 18,
        decaff: true),
    Product(
        subtitle: "Sweet Chocolate Caramel Bliss",
        categoryid: 1,
        name: "Caramel Mocha",
        imagepath: "assets/caramel.png",
        price: 9,
        isvegan: false,
        description:
            "Our irresistible mocha infused with a drizzle of velvety caramel, adding a delightful caramelized flavor to the classic combination of espresso and chocolate.",
        isreward: false,
        tokenprice: 0,
        tokens: 18,
        decaff: true),
    Product(
        subtitle: "Warm Cocoa Comfort",
        categoryid: 1,
        name: "Hot Chocolate",
        imagepath: "assets/hotchocolate.png",
        price: 6,
        isvegan: false,
        description:
            "Indulge in a rich and creamy blend of high-quality cocoa, steamed milk, and a touch of sweetness, delivering pure comfort in every sip.",
        isreward: true,
        tokenprice: 60,
        tokens: 12,
        decaff: false),
    Product(
        subtitle: "Dairy-Free Creamy Indulgence",
        categoryid: 1,
        name: "Vegan Latte",
        imagepath: "assets/vegan.png",
        price: 8.5,
        isvegan: true,
        description:
            "A plant-based twist on the classic latte, featuring smooth espresso combined with creamy almond milk for a dairy-free delight.",
        isreward: true,
        tokenprice: 85,
        tokens: 17,
        decaff: true),
    Product(
        subtitle: "Soothing Aromatic Infusion",
        categoryid: 1,
        name: "Hot Tea",
        imagepath: "assets/hottea.png",
        price: 5,
        isvegan: true,
        description:
            "Refreshing, aromatic blend of hot mint tea, a soothing infusion to uplift your senses.",
        isreward: true,
        tokenprice: 50,
        tokens: 10,
        decaff: false),
    Product(
        subtitle: "Bold & Refreshing Espresso",
        categoryid: 2,
        name: "Iced Americano",
        imagepath: "assets/icedamericano.png",
        price: 6,
        isvegan: true,
        description:
            "A bold and invigorating iced beverage made with espresso and chilled water, delivering a strong and refreshing coffee experience.",
        isreward: false,
        tokenprice: 0,
        tokens: 12,
        decaff: true),
    Product(
        subtitle: "Chilled Chocolate Coffee",
        categoryid: 2,
        name: "Iced Mocha",
        imagepath: "assets/icedmocha.png",
        price: 9,
        isvegan: false,
        description:
            "Indulge in the perfect combination of espresso, rich chocolate syrup, and chilled milk, resulting in a decadent and refreshing iced mocha delight.",
        isreward: false,
        tokenprice: 0,
        tokens: 18,
        decaff: true),
    Product(
        subtitle: "Sweet & Creamy Delight",
        categoryid: 2,
        name: "Iced Caramel Mocha",
        imagepath: "assets/icedcaramel.png",
        price: 9,
        isvegan: false,
        description:
            "Our irresistible iced mocha infused with a drizzle of velvety caramel, creating a delightful blend of chocolate, caramel, and espresso for a truly indulgent treat.",
        isreward: true,
        tokenprice: 90,
        tokens: 18,
        decaff: true),
    Product(
        subtitle: "Cool Dairy-Free Indulgence",
        categoryid: 2,
        name: "Iced Vegan Latte",
        imagepath: "assets/icedvegan.png",
        price: 8.5,
        isvegan: true,
        description:
            "A refreshing and creamy delight made with our signature espresso and almond milk, offering a dairy-free iced latte experience.",
        isreward: true,
        tokenprice: 85,
        tokens: 17,
        decaff: true),
    Product(
        subtitle: "Refreshing Herbal Quencher",
        categoryid: 2,
        name: "Iced Tea",
        imagepath: "assets/icedtea.png",
        price: 5,
        isvegan: true,
        description:
            "Experience the revitalizing sensation of chilled herbal tea infused with cooling mint leaves.",
        isreward: false,
        tokenprice: 0,
        tokens: 10,
        decaff: false),
    Product(
        subtitle: "Zesty Summer Refresher",
        categoryid: 2,
        name: "Lemonade",
        imagepath: "assets/lemonade.png",
        price: 5.5,
        isvegan: true,
        description:
            "Experience the perfect balance of zesty lemons and subtle sweetness in our refreshing homemade lemonade.",
        isreward: true,
        tokenprice: 55,
        tokens: 11,
        decaff: false),
    Product(
        subtitle: "Rich, Fluffy Delight",
        categoryid: 3,
        name: "Chocolate Donut",
        imagepath: "assets/chocolatedonut.png",
        price: 4,
        isvegan: false,
        description:
            "Indulge in our decadent chocolate donut, featuring a soft and fluffy texture with a rich cocoa flavor, creating a chocolate lover's dream.",
        isreward: false,
        tokenprice: 0,
        tokens: 8,
        decaff: false),
    Product(
        subtitle: "Classic, Sweet Treat",
        categoryid: 3,
        name: "Vanilla Donut",
        imagepath: "assets/vanilladonut.png",
        price: 4,
        isvegan: false,
        description:
            "Experience pure delight with our vanilla donut, boasting a light and airy texture and a delicate hint of vanilla, perfect for those seeking a classic treat.",
        isreward: true,
        tokenprice: 40,
        tokens: 8,
        decaff: false),
    Product(
        subtitle: "Irresistible Chocolate Chip",
        categoryid: 3,
        name: "Cookie",
        imagepath: "assets/cookie.png",
        price: 2.5,
        isvegan: true,
        description:
            "Treat yourself to our freshly baked cookie, with a golden brown exterior, a soft and chewy center, and delectable bursts of chocolate chips.",
        isreward: true,
        tokenprice: 25,
        tokens: 5,
        decaff: false),
    Product(
        subtitle: "Moist, Flavorful Indulgence",
        categoryid: 3,
        name: "Chocolate Muffin",
        imagepath: "assets/chocolatemuffin.png",
        price: 4,
        isvegan: true,
        description:
            "Dive into our moist and chocolatey muffin, packed with rich cocoa goodness and a tender crumb.",
        isreward: true,
        tokenprice: 40,
        tokens: 8,
        decaff: false),
    Product(
        subtitle: "Bursting with Blueberries",
        categoryid: 3,
        name: "Blueberry Muffin",
        imagepath: "assets/blueberrymuffin.png",
        price: 4,
        isvegan: true,
        description:
            "Enjoy the burst of fruity flavors with our blueberry muffin, featuring a fluffy texture and juicy blueberries.",
        isreward: false,
        tokenprice: 0,
        tokens: 8,
        decaff: false),
    Product(
        subtitle: "Heavenly Moist Bliss",
        categoryid: 3,
        name: "Chocolate Cake",
        imagepath: "assets/chocolatecake.png",
        price: 5.5,
        isvegan: false,
        description:
            "Delight in a heavenly slice of our chocolate cake, featuring layers of moist chocolate sponge and velvety chocolate frosting.",
        isreward: false,
        tokenprice: 0,
        tokens: 11,
        decaff: false),
    Product(
        subtitle: "Creamy Strawberry Delight",
        categoryid: 3,
        name: "Strawberry Cheesecake",
        imagepath: "assets/strawberrycheesecake.png",
        price: 5.5,
        isvegan: false,
        description:
            "Creamy delight with a buttery graham cracker crust, a smooth cheesecake filling, and a vibrant strawberry topping.",
        isreward: false,
        tokenprice: 0,
        tokens: 11,
        decaff: false),
  ];
  static List<Product> getbycategory(int categoryid, bool onlyvegan) {
    if (!onlyvegan)
      return list.where((element) => element.categoryid == categoryid).toList();
    else
      return list
          .where((element) =>
              element.categoryid == categoryid && element.isvegan == true)
          .toList();
  }

  static List<Product> getrewards(bool onlyvegan) {
    if (!onlyvegan)
      return list.where((element) => element.isreward == true).toList();
    else
      return list
          .where(
              (element) => element.isreward == true && element.isvegan == true)
          .toList();
  }
}
