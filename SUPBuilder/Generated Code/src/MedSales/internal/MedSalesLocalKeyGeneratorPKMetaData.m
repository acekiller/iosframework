#import "MedSalesLocalKeyGeneratorPKMetaData.h"

#import "SUPParameterMetaData.h"
#import "SUPAttributeMap.h"
#import "SUPObjectList.h"
#import "SUPClassMap.h"
#import "SUPEntityMap.h"
#import "MedSalesLocalKeyGeneratorPK.h"
#import "SUPDataType.h"
#import "SUPAttributeMetaDataRBS.h"

@implementation MedSalesLocalKeyGeneratorPKMetaData

+ (MedSalesLocalKeyGeneratorPKMetaData*)getInstance
{
    return [[[MedSalesLocalKeyGeneratorPKMetaData alloc] init] autorelease];
}

- (id)init
{
	if (self = [super init]) {
		self.name = @"LocalKeyGeneratorPK";
		self.klass = [MedSalesLocalKeyGeneratorPK class];
 
		SUPObjectList *attributes = [SUPObjectList listWithCapacity:7];
		SUPAttributeMetaDataRBS* a_remoteId = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			447:
			[SUPDataType forName:@"string"]:@"varchar(300)":@"remoteId":@"":@"":
			@"":300:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
  		[attributes addThis:a_remoteId];
		SUPAttributeMetaDataRBS* a_batchId = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			448:
			[SUPDataType forName:@"long"]:@"decimal(20,0)":@"batchId":@"":@"":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
  		[attributes addThis:a_batchId];
 		self.attributes = attributes;
 		
 		SUPAttributeMap * attributeMap = [SUPAttributeMap getInstance];
    	[attributeMap setAttributes:attributes];
    	self.attributeMap = attributeMap;

	}
    return self;
}
@end