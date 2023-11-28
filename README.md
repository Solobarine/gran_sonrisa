# Table of Content

- [Welcome](#welcome)
  - [Welcome to Gran Sonrisa](#welcome-to-gran-sonrisa-your-ultimate-car-purchasing-solution)
  - [Why Choose Gran Sonrisa](#why-choose-gran-sonrisa)
- [Technologies Used](#📋-technologies-used)
- [Key Features](#📜-key-features)
  - [User Roles](#👨‍💻🧑‍💻-user-roles)
  - [User Authentication](#🔐-user-authentication)
  - [Customer Features](#👥-customer-features)
  - [Admin Features](#👤-admin-features)
    - [Car Management](#🚙🚗-car-management)
    - [Admin Dashboard](#📊📈-admin-dashboard)
- [Installation](#💻-installation)
- [Author](#👤-author)
- [Contributing](#🤝-contributing)
- [Show Your Support](#🙏-show-your-support)
- [License](#📝-license)
- [Contact Us](#📧-contact-us)

## Welcome

### Welcome to Gran Sonrisa: Your Ultimate Car Purchasing Solution

Experience the future of car buying with Gran Sonrisa—an all-inclusive destination designed to revolutionize the way you explore, compare, and acquire new cars. We're dedicated to convenience, transparency, and cutting-edge technology, redefining the car purchasing journey for you.

### Why Choose Gran Sonrisa?

At Gran Sonrisa, we've crafted an environment where convenience, clarity, and the latest advancements converge. Our platform offers an intuitive interface catering to both customers and administrators, streamlining the management of car listings. This means your car buying experience is not only enjoyable but seamless too.

## 📋 Technologies Used

The car purchasing app described here utilizes a combination of technologies to create a robust and user-friendly experience. The technologies used include:

- **Ruby on Rails (Rails)**: Ruby on Rails is a web application framework that provides tools and conventions for building web applications. It follows the Model-View-Controller (MVC) architecture and emphasizes convention over configuration, making development faster and more organized.

- **PostgreSQL**: PostgreSQL is a powerful, open-source relational database management system (RDBMS) known for its extensibility, robustness, and reliability. It is designed to handle large volumes of data while providing advanced features for data storage, retrieval, and management.

- **Devise**: Devise is a Ruby on Rails gem for seamless user authentication. It's flexible, secure, and customizable, making it easy to add features like user registration, password reset, and more to your web app. It supports multiple authentication strategies, and it's well-documented with a strong community.

- **JavaScript:** JavaScript: Versatile web language, adds interactivity, manipulates DOM. High-level syntax, client-side scripting. Core for modern web development.

- **Paystack:** Nigerian fintech company, acquired by Stripe in 2020. Offers online payment solutions for businesses across Africa. Streamlines transactions, supports various payment methods, and enhances financial inclusivity.

- **SASS (Syntactically Awesome Style Sheets)**: SASS is a CSS preprocessor that enhances the styling capabilities of CSS. It provides features like variables, nesting, mixins, and more, allowing for cleaner and more maintainable stylesheets.

## 📜 Key Features

### 👨‍💻🧑‍💻 User Roles

- **Admin:** Administrators have special privileges to manage car listings and view statistics.
- **Customer:** Customers can browse cars, view details, and make purchases.

### 🔐 User Authentication

- Sign up and log in as either an admin or a customer for a personalized experience.

### 👥 Customer Features

- **Extensive New Car Database**: Explore a vast collection of the latest new car models from a wide range of manufacturers. From compact cars to SUVs, electric vehicles to luxury sedans, find the perfect match for your preferences.
- **Saved Favorites and Notifications**: Save your favorite cars to a personalized list for easy reference. Receive notifications when the price drops on a car you're interested in or when similar vehicles become available.
- **Secure Payment Options**: Once you've found your ideal car, complete the purchase securely through the app. Make payments, sign contracts, and handle paperwork electronically to streamline the buying process.
- **Detailed Specifications**: Access comprehensive specifications for each new car model, including performance details, fuel efficiency, safety features, technology integrations, and more.
- **Transparent Transaction Process**: Receive a detailed breakdown of the costs associated with your new car purchase, including taxes, fees, and any additional add-ons. No hidden surprises.

- **Delivery and After-Sales Services**: Coordinate the delivery of your new car to your preferred location. Access after-sales services, maintenance schedules, and support information through the app.
  Gran Sonrisa is not just an app; it's a comprehensive tool that empowers you to make well-informed decisions when purchasing a car. Say goodbye to the hassle of traditional car shopping and say hello to a modern, user-friendly, and efficient car purchasing experience with Gran Sonrisa.

### 👤 Admin Features

#### 🚙🚗 Car Management

- **Add Car:** Admins can easily add new cars to the system, providing details such as make, model, year, price, and images.
- **View Car:** Customers can view detailed information about each car, including images, specifications, and pricing.
- **Edit Car:** Admins have the ability to edit car details, allowing for accurate and up-to-date information.
- **Delete Car:** Admins can remove cars from the listing if needed.

#### 📊📈 Admin Dashboard

- Admins have access to a dashboard that displays essential statistics:
  - Total number of Cars Listed.
  - Total number of Cars Sold.
  - Number of Users
  - Revenue Generated
  - Recent Purchases
  - Sales Breakdown according to Months
  - Most Purchased Brands

## 💻 Installation

Follow these steps to set up Gran Sonrisa Car Purchasing App locally:

1. Clone the repository:

   ```bash
   git clone https://github.com/solobarine/gran-sonrisa.git
   ```

2. Navigate to the Project Directory:

   ```bash
   cd gran_sonrisa
   ```

3. Install Dependencies:

   ```bash
   cd backend
   bundle install
   ```

4. Set Up Database:

   ```bash
   rails db:create
   rails db:migrate
   ```

5. Start the Servers:

```bash
rails s
```

## 👤 Author

- Name: **Solomon Barine Akpuru**
- GitHub: [@solobarine](https://github.com/solobarine)
- LinkedIn: [solomon-akpuru](https://linkedin.com/in/solomon-akpuru)
- WellFound: [solomon-akpuru](https://wellfound.com/u/solomon-akpuru)

## 🤝 Contributing

We welcome contributions to make Gran Sonrisa even better. Feel free to fork the repository, make changes, and submit pull requests. For major changes, please open an issue first to discuss your ideas.

## 🙏 Show your Support

Give a ⭐️ if you like the project!

## 📝 License

Gran Sonrisa is released under the [MIT](./LICENSE.md) License.

## 📧 Contact Us

If you have any questions, feedback, or issues, please contact our support team at [solobarine@gmail.com](solobarine@gmail.com).
Thank you for choosing Gran Sonrisa Car Purchasing App! We hope you have a fantastic experience browsing and purchasing cars through our platform.
