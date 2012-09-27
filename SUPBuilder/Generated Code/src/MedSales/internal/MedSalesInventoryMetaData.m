#import "MedSalesInventoryMetaData.h"

#import "SUPRelationshipMetaData.h"
#import "SUPParameterMetaData.h"
#import "SUPIndexMetaData.h"
#import "SUPAttributeMap.h"
#import "SUPObjectList.h"
#import "SUPClassMap.h"
#import "SUPEntityMap.h"
#import "MedSalesInventory.h"
#import "SUPOperationMap.h"
#import "MedSalesMedSalesDB.h"
#import "SUPDataType.h"

@implementation MedSalesInventoryMetaData

+ (MedSalesInventoryMetaData*)getInstance
{
    return [[[MedSalesInventoryMetaData alloc] init] autorelease];
}

- (id)init
{
    if (self = [super init]) {
		self.id = _ENTITY_NUMBER_FOR_MedSalesInventory_;
		self.name = @"Inventory";
		self.klass = [MedSalesInventory class];
 		self.allowPending = YES;;

		self.isClientOnly = NO;

		SUPObjectList *attributes = [SUPObjectList getInstance];
		SUPAttributeMetaDataRBS* a_item_id = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			326:
			[SUPDataType forName:@"int"]:@"integer":@"item_id":@"":@"a":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_item_id setColumn:@"a"];
		SUPAttributeMetaDataRBS* a_item_name = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			327:
			[SUPDataType forName:@"string"]:@"varchar(1200)":@"item_name":@"":@"b":
			@"":1200:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_item_name setColumn:@"b"];
		SUPAttributeMetaDataRBS* a_item_price = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			328:
			[SUPDataType forName:@"float"]:@"real":@"item_price":@"":@"c":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_item_price setColumn:@"c"];
		SUPAttributeMetaDataRBS* a_item_organization = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			329:
			[SUPDataType forName:@"string"]:@"varchar(1200)":@"item_organization":@"":@"d":
			@"":1200:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_item_organization setColumn:@"d"];
		SUPAttributeMetaDataRBS* a_pending = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			20001:
			[SUPDataType forName:@"boolean"]:@"tinyint":@"pending":@"":@"_pf":
			@"default 'N'":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_pending setColumn:@"_pf"];
		SUPAttributeMetaDataRBS* a_pendingChange = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			20002:
			[SUPDataType forName:@"char"]:@"char(1)":@"pendingChange":@"":@"_pc":
			@"":1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_pendingChange setColumn:@"_pc"];
		SUPAttributeMetaDataRBS* a_replayPending = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			20005:
			[SUPDataType forName:@"long"]:@"decimal(20,0)":@"replayPending":@"":@"_rp":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_replayPending setColumn:@"_rp"];
		SUPAttributeMetaDataRBS* a_replayFailure = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			20006:
			[SUPDataType forName:@"long"]:@"decimal(20,0)":@"replayFailure":@"":@"_rf":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_replayFailure setColumn:@"_rf"];
		SUPAttributeMetaDataRBS* a_surrogateKey = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			330:
			[SUPDataType forName:@"long"]:@"decimal(20,0)":@"surrogateKey":@"":@"e":
			@"":-1:0:0:
			@"null":NO:@"":
			YES:NO:NO:NO:NO:NO:
			GeneratedScheme_GLOBAL:
			NO:SUPPersonalizationType_None:NO];
		[a_surrogateKey setColumn:@"e"];
		SUPAttributeMetaDataRBS* a_replayCounter = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			20004:
			[SUPDataType forName:@"long"]:@"decimal(20,0)":@"replayCounter":@"_rc":@"_rc":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_replayCounter setColumn:@"_rc"];
		SUPAttributeMetaDataRBS* a_disableSubmit = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			20003:
			[SUPDataType forName:@"boolean"]:@"tinyint":@"disableSubmit":@"":@"_ds":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_disableSubmit setColumn:@"_ds"];
 		
		[attributes addThis:a_item_id];
		[attributes addThis:a_item_name];
		[attributes addThis:a_item_price];
		[attributes addThis:a_item_organization];
		[attributes addThis:a_pending];
		[attributes addThis:a_pendingChange];
		[attributes addThis:a_replayPending];
		[attributes addThis:a_replayFailure];
		[attributes addThis:a_surrogateKey];
		[attributes addThis:a_replayCounter];
		[attributes addThis:a_disableSubmit];
		self.attributes = attributes;
		
		SUPAttributeMap * attributeMap = [SUPAttributeMap getInstance];
   		[attributeMap setAttributes:attributes];
	   	self.attributeMap = attributeMap;

 		SUPOperationMetaData* o_findAll_0 = [SUPOperationMetaData createOperationMetaData:1:(SUPString)@"findAll":[SUPDataType forName:@"Inventory*"]:true];
		[o_findAll_0 setIsStatic:YES];
		[o_findAll_0 setIsCreate:NO];
		[o_findAll_0 setIsUpdate:NO];
		[o_findAll_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_findByPrimaryKey_1 = [SUPOperationMetaData createOperationMetaData:2:(SUPString)@"findByPrimaryKey":[SUPDataType forName:@"Inventory"]:true];
	  	{
			SUPObjectList *parameters_list = nil;
	 		SUPParameterMetaData* p_findByPrimaryKey_item_id = [SUPParameterMetaData createParameterMetaData:1:(SUPString)@"item_id":[SUPDataType forName:@"int"]];
 			parameters_list = [SUPObjectList listWithCapacity:1];
			[parameters_list addThis:p_findByPrimaryKey_item_id];
			o_findByPrimaryKey_1.parameters = parameters_list;
	 	}
		[o_findByPrimaryKey_1 setIsStatic:YES];
		[o_findByPrimaryKey_1 setIsCreate:NO];
		[o_findByPrimaryKey_1 setIsUpdate:NO];
		[o_findByPrimaryKey_1 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_findByOrganization_1 = [SUPOperationMetaData createOperationMetaData:3:(SUPString)@"findByOrganization":[SUPDataType forName:@"Inventory*"]:true];
	  	{
			SUPObjectList *parameters_list = nil;
	 		SUPParameterMetaData* p_findByOrganization_organization = [SUPParameterMetaData createParameterMetaData:1:(SUPString)@"organization":[SUPDataType forName:@"string"]];
 			parameters_list = [SUPObjectList listWithCapacity:1];
			[parameters_list addThis:p_findByOrganization_organization];
			o_findByOrganization_1.parameters = parameters_list;
	 	}
		[o_findByOrganization_1 setIsStatic:YES];
		[o_findByOrganization_1 setIsCreate:NO];
		[o_findByOrganization_1 setIsUpdate:NO];
		[o_findByOrganization_1 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_refresh_0 = [SUPOperationMetaData createOperationMetaData:4:(SUPString)@"refresh":[SUPDataType forName:@"void"]:true];
		[o_refresh_0 setIsStatic:NO];
		[o_refresh_0 setIsCreate:NO];
		[o_refresh_0 setIsUpdate:NO];
		[o_refresh_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o__pk_0 = [SUPOperationMetaData createOperationMetaData:5:(SUPString)@"_pk":[SUPDataType forName:@"long?"]:true];
		[o__pk_0 setIsStatic:NO];
		[o__pk_0 setIsCreate:NO];
		[o__pk_0 setIsUpdate:NO];
		[o__pk_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_submitPending_0 = [SUPOperationMetaData createOperationMetaData:6:(SUPString)@"submitPending":[SUPDataType forName:@"void"]:true];
		[o_submitPending_0 setIsStatic:NO];
		[o_submitPending_0 setIsCreate:NO];
		[o_submitPending_0 setIsUpdate:NO];
		[o_submitPending_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_cancelPending_0 = [SUPOperationMetaData createOperationMetaData:7:(SUPString)@"cancelPending":[SUPDataType forName:@"void"]:true];
		[o_cancelPending_0 setIsStatic:NO];
		[o_cancelPending_0 setIsCreate:NO];
		[o_cancelPending_0 setIsUpdate:NO];
		[o_cancelPending_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_submitPendingOperations_0 = [SUPOperationMetaData createOperationMetaData:8:(SUPString)@"submitPendingOperations":[SUPDataType forName:@"void"]:true];
		[o_submitPendingOperations_0 setIsStatic:YES];
		[o_submitPendingOperations_0 setIsCreate:NO];
		[o_submitPendingOperations_0 setIsUpdate:NO];
		[o_submitPendingOperations_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_cancelPendingOperations_0 = [SUPOperationMetaData createOperationMetaData:9:(SUPString)@"cancelPendingOperations":[SUPDataType forName:@"void"]:true];
		[o_cancelPendingOperations_0 setIsStatic:YES];
		[o_cancelPendingOperations_0 setIsCreate:NO];
		[o_cancelPendingOperations_0 setIsUpdate:NO];
		[o_cancelPendingOperations_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_save_0 = [SUPOperationMetaData createOperationMetaData:10:(SUPString)@"save":[SUPDataType forName:@"void"]:true];
		[o_save_0 setIsStatic:NO];
		[o_save_0 setIsCreate:NO];
		[o_save_0 setIsUpdate:NO];
		[o_save_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_findWithQuery_1 = [SUPOperationMetaData createOperationMetaData:11:(SUPString)@"findWithQuery":[SUPDataType forName:@"Inventory*"]:true];
	  	{
			SUPObjectList *parameters_list = nil;
	 		SUPParameterMetaData* p_findWithQuery_query = [SUPParameterMetaData createParameterMetaData:1:(SUPString)@"query":[SUPDataType forName:@"com.sybase.persistence.Query"]];
 			parameters_list = [SUPObjectList listWithCapacity:1];
			[parameters_list addThis:p_findWithQuery_query];
			o_findWithQuery_1.parameters = parameters_list;
	 	}
		[o_findWithQuery_1 setIsStatic:YES];
		[o_findWithQuery_1 setIsCreate:NO];
		[o_findWithQuery_1 setIsUpdate:NO];
		[o_findWithQuery_1 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_getSize_1 = [SUPOperationMetaData createOperationMetaData:12:(SUPString)@"getSize":[SUPDataType forName:@"int"]:true];
	  	{
			SUPObjectList *parameters_list = nil;
	 		SUPParameterMetaData* p_getSize_query = [SUPParameterMetaData createParameterMetaData:1:(SUPString)@"query":[SUPDataType forName:@"com.sybase.persistence.Query"]];
 			parameters_list = [SUPObjectList listWithCapacity:1];
			[parameters_list addThis:p_getSize_query];
			o_getSize_1.parameters = parameters_list;
	 	}
		[o_getSize_1 setIsStatic:YES];
		[o_getSize_1 setIsCreate:NO];
		[o_getSize_1 setIsUpdate:NO];
		[o_getSize_1 setIsDelete:NO]; 		
 
  		SUPObjectList *operations = [SUPObjectList listWithCapacity:12];
 		[operations addThis:o_findAll_0];
 		[operations addThis:o_findByPrimaryKey_1];
 		[operations addThis:o_findByOrganization_1];
 		[operations addThis:o_refresh_0];
 		[operations addThis:o__pk_0];
 		[operations addThis:o_submitPending_0];
 		[operations addThis:o_cancelPending_0];
 		[operations addThis:o_submitPendingOperations_0];
 		[operations addThis:o_cancelPendingOperations_0];
 		[operations addThis:o_save_0];
 		[operations addThis:o_findWithQuery_1];
 		[operations addThis:o_getSize_1];
	 	self.operations = operations;
 	
		SUPOperationMap *operationMap = [SUPOperationMap getInstance];
		[operationMap setOperations:operations];
		self.operationMap = operationMap;		
		self.table = @"medsales_1_0_inventory";
		self.synchronizationGroup = @"default";

		SUPIndexMetaData *i_findByPrimaryKeyIndex = [[[SUPIndexMetaData alloc] init] autorelease];
		i_findByPrimaryKeyIndex.name = @"findByPrimaryKeyIndex";
		[i_findByPrimaryKeyIndex.attributes add:a_item_id];
	
		[self.indexList add:i_findByPrimaryKeyIndex];
			
		[self.keyList add:a_surrogateKey];


    }
    return self;
}
@end