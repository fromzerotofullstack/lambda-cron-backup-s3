import * as core from '@aws-cdk/core';
import * as s3 from "@aws-cdk/aws-s3";
import * as lambda from "@aws-cdk/aws-lambda";
import { AutoDeleteBucket } from '@mobileposse/auto-delete-bucket'

export class CronBackupS3Service extends core.Construct {
    constructor(scope: core.Construct, id:string) {
        super(scope, id);
        
        //our code
        //const bucket = new s3.Bucket(this, "cron_backup_s3", {
        const bucket = new AutoDeleteBucket(this, "cron_backup_s3", {
            versioned: false,
            bucketName: 'cron-backup-s3',
            publicReadAccess: false,
            blockPublicAccess: s3.BlockPublicAccess.BLOCK_ALL,
        });
    }
}
