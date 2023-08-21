class Product {
  final int id, price;
  final String title, subtitle, description, image;

  Product({
    required this.id,
    required this.price,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.description,
  });
}

List<Product> products = [
  Product(
    id: 1,
    price: 600,
    title: 'Apple Headphone',
    subtitle: 'Apple AirPods Lightning Headphones - White',
    image: 'assets/shop3.jpg',
    description: """Unlike traditional circular earbuds,
        EarPods are designed to fit the details of the ear structure,
        making them comfortable for many compared to other earbuds.
        The speakers inside EarPods are designed to increase and reduce audio output,
        giving you high-quality sound.
        EarPods with Lightning connector also have a built-in remote control that lets you adjust the volume
        control music and video playback, and answer or end calls by simply holding your fingers on the wire.""",
  ),
  Product(
      id: 2,
      price: 1000,
      title: 'Smart Watch',
      subtitle:
          'New luxury 4G wifi smartwatch Lokmat applp 3 pro with 5mp GPS camera,',
      image: 'assets/smartwatch.jpg',
      description:
          """chronograph, calendar, alarm clock, week, month, world time,
            electricity reserve, sleep tracking, speed measurement,
            fitness tracker, calculators, pedometer, call reminder, 
           answer call, promotional messages, mood detector,
            reminder messages, dial dial, heart rate tracker,
            interactive music, 24-hour instructions, permanent notepad, 
           blood oxygen monitor, gps navigation, payment"""),
  Product(
      id: 3,
      price: 700,
      title: 'Air Headphone',
      subtitle:
          'New Product Tws K55 Earbuds Wireless Gaming Headphones 49 Hifi 9d Stereo Headphones',
      image: 'assets/airpods.jpeg',
      description: """1. Color: Black
               2. Version: From
               3. Distance: 10m/32.81ft
               4. Decryption format support: support HFP, HSP, A2DP, AVRCP
               5. Binaural call: support
               6. Standby Time: Our H
               7. Use time: 4-6 hours
               8. Headphone battery capacity: 40mAh
               9. Shipping container battery capacity: , mAh
               10. Headphone charging time: 45 minutes
               11. Charging time to charge the shipping cart: 8000 H""")
];
