Function New-BackendBucket {
    param(
        [Parameter(Mandatory = $true)]
        [string]$bucketName,

        [Parameter(Mandatory = $true)]
        [string]$region
    )
    try{
        Import-Module AWSPowerShell.NetCore

        # Create KMS Key
        $kmsKey = New-KMSKey -Description "KMS key for $bucketName" -Region $region

        $bucket = New-S3Bucket -BucketName $bucketName -Region $region

        # Associate the KMS key with the bucket
        $encryptionConfig =  @{ServerSideEncryptionByDefault = @{ServerSideEncryptionAlgorithm = "aws:kms";ServerSideEncryptionKeyManagementServiceKeyId = $kmsKey.KeyId}}
        Set-S3BucketEncryption -BucketName $bucketName -ServerSideEncryptionConfiguration_ServerSideEncryptionRule $encryptionConfig -Region $region       
       
    
        Write-Host "Created bucket $bucketName"
    }
    catch{
        Write-Host "Error creating bucket"+$_.message
        exit(1)
    }
}