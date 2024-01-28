Data Warehousing Project: Gravity Books Sales End-to-End


Table of Contents

    Introduction
    Project Phases
    Data Source
    Technologies Used
    Getting Started
    ETL Phase
    Analysis Phase

Introduction

Welcome to the Gravity Books Sales End-to-End project, where we illustrate the development of a comprehensive data warehousing solution. This project encompasses the Extract, Transform, Load (ETL) phase, analysis phase with SQL Server Analysis Services (SSAS).
Project Phases

    ETL (Extract, Transform, Load): Data is extracted from the transactional database "Gravity Book Sales," transformed to meet data warehousing standards, and loaded into a structured data warehouse.

    Analysis: The data is modeled and structured for efficient querying and analysis using SQL Server Analysis Services (SSAS).

Data Source

The source dataset for this project is the "Gravity Book Sales" database, serving as the foundation for the end-to-end project.
Technologies Used

    SQL Server Integration Services (SSIS)
    SQL Server Analysis Services (SSAS)

Getting Started

To explore and replicate the project:

    Clone this repository to your local machine.
    Download and install SQL Server if not already installed.
    Follow the instructions in the respective folders for each project phase (ETL, Analysis, Reporting) to set up and execute the code.

ETL Phase

In this phase, the following dimensions and fact tables are created:

    dim_book: Dimensions related to books, including book details.
    dim_customer: Dimensions related to customers, such as customer information.
    dim_date: Dimensions related to dates, including time-based data.
    dim_time : Dimension related to time varient to track orders time.
    sales_fact: Fact table containing sales data.

Additionally, an accumulated fact table has been implemented to track dates, enhancing the project's functionality and analytical capabilities. This accumulated fact table enables comprehensive tracking and analysis of sales data over time, providing valuable insights into sales trends and patterns.
Analysis Phase

The analysis phase utilizes SQL Server Analysis Services (SSAS) to construct tabular data models, specializing in efficient data retrieval and relational views.
Reporting Phase

    Pivot Table Reporting: Utilizes Excel's pivot tables for basic ad-hoc analysis and custom reports generation.

    Power BI Dashboard Reporting: Employs Power BI for interactive reports, dashboards, and data visualizations, allowing for more in-depth analysis and dynamic insights.

This addition highlights the enhanced functionality brought by the accumulated fact table, enabling more robust tracking and analysis of sales data across different time intervals.
The main difference from previous projects is the addition of an accumulated fact table to track dates.
Analysis Phase

The analysis phase utilizes SQL Server Analysis Services (SSAS) to construct tabular data models, specializing in efficient data retrieval and relational views.
Reporting Phase


Contributing

Feel free to adapt and expand upon this project. Contributions are welcome!
License

This project is licensed under the MIT License - see the LICENSE file for details.


