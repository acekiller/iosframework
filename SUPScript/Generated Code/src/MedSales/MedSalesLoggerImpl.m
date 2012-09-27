#import "MedSalesLoggerImpl.h"
#import "MedSalesLogRecordImpl.h"
#import "MedSalesKeyGenerator.h"

@implementation MedSalesLoggerImpl

- (id<SUPLogRecord>)createRealLogRecord
{
	MedSalesLogRecordImpl *log = [MedSalesLogRecordImpl getInstance];
	log.messageId = [MedSalesKeyGenerator generateId];
	log.requestId = [NSString stringWithFormat:@"%ld",log.messageId];
    log.timestamp = [NSDate dateWithTimeIntervalSinceNow:0];
	log.code = 9999;
	log.component = @"MedSalesDB";
	return log;
}


@end