#  User Funnel Analysis

This project presents an end-to-end **User Funnel Analysis** to identify where users drop off in their journey and provide actionable insights to improve user activation, engagement, and retention.  
Data was cleaned in **Excel**, analyzed using **SQL**, and visualized with **Tableau**.

---

##  Objective

The goal of this project is to answer the following questions: 
1.	Where are customers dropping off in the purchase funnel?
2.	Which customer segments (age, gender, etc.) convert better and drive more revenue?
3.	How do different product categories perform in terms of conversion and returns?
4.	What impact does the payment method have on purchase completion and churn?
5.	What patterns exist among churned customers, and how can we reduce churn?

---

##  Funnel Design

| Funnel Stage            | Dataset Indicators / Columns                | Description                                              |
|-------------------------|---------------------------------------------|----------------------------------------------------------|
| 1. Product Interest     | Product Category, Customer ID               | Customer views or shows interest in products.            |
| 2. Add to Cart / Intent | Quantity > 0, Product Price                 | Customer adds product(s) to cart or intends to buy.      |
| 3. Purchase Completed   | Total Purchase Amount, Payment Method       | Customer completes the purchase transaction.             |
| 4. Post-Purchase Returns| Returns                                     | Customer returns the product(s) purchased.               |
| 5. Retention / Churn    | Churn                                       | Whether the customer remains active or churns.           |
|-------------------------|---------------------------------------------|----------------------------------------------------------|

---

##  Data Source & Preparation

###  Excel (Data Cleaning)
- Removed duplicates and nulls
- Standardized date and text formats

###  SQL (Data Aggregation)
- Created funnel stages (e.g., Product Interest , Intent )
- Segmented data to calculate conversion and churn

---

##  Tableau (Visualization)
Funnel chart to visualize drop-off.
Bar charts graphs.
Interactive filters by age, gender,product category and payment method.

##  Insights
1. Noticed that 40.7 % Customers Returned the Product.
2. People with Age Group of 55+ drive more revenue than other which is 6,86,48,534 while people under 25 drive least revenue.
3. Female buys more Product than Men , they drive revenue of 8,95,94,849.
4. Electronic Product bring more Revenue followed by Clothing , Home and then Books.
5. Largest Revenue is derived from Segment ' Male, 55+, Electronics ' equal to 71,45,999 & lowest Revenue is derived from Segment ' Male, Under 25, Home ' equal to 27,87,363.
6. Returns of All Product Category is around 40%.
7. There is 59% Purchase Completion Rate and around 19% Churn Rate by Credit Card User.
8. Churn Rate for Female is greater than Male. Female = 20% and Male = 19%.
9. Churn Rate for User who Buys Home Catefory Product is lowest whereas Clothing is highest.
10. Churn Rate for Credit Card User is Lowest and for Cash users is Highest.
11. Churn Rate for Age Group 45-54 is lowest and for Users under 25 is Highest.


## Recommendations
1. To Decrease the Drop Off , we should focus on Making the Product more better to satisfy the demand of the user. This will also decrease the Return Rate.
2. To Decrease the Churn and increase the revenue from Under 25 Age Group , we can focus on Advertising or recommending more product related to that Age_Group Choice.
3. We can recommend and Advertise more Home Products to increse Revenue generated from it.
4. We can make Paypal payment more smooth to increase Purchase Completion Rate and also giving Discount to the Customer who pay by cash to decrease the Churn Rate.
5. To Decrease Churn Rate we should focus more on retaining the Female & under 25 aged customers , making better Clothing Product , encouraging Credit Card Use .


## Project Structure 
├──                           # Original Dataset
├── book1.xlsx                # Cleaned dataset
├── Queries.sql               # SQL logic for funnel analysis
├── Output                    # Images of Charts and Dashboards
└── README.md                 # Project documentation

