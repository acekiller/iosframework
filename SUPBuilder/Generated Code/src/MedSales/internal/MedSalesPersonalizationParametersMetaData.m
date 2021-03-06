#import "MedSalesPersonalizationParametersMetaData.h"

#import "SUPParameterMetaData.h"
#import "SUPAttributeMap.h"
#import "SUPObjectList.h"
#import "SUPClassMap.h"
#import "SUPEntityMap.h"
#import "MedSalesPersonalizationParameters.h"
#import "SUPDataType.h"
#import "SUPAttributeMetaDataRBS.h"

@implementation MedSalesPersonalizationParametersMetaData

+ (MedSalesPersonalizationParametersMetaData*)getInstance
{
    return [[[MedSalesPersonalizationParametersMetaData alloc] init] autorelease];
}

- (id)init
{
	if (self = [super init]) {
		self.name = @"PersonalizationParameters";
		self.klass = [MedSalesPersonalizationParameters class];
 
		SUPObjectList *attributes = [SUPObjectList listWithCapacity:7];
		SUPAttributeMetaDataRBS* a_username = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			417:
			[SUPDataType forName:@"string"]:@"varchar(300)":@"username":@"":@"":
			@"":300:0:0:
			@"null":YES:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_Session:NO];
  		[attributes addThis:a_username];
		SUPAttributeMetaDataRBS* a_usernameUserDefined = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			418:
			[SUPDataType forName:@"boolean"]:@"tinyint":@"usernameUserDefined":@"":@"":
			@"":-1:0:0:
			@"false":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
  		[attributes addThis:a_usernameUserDefined];
		SUPAttributeMetaDataRBS* a_password = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			419:
			[SUPDataType forName:@"string"]:@"varchar(300)":@"password":@"":@"":
			@"":300:0:0:
			@"null":YES:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_Session:YES];
  		[attributes addThis:a_password];
		SUPAttributeMetaDataRBS* a_passwordUserDefined = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			420:
			[SUPDataType forName:@"boolean"]:@"tinyint":@"passwordUserDefined":@"":@"":
			@"":-1:0:0:
			@"false":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
  		[attributes addThis:a_passwordUserDefined];
 		self.attributes = attributes;
 		
 		SUPAttributeMap * attributeMap = [SUPAttributeMap getInstance];
    	[attributeMap setAttributes:attributes];
    	self.attributeMap = attributeMap;

	}
    return self;
}
@end