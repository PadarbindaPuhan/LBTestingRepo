Function New-BackendDynamoDBTable {
    param(
        [Parameter(Mandatory = $true)]
        [string]$dynamoDbTableName,

        [Parameter(Mandatory = $true)]
        [string]$region
    )
    try{
        Import-Module AWSPowerShell.NetCore

        # Create DynamoDB table
        $schema = New-DDBTableSchema   
        $schema | Add-DDBKeySchema -KeyName "LockID" -KeyDatatype "S"  
        $schema | New-DDBTable -TableName $dynamoDbTableName -Region $region -ReadCapacity 5 -WriteCapacity 5
            
        Write-Host "Created DynamoDB Table $dynamoDbTableNameme"
    }
    catch{
        Write-Host "Error creating table"+$_.message
        exit(1)
    }
}