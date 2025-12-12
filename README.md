# Azure-ADF-ELT-Pipeline-Project
Developed and automated a robust, cloud-based ELT/ETL data pipeline using Azure Data Factory (ADF), SQL, and Python for enterprise data integration.

**TASKS THAT ARE DONE IN THIS PROJECT:****
1. Create a pipeline to fetch data for 5 countries (India, US, UK, China, Russia) from a REST
API and save it as separate JSON files.
2. Add a trigger to the above pipeline to run automatically two times a day (12:00 AM and 12:00
PM IST).
3. Create a pipeline to copy customer data from a database to Azure Data Lake Storage Gen2
(ADLS Gen2) only if the record count is more than 500. Once copied, it should call a child
pipeline that copies product data if the customer record count is greater than 600.
4. Design the pipeline to pass the customer count from the parent pipeline to the child product
pipeline via a pipeline parameter.

**TOOLS REQUIRED:**
Azure Data Factory (ADF) (The central orchestration and ETL/ELT tool)

Azure Data Lake Storage (ADLS) / Azure Blob Storage (Cloud Storage for source JSON and target CSV)

SQL (Structured Query Language) (Used for data transformation/modeling within the pipeline)

Python (For custom scripts, validation, or complex transformations)


