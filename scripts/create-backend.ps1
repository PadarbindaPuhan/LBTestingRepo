param(
    [Parameter(Mandatory = $true)]
    [string]$bucketName,

    [Parameter(Mandatory = $true)]
    [string]$dynamoDbTableName,

    [Parameter(Mandatory = $true)]
    [string]$region
)

try{
    Import-Module AWSPowerShell.NetCore
    
    Write-Host "Check if bucket $bucketName exists in region $region and create it if not"
    $bucketInfo= Get-S3Bucket -BucketName $bucketName 
    
    if($bucketInfo){
        Write-Host "Bucket $bucketName exists"
    }
    else{
        Write-Host "Creating new bucket $bucketName"
        Import-Module ./create-backend-bucket.psm1
        New-BackendBucket -bucketName $bucketName -region $region
    }
}
catch{
    Write-Host "Error creating bucket"+$_.message
    exit(1)
}

Write-Host "Check if DynamoDB table $dynamoDbTableName exists in region $region and create it if not"

try{
    $dynamoDbTableInfo= Get-DDBTable -TableName $dynamoDbTableName -Region $region
}
catch
{

    if($_.Exception.Message -like "*Requested resource not found*"){
        Write-Host "Creating new DynamoDB table $dynamoDbTableName"
        Import-Module ./create-backend-dynamodb.psm1
        New-BackendDynamoDBTable -dynamoDbTableName $dynamoDbTableName -region $region
    }
    else{
            Write-Host "Error checking DynamoDB table"+$_.message
            exit(1)
    }
        
}   




