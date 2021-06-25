import * as cdk from '@aws-cdk/core';
import * as widget_service from '../lib/cron_backup_s3_services';

export class CronBackupS3Stack extends cdk.Stack {
  constructor(scope: cdk.Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    new widget_service.CronBackupS3Service(this, 'cronBackup');
  }
}
