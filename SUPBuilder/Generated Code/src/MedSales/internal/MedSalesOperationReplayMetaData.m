#import "MedSalesOperationReplayMetaData.h"

#import "SUPRelationshipMetaData.h"
#import "SUPParameterMetaData.h"
#import "SUPIndexMetaData.h"
#import "SUPAttributeMap.h"
#import "SUPObjectList.h"
#import "SUPClassMap.h"
#import "SUPEntityMap.h"
#import "MedSalesOperationReplay.h"
#import "SUPOperationMap.h"
#import "MedSalesMedSalesDB.h"
#import "SUPDataType.h"

@implementation MedSalesOperationReplayMetaData

+ (MedSalesOperationReplayMetaData*)getInstance
{
    return [[[MedSalesOperationReplayMetaData alloc] init] autorelease];
}

- (id)init
{
    if (self = [super init]) {
		self.id = _ENTITY_NUMBER_FOR_MedSalesOperationReplay_;
		self.name = @"OperationReplay";
		self.klass = [MedSalesOperationReplay class];
 		self.allowPending = NO;;

		self.isClientOnly = YES;

		SUPObjectList *attributes = [SUPObjectList getInstance];
		SUPAttributeMetaDataRBS* a_remoteId = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			358:
			[SUPDataType forName:@"string"]:@"varchar(100)":@"remoteId":@"":@"a":
			@"":100:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_remoteId setColumn:@"a"];
		SUPAttributeMetaDataRBS* a_component = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			360:
			[SUPDataType forName:@"string"]:@"varchar(200)":@"component":@"":@"c":
			@"":200:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_component setColumn:@"c"];
		SUPAttributeMetaDataRBS* a_entityKey = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			361:
			[SUPDataType forName:@"string"]:@"varchar(256)":@"entityKey":@"":@"d":
			@"":256:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_entityKey setColumn:@"d"];
		SUPAttributeMetaDataRBS* a_attributes = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			362:
			[SUPDataType forName:@"string"]:@"LONG VARCHAR":@"attributes":@"":@"e":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_attributes setColumn:@"e"];
		SUPAttributeMetaDataRBS* a_operation = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			363:
			[SUPDataType forName:@"string"]:@"varchar(100)":@"operation":@"":@"f":
			@"":100:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_operation setColumn:@"f"];
		SUPAttributeMetaDataRBS* a_parameters = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			364:
			[SUPDataType forName:@"string"]:@"LONG VARCHAR":@"parameters":@"":@"g":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_parameters setColumn:@"g"];
		SUPAttributeMetaDataRBS* a_replayLog = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			365:
			[SUPDataType forName:@"string?"]:@"LONG VARCHAR":@"replayLog":@"":@"h":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:YES:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_replayLog setColumn:@"h"];
		SUPAttributeMetaDataRBS* a_exception = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			366:
			[SUPDataType forName:@"string?"]:@"LONG VARCHAR":@"exception":@"":@"i":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:YES:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_exception setColumn:@"i"];
		SUPAttributeMetaDataRBS* a_completed = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			367:
			[SUPDataType forName:@"boolean"]:@"tinyint":@"completed":@"":@"j":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_completed setColumn:@"j"];
		SUPAttributeMetaDataRBS* a_requestId = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			359:
			[SUPDataType forName:@"long"]:@"decimal(20,0)":@"requestId":@"":@"b":
			@"":-1:0:0:
			@"null":NO:@"":
			YES:NO:NO:NO:NO:NO:
			GeneratedScheme_GLOBAL:
			NO:SUPPersonalizationType_None:NO];
		[a_requestId setColumn:@"b"];
 		
		[attributes addThis:a_remoteId];
		[attributes addThis:a_component];
		[attributes addThis:a_entityKey];
		[attributes addThis:a_attributes];
		[attributes addThis:a_operation];
		[attributes addThis:a_parameters];
		[attributes addThis:a_replayLog];
		[attributes addThis:a_exception];
		[attributes addThis:a_completed];
		[attributes addThis:a_requestId];
		self.attributes = attributes;
		
		SUPAttributeMap * attributeMap = [SUPAttributeMap getInstance];
   		[attributeMap setAttributes:attributes];
	   	self.attributeMap = attributeMap;

 		SUPOperationMetaData* o_saveErrorInfo_0 = [SUPOperationMetaData createOperationMetaData:1:(SUPString)@"saveErrorInfo":[SUPDataType forName:@"void"]:true];
		[o_saveErrorInfo_0 setIsStatic:NO];
		[o_saveErrorInfo_0 setIsCreate:NO];
		[o_saveErrorInfo_0 setIsUpdate:NO];
		[o_saveErrorInfo_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_findReadyToFinish_0 = [SUPOperationMetaData createOperationMetaData:2:(SUPString)@"findReadyToFinish":[SUPDataType forName:@"OperationReplay*"]:true];
		[o_findReadyToFinish_0 setIsStatic:YES];
		[o_findReadyToFinish_0 setIsCreate:NO];
		[o_findReadyToFinish_0 setIsUpdate:NO];
		[o_findReadyToFinish_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_refresh_0 = [SUPOperationMetaData createOperationMetaData:3:(SUPString)@"refresh":[SUPDataType forName:@"void"]:true];
		[o_refresh_0 setIsStatic:NO];
		[o_refresh_0 setIsCreate:NO];
		[o_refresh_0 setIsUpdate:NO];
		[o_refresh_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o__pk_0 = [SUPOperationMetaData createOperationMetaData:4:(SUPString)@"_pk":[SUPDataType forName:@"long?"]:true];
		[o__pk_0 setIsStatic:NO];
		[o__pk_0 setIsCreate:NO];
		[o__pk_0 setIsUpdate:NO];
		[o__pk_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_save_0 = [SUPOperationMetaData createOperationMetaData:5:(SUPString)@"save":[SUPDataType forName:@"void"]:true];
		[o_save_0 setIsStatic:NO];
		[o_save_0 setIsCreate:NO];
		[o_save_0 setIsUpdate:NO];
		[o_save_0 setIsDelete:NO]; 		
 
  		SUPObjectList *operations = [SUPObjectList listWithCapacity:5];
 		[operations addThis:o_saveErrorInfo_0];
 		[operations addThis:o_findReadyToFinish_0];
 		[operations addThis:o_refresh_0];
 		[operations addThis:o__pk_0];
 		[operations addThis:o_save_0];
	 	self.operations = operations;
 	
		SUPOperationMap *operationMap = [SUPOperationMap getInstance];
		[operationMap setOperations:operations];
		self.operationMap = operationMap;		
		self.table = @"medsales_1_0_operationreplay";
		self.synchronizationGroup = @"system";

			
		[self.keyList add:a_requestId];


    }
    return self;
}
@end