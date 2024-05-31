## Automating Data Transformation with DBT for BigQuery Analytics

This project demonstrates a practical use case for combining DBT (Data Build Tool) and Google BigQuery for data transformation and warehousing.
BigQuery is then connected to Google Looker Studio for BI Visualization.

<img width="677" alt="image" src="https://github.com/NickolasB98/dbt-bigquery-de-project/assets/157819544/a5ae5cba-b1ad-4d19-88ce-eed086e5b88e">


### Introduction

DBT and BigQuery have become essential tools for data engineers and analysts. DBT simplifies data transformation with its SQL-based approach, while BigQuery offers a powerful and scalable data warehouse. Together, they provide a streamlined workflow for managing data pipelines.

#### Key Features

##### DBT:

SQL-based transformations (familiar language for data professionals)

Version control with Git for code management

Built-in testing capabilities for data quality assurance

Automatic documentation generation for data models

##### BigQuery:

Serverless architecture eliminates infrastructure management needs

Real-time analytics for up-to-date data insights

Automatic backups and easy data restores

Seamless integration with other Google Cloud services

### Workflow Overview

Extract: Data is retrieved from various sources and loaded into BigQuery.

Transform with DBT: SQL-based transformations are written and tested within DBT, executing directly in BigQuery.

Load: Transformed data resides in BigQuery, ready for analysis.

Analyze: Any BI tool can be used to analyze the prepared data.

**Benefits:**

Scalability: Both DBT and BigQuery handle large datasets effectively.

Maintainability: DBT's version control and testing ensure transformation accuracy.

Cost-Effectiveness: DBT is open-source, and BigQuery offers a pay-as-you-go model.

Speed: DBT leverages BigQuery's power for fast data processing.

### Getting Started

**Overview**

Set up a Google Cloud Account: Create a GCP account and a BigQuery instance.

Install DBT: Install DBT and configure it to connect to your BigQuery instance.

Develop DBT Models: Write your DBT models and tests.

Run DBT Transformations: Execute DBT transformations and tests against your BigQuery dataset.

Visualize Transformed Data: Connect Looker Studio to BigQuery instance and create visualizations through drag-and-drop interactive actions.


### Detailed Instructions

#### Python Environment Setup

This project uses a virtual environment to isolate its dependencies. It's recommended to use virtual environments to manage project-specific dependencies and avoid conflicts with other projects on your system.

Here's how to create and activate a virtual environment using `venv` (available in Python 3.3+):


        python -m venv myenv
        source myenv/bin/activate  # macOS/Linux
        venv\Scripts\activate.bat  # Windows


Install dbt-bigquery within the environment:
Once your environment is activated, install the dbt-bigquery package using pip:

        pip install dbt-bigquery

Check this link for more information: 
["https://pypi.org/project/dbt/"]


#### Setting Up BigQuery:

GCP Account: Sign up for a free GCP account with a $300 credit.

Create a Project: In the GCP Console, navigate to the dashboard and create a new project.

<img width="751" alt="image" src="https://github.com/NickolasB98/dbt-bigquery-de-project/assets/157819544/fd11f622-e657-4843-9efb-9c82b4d8b25a">


Enable BigQuery API: In the GCP Console, locate and enable the BigQuery API.

<img width="689" alt="image" src="https://github.com/NickolasB98/dbt-bigquery-de-project/assets/157819544/689b4d76-8c44-4d48-a769-4cd0183af0f0">

Access BigQuery Console: Access the BigQuery console directly from the GCP dashboard.

<img width="1360" alt="image" src="https://github.com/NickolasB98/dbt-bigquery-de-project/assets/157819544/36493e12-95b2-412d-8675-1f0a96ee8f65">

Create a Service Account: 

Create a Secure Service Account for DBT:

To securely connect DBT to your BigQuery instance, you'll need to create a service account with the appropriate permissions. This service account acts like a dedicated user within your project, allowing DBT to interact with BigQuery data.

Steps:

Navigate to IAM & Admin: Access the Google Cloud Platform (GCP) Console and navigate to the "IAM & Admin" section. This section manages identity and access controls for your project.

Create a Service Account: Click the "Create Service Account" button. This will initiate the creation process for a new service account.

Assign the Owner Role: During creation, ensure you grant the "Owner" role to the service account. This role provides the highest level of access within the project, allowing DBT to perform all necessary operations on your BigQuery data.

Download the Private Key: Once the service account is created, navigate to the "Keys" tab and click "ADD KEY" followed by "Create New Key." This will download a private key file to your computer. Keep this file secure, as it will be used to authenticate DBT with BigQuery.

<img width="1088" alt="image" src="https://github.com/NickolasB98/dbt-bigquery-de-project/assets/157819544/a3985462-606a-4f77-a1a9-2c8c7736137f">

Put this key inside the profiles.yml file, which you can find after downloading dbt in the path: Users/user/.dbt/profiles.yml

<img width="526" alt="image" src="https://github.com/NickolasB98/dbt-bigquery-de-project/assets/157819544/81851dd7-ca1d-4d93-8199-e7cd95010630">

Key: keyfile
Value: the path to your private key in json format

#### Setting Up DBT (after the installation in the python env):

Set up on your machine: run pip install dbt-core dbt-bigquery

<img width="526" alt="image" src="https://github.com/NickolasB98/dbt-bigquery-de-project/assets/157819544/ac32a579-ad79-451e-b783-9c866df1bce5">

Create a DBT Project: Run dbt init [project_name] to initialize a DBT project.

Verify Connection: Run dbt debug to verify the connection between DBT and BigQuery.

<img width="634" alt="image" src="https://github.com/NickolasB98/dbt-bigquery-de-project/assets/157819544/74e47ffe-8733-41ae-9d03-4a439c1159dc">

Run DBT Setup: Execute dbt run to run your DBT project.

<img width="1081" alt="image" src="https://github.com/NickolasB98/dbt-bigquery-de-project/assets/157819544/a162f6ed-99bc-43eb-b7e5-031b6bc30ab9">


**Expected Output:**

Upon successful execution of dbt run, you should see your models populated within your BigQuery dataset.

<img width="291" alt="image" src="https://github.com/NickolasB98/dbt-bigquery-de-project/assets/157819544/9ced66d0-4b87-43e0-873c-1af444bfe6d1">


**Using Multiple Datasets**

The instructions demonstrate adding a custom dataset (dbt-tutorial) and creating a new model through joins (eg. customer_orders.sql) to showcase working with multiple datasets.

<img width="565" alt="image" src="https://github.com/NickolasB98/dbt-bigquery-de-project/assets/157819544/061a88b4-b308-46f4-9744-33a2110bad78">

**Using a Clean Seed for Reliable Testing**

This project utilizes a clean CSV file, stadium_cleaned.csv found in folder:seeds, as a seed to populate the development environment in BigQuery. Seeds provide initial data for testing and development purposes, allowing us to verify our data transformation logic without relying on potentially messy or incomplete production data.

The seed file, containing cleaned stadium data, ensures a consistent and well-structured dataset for our tests. This helps us identify any issues with our DBT models early in the development cycle, before they impact production data.

Here are the key benefits of using a clean seed:

Reliable Testing: Consistent data allows for repeatable testing of our DBT models.
Early Error Detection: Issues in the transformation logic are easier to identify with clean data.
Isolates Production Data: Testing doesn't affect or modify actual production data.
By leveraging a clean seed file, we can ensure the quality and reliability of our data transformation process before deploying it to production.

After running dbt seed, this is the result in BigQuery

<img width="1109" alt="image" src="https://github.com/NickolasB98/dbt-bigquery-de-project/assets/157819544/66b7d4cd-11f5-4900-9105-9a47f37a1e02">


**Querying Output on BigQuery**

Use the BigQuery console to query the output data. The example query provided retrieves the first 1000 rows from the customer_orders table within your dataset.

<img width="1437" alt="image" src="https://github.com/NickolasB98/dbt-bigquery-de-project/assets/157819544/0a416e09-d5ed-48f1-8f83-e5613b9462cf">


**Running Quality Check in DBT**

Run the script 
                dbt test
<img width="765" alt="image" src="https://github.com/NickolasB98/dbt-bigquery-de-project/assets/157819544/e8064d12-e60b-4116-9e99-9fc348f1a74e">

**Generating DBT Documentation**

This project leverages DBT's built-in documentation generation capabilities to create comprehensive documentation for your data models. This documentation serves as a valuable resource for understanding the data transformations within your project.

#### Steps:

**Generate Documentation:**

Run the command dbt docs generate in your terminal. This command instructs DBT to process your models and generate the documentation files.

**Serve Documentation Locally:**

Once generated, you can view the documentation locally by running dbt docs serve. This will launch a web server serving the documentation files within your local DBT directory. You can typically access it by opening http://localhost:8080 in your web browser.

<img width="1337" alt="image" src="https://github.com/NickolasB98/dbt-bigquery-de-project/assets/157819544/ce114635-643c-4753-89de-dd7240a006c5">


### Connecting Looker Studio to BigQuery:

Sign in to Looker Studio (https://cloud.google.com/blog/products/data-analytics/data-studio-now-available-as-a-google-cloud-service).

Click "Create" and select "Data Source."

Choose "BigQuery" as the data source type.

Select your project and dataset containing the transformed data from your DBT models.

Click "Connect."

<img width="1044" alt="image" src="https://github.com/NickolasB98/dbt-bigquery-de-project/assets/157819544/2036fc61-cac6-422b-984e-18b45386dc2d">


### Data Visualization in Looker Studio:

Once connected, explore your data tables in Looker Studio.

Drag and drop fields to create charts and visualizations (e.g., bar charts, line charts, pie charts, tables).

<img width="476" alt="image" src="https://github.com/NickolasB98/dbt-bigquery-de-project/assets/157819544/32f0f8f1-2bf7-423e-9483-7688a1e7e8fd">

Use filters and drill-downs to analyze specific data segments.

<img width="681" alt="image" src="https://github.com/NickolasB98/dbt-bigquery-de-project/assets/157819544/2089afa4-99bd-426b-94bc-dc5408febf47">


Share your reports and dashboards with collaborators for better decision-making.

<img width="895" alt="image" src="https://github.com/NickolasB98/dbt-bigquery-de-project/assets/157819544/70200d4d-77f7-4ae5-80a3-3fd56204f207">


[gcp-bigquery-with-dbt-project.pdf](https://github.com/NickolasB98/dbt-bigquery-de-project/files/15435769/gcp-bigquery-with-dbt-project.pdf)


## Conclusion

This project showcases a powerful combination of DBT, BigQuery, and Looker Studio for a complete data transformation, warehousing, and visualization workflow. By leveraging these tools, you can transform raw data into actionable insights that drive informed business decisions.
