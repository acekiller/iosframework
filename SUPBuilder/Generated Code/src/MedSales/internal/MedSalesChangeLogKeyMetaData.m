#import "MedSalesChangeLogKeyMetaData.h"

#import "SUPParameterMetaData.h"
#import "SUPAttributeMap.h"
#import "SUPObjectList.h"
#import "SUPClassMap.h"
#import "SUPEntityMap.h"
#import "MedSalesChangeLogKey.h"
#import "SUPDataType.h"
#import "SUPAttributeMetaDataRBS.h"

@implementation MedSalesChangeLogKeyMetaData

+ (MedSalesChangeLogKeyMetaData*)getInstance
{
    return [[[MedSalesChangeLogKeyMetaData alloc] init] autorelease];
}

- (id)init
{
	if (self = [super init]) {
		self.name = @"ChangeLogKey";
		self.klass = [MedSalesChangeLogKey class];
 
		SUPObjectList *attributes = [SUPObjectList listWithCapacity:7];
		SUPAttributeMetaDataRBS* a_entityType = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			395:
			[SUPDataType forName:@"int"]:@"integer":@"entityType":@"":@"":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
  		[attributes addThis:a_entityType];
		SUPAttributeMetaDataRBS* a_surrogateKey = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			396:
			[SUPDataType forName:@"long"]:@"decimal(20,0)":@"surrogateKey":@"":@"":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
  		[attributes addThis:a_surrogateKey];
 		self.attributes = attributes;
 		
 		SUPAttributeMap * attributeMap = [SUPAttributeMap getInstance];
    	[attributeMap setAttributes:attributes];
    	self.attributeMap = attributeMap;

	}
    return self;
}
@end