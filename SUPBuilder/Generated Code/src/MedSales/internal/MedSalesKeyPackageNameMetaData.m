#import "MedSalesKeyPackageNameMetaData.h"

#import "SUPParameterMetaData.h"
#import "SUPAttributeMap.h"
#import "SUPObjectList.h"
#import "SUPClassMap.h"
#import "SUPEntityMap.h"
#import "MedSalesKeyPackageName.h"
#import "SUPDataType.h"
#import "SUPAttributeMetaDataRBS.h"

@implementation MedSalesKeyPackageNameMetaData

+ (MedSalesKeyPackageNameMetaData*)getInstance
{
    return [[[MedSalesKeyPackageNameMetaData alloc] init] autorelease];
}

- (id)init
{
	if (self = [super init]) {
		self.name = @"KeyPackageName";
		self.klass = [MedSalesKeyPackageName class];
 
		SUPObjectList *attributes = [SUPObjectList listWithCapacity:7];
		SUPAttributeMetaDataRBS* a_key_name = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			410:
			[SUPDataType forName:@"string"]:@"varchar(255)":@"key_name":@"":@"":
			@"":255:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
  		[attributes addThis:a_key_name];
		SUPAttributeMetaDataRBS* a_package_name = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			412:
			[SUPDataType forName:@"string"]:@"varchar(100)":@"package_name":@"":@"":
			@"":100:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
  		[attributes addThis:a_package_name];
		SUPAttributeMetaDataRBS* a_user_name = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			411:
			[SUPDataType forName:@"string"]:@"varchar(255)":@"user_name":@"":@"":
			@"":255:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
  		[attributes addThis:a_user_name];
		SUPAttributeMetaDataRBS* a_domain_name = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			413:
			[SUPDataType forName:@"string"]:@"varchar(100)":@"domain_name":@"":@"":
			@"":100:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
  		[attributes addThis:a_domain_name];
 		self.attributes = attributes;
 		
 		SUPAttributeMap * attributeMap = [SUPAttributeMap getInstance];
    	[attributeMap setAttributes:attributes];
    	self.attributeMap = attributeMap;

	}
    return self;
}
@end