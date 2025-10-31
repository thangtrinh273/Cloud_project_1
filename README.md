# Energy Consumption Data Engineering Project

This project implements a data engineering pipeline to analyze steel industry energy consumption data using AWS S3 for storage and Jupyter notebooks for data processing.

## Project Structure

```
Cloud_project_1/
│
├── data/                    # Data directory
│   └── Steel_industry_data.csv    # Steel industry energy consumption dataset
│
├── get_kaggle_data.ipynb   # Jupyter notebook for data retrieval and processing
├── main.tf                 # Terraform configuration for AWS infrastructure
└── README.md              # Project documentation
```

## Setup Instructions

### Prerequisites

- Python 3.12+
- AWS Account and CLI configured
- Terraform installed
- Kaggle account and API credentials
- Git

### Environment Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/thangtrinh273/Cloud_project_1.git
   cd Cloud_project_1
   ```

2. **Set up Python virtual environment**
   ```bash
   python3 -m venv .venv
   source .venv/bin/activate
   pip install pandas kaggle jupyter
   ```

3. **Configure Kaggle API**
   - Place your `kaggle.json` credentials in `~/.kaggle/`
   - Ensure proper permissions:
     ```bash
     chmod 600 ~/.kaggle/kaggle.json
     ```

4. **Configure AWS Credentials**
   - Set up AWS credentials in `~/.aws/credentials`
   - Configure region in `~/.aws/config`

### Infrastructure Deployment

1. **Initialize Terraform**
   ```bash
   terraform init
   ```

2. **Review Infrastructure Changes**
   ```bash
   terraform plan
   ```

3. **Deploy Infrastructure**
   ```bash
   terraform apply
   ```

## Project Components

### 1. Data Collection (get_kaggle_data.ipynb)
- Downloads steel industry energy consumption dataset from Kaggle
- Performs initial data exploration
- Prepares data for upload to AWS S3

### 2. AWS Infrastructure (main.tf)
- Creates S3 bucket for data storage
- Implements security best practices:
  - Server-side encryption
  - Versioning enabled
  - Public access blocked
  - Proper IAM permissions

## Data Description

The dataset contains information about steel industry energy consumption patterns, including:
- Usage patterns
- Energy consumption metrics
- Temporal data
- Environmental factors

## Usage

1. **Data Retrieval**
   - Open `get_kaggle_data.ipynb` in Jupyter
   - Run cells sequentially to download and process data

2. **Infrastructure Management**
   - Use Terraform commands to manage AWS infrastructure
   - Monitor S3 bucket for uploaded data

## Security Considerations

- AWS credentials are kept secure and not committed to version control
- S3 bucket is configured with proper access controls
- Kaggle API credentials are stored securely

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.