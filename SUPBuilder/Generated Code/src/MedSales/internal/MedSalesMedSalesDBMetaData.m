#import "MedSalesMedSalesDBMetaData.h"

#import "SUPObjectList.h"
#import "SUPClassMap.h"
#import "SUPEntityMap.h"
#import "MedSalesAccounts.h"
#import "MedSalesInventory.h"
#import "MedSalesOrganizations.h"
#import "MedSalesSurgeons.h"
#import "MedSalesLogRecordImpl.h"
#import "MedSalesOperationReplay.h"
#import "MedSalesSISSubscriptionKey.h"
#import "MedSalesSISSubscription.h"
#import "MedSalesPackageProperties.h"
#import "MedSalesChangeLogKey.h"
#import "MedSalesChangeLogImpl.h"
#import "MedSalesOfflineAuthentication.h"
#import "MedSalesKeyPackageName.h"
#import "MedSalesPersonalizationParameters.h"
#import "MedSalesKeyGenerator.h"
#import "MedSalesKeyGeneratorPK.h"
#import "MedSalesLocalKeyGenerator.h"
#import "MedSalesLocalKeyGeneratorPK.h"

@implementation MedSalesMedSalesDBMetaData

+ (MedSalesMedSalesDBMetaData*)getInstance
{
    return [[[MedSalesMedSalesDBMetaData alloc] init] autorelease];
}

- (id)init
{
    if (self = [super init]) {
		self.id = 0;
		self.databaseName = @"MedSalesMedSalesDB";
		self.packageName = @"MedSales";

		SUPObjectList *classList = [SUPObjectList listWithCapacity:19];
		[classList addThis:[MedSalesAccounts metaData]];
		[MedSalesAccounts delegate];
		[classList addThis:[MedSalesInventory metaData]];
		[MedSalesInventory delegate];
		[classList addThis:[MedSalesOrganizations metaData]];
		[MedSalesOrganizations delegate];
		[classList addThis:[MedSalesSurgeons metaData]];
		[MedSalesSurgeons delegate];
		[classList addThis:[MedSalesLogRecordImpl metaData]];
		[MedSalesLogRecordImpl delegate];
		[classList addThis:[MedSalesOperationReplay metaData]];
		[MedSalesOperationReplay delegate];
		[classList addThis:[MedSalesSISSubscriptionKey metaData]];
		[MedSalesSISSubscriptionKey delegate];
		[classList addThis:[MedSalesSISSubscription metaData]];
		[MedSalesSISSubscription delegate];
		[classList addThis:[MedSalesPackageProperties metaData]];
		[MedSalesPackageProperties delegate];
		[classList addThis:[MedSalesChangeLogKey metaData]];
		[MedSalesChangeLogKey delegate];
		[classList addThis:[MedSalesChangeLogImpl metaData]];
		[MedSalesChangeLogImpl delegate];
		[classList addThis:[MedSalesOfflineAuthentication metaData]];
		[MedSalesOfflineAuthentication delegate];
		[classList addThis:[MedSalesKeyPackageName metaData]];
		[MedSalesKeyPackageName delegate];
		[classList addThis:[MedSalesPersonalizationParameters metaData]];
		[MedSalesPersonalizationParameters delegate];
		[classList addThis:[MedSalesKeyGenerator metaData]];
		[MedSalesKeyGenerator delegate];
		[classList addThis:[MedSalesKeyGeneratorPK metaData]];
		[MedSalesKeyGeneratorPK delegate];
		[classList addThis:[MedSalesLocalKeyGenerator metaData]];
		[MedSalesLocalKeyGenerator delegate];
		[classList addThis:[MedSalesLocalKeyGeneratorPK metaData]];
		[MedSalesLocalKeyGeneratorPK delegate];
		self.classList = classList;
		SUPClassMap *classMap = [SUPClassMap getInstance];
		[classMap setClasses:classList];
		self.classMap = classMap;

		SUPObjectList *entityList = [SUPObjectList listWithCapacity:12];
		[entityList addThis:[MedSalesAccounts metaData]];
		[MedSalesAccounts delegate];
		[entityList addThis:[MedSalesInventory metaData]];
		[MedSalesInventory delegate];
		[entityList addThis:[MedSalesOrganizations metaData]];
		[MedSalesOrganizations delegate];
		[entityList addThis:[MedSalesSurgeons metaData]];
		[MedSalesSurgeons delegate];
		[entityList addThis:[MedSalesLogRecordImpl metaData]];
		[MedSalesLogRecordImpl delegate];
		[entityList addThis:[MedSalesOperationReplay metaData]];
		[MedSalesOperationReplay delegate];
		[entityList addThis:[MedSalesSISSubscription metaData]];
		[MedSalesSISSubscription delegate];
		[entityList addThis:[MedSalesPackageProperties metaData]];
		[MedSalesPackageProperties delegate];
		[entityList addThis:[MedSalesChangeLogImpl metaData]];
		[MedSalesChangeLogImpl delegate];
		[entityList addThis:[MedSalesOfflineAuthentication metaData]];
		[MedSalesOfflineAuthentication delegate];
		[entityList addThis:[MedSalesKeyGenerator metaData]];
		[MedSalesKeyGenerator delegate];
		[entityList addThis:[MedSalesLocalKeyGenerator metaData]];
		[MedSalesLocalKeyGenerator delegate];
		self.entityList = entityList;
	    SUPEntityMap *entityMap = [SUPEntityMap getInstance];
    	[entityMap setEntities:entityList];
	    self.entityMap = entityMap;
		SUPObjectList *attributes = [SUPObjectList listWithCapacity:7];
		self.name = @"MedSalesDB";
 
       	// Handle attributes
 		self.attributes = attributes;;
 		
 		SUPAttributeMap * attributeMap = [SUPAttributeMap getInstance];
    	[attributeMap setAttributes:attributes];
    	self.attributeMap = attributeMap;

 		// Handle operations
 		int operation_counter = 0;
 		operation_counter++;
 		SUPOperationMetaData* o_createDatabase_0 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"createDatabase":[SUPDataType forName:@"void"]:true];
 		[o_createDatabase_0 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_cleanAllData_1 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"cleanAllData":[SUPDataType forName:@"void"]:true];
  		{
 			int parameters_counter=0;
 			SUPObjectList *parameters_list = nil;
 			parameters_counter++;
 			SUPParameterMetaData* p_cleanAllData_p0 = [SUPParameterMetaData createParameterMetaData:parameters_counter:(SUPString)@"p0":[SUPDataType forName:@"boolean"]];
 			parameters_list = [SUPObjectList listWithCapacity:parameters_counter];
 			[parameters_list addThis:p_cleanAllData_p0];
 			o_cleanAllData_1.parameters = parameters_list;
 		}
 		[o_cleanAllData_1 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_cleanAllData_0 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"cleanAllData":[SUPDataType forName:@"void"]:true];
 		[o_cleanAllData_0 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_getSyncUsername_0 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"getSyncUsername":[SUPDataType forName:@"string"]:true];
 		[o_getSyncUsername_0 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_loginToSync_2 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"loginToSync":[SUPDataType forName:@"void"]:true];
  		{
 			int parameters_counter=0;
 			SUPObjectList *parameters_list = nil;
 			parameters_counter++;
 			SUPParameterMetaData* p_loginToSync_p0 = [SUPParameterMetaData createParameterMetaData:parameters_counter:(SUPString)@"p0":[SUPDataType forName:@"string"]];
 			parameters_counter++;
 			SUPParameterMetaData* p_loginToSync_p1 = [SUPParameterMetaData createParameterMetaData:parameters_counter:(SUPString)@"p1":[SUPDataType forName:@"string"]];
 			parameters_list = [SUPObjectList listWithCapacity:parameters_counter];
 			[parameters_list addThis:p_loginToSync_p0];
 			[parameters_list addThis:p_loginToSync_p1];
 			o_loginToSync_2.parameters = parameters_list;
 		}
 		[o_loginToSync_2 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_onlineLogin_2 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"onlineLogin":[SUPDataType forName:@"void"]:true];
  		{
 			int parameters_counter=0;
 			SUPObjectList *parameters_list = nil;
 			parameters_counter++;
 			SUPParameterMetaData* p_onlineLogin_p0 = [SUPParameterMetaData createParameterMetaData:parameters_counter:(SUPString)@"p0":[SUPDataType forName:@"string"]];
 			parameters_counter++;
 			SUPParameterMetaData* p_onlineLogin_p1 = [SUPParameterMetaData createParameterMetaData:parameters_counter:(SUPString)@"p1":[SUPDataType forName:@"string"]];
 			parameters_list = [SUPObjectList listWithCapacity:parameters_counter];
 			[parameters_list addThis:p_onlineLogin_p0];
 			[parameters_list addThis:p_onlineLogin_p1];
 			o_onlineLogin_2.parameters = parameters_list;
 		}
 		[o_onlineLogin_2 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_offlineLogin_2 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"offlineLogin":[SUPDataType forName:@"boolean"]:true];
  		{
 			int parameters_counter=0;
 			SUPObjectList *parameters_list = nil;
 			parameters_counter++;
 			SUPParameterMetaData* p_offlineLogin_p0 = [SUPParameterMetaData createParameterMetaData:parameters_counter:(SUPString)@"p0":[SUPDataType forName:@"string"]];
 			parameters_counter++;
 			SUPParameterMetaData* p_offlineLogin_p1 = [SUPParameterMetaData createParameterMetaData:parameters_counter:(SUPString)@"p1":[SUPDataType forName:@"string"]];
 			parameters_list = [SUPObjectList listWithCapacity:parameters_counter];
 			[parameters_list addThis:p_offlineLogin_p0];
 			[parameters_list addThis:p_offlineLogin_p1];
 			o_offlineLogin_2.parameters = parameters_list;
 		}
 		[o_offlineLogin_2 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_synchronize_1 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"synchronize":[SUPDataType forName:@"void"]:true];
  		{
 			int parameters_counter=0;
 			SUPObjectList *parameters_list = nil;
 			parameters_counter++;
 			SUPParameterMetaData* p_synchronize_p0 = [SUPParameterMetaData createParameterMetaData:parameters_counter:(SUPString)@"p0":[SUPDataType forName:@"string"]];
 			parameters_list = [SUPObjectList listWithCapacity:parameters_counter];
 			[parameters_list addThis:p_synchronize_p0];
 			o_synchronize_1.parameters = parameters_list;
 		}
 		[o_synchronize_1 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_submitPendingOperations_0 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"submitPendingOperations":[SUPDataType forName:@"void"]:true];
 		[o_submitPendingOperations_0 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_synchronize_0 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"synchronize":[SUPDataType forName:@"void"]:true];
 		[o_synchronize_0 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_submitPendingOperations_1 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"submitPendingOperations":[SUPDataType forName:@"void"]:true];
  		{
 			int parameters_counter=0;
 			SUPObjectList *parameters_list = nil;
 			parameters_counter++;
 			SUPParameterMetaData* p_submitPendingOperations_p0 = [SUPParameterMetaData createParameterMetaData:parameters_counter:(SUPString)@"p0":[SUPDataType forName:@"string"]];
 			parameters_list = [SUPObjectList listWithCapacity:parameters_counter];
 			[parameters_list addThis:p_submitPendingOperations_p0];
 			o_submitPendingOperations_1.parameters = parameters_list;
 		}
 		[o_submitPendingOperations_1 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_cancelPendingOperations_0 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"cancelPendingOperations":[SUPDataType forName:@"void"]:true];
 		[o_cancelPendingOperations_0 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_submitLogRecords_0 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"submitLogRecords":[SUPDataType forName:@"void"]:true];
 		[o_submitLogRecords_0 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_deleteDatabase_0 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"deleteDatabase":[SUPDataType forName:@"void"]:true];
 		[o_deleteDatabase_0 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_isSynchronized_1 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"isSynchronized":[SUPDataType forName:@"boolean"]:true];
  		{
 			int parameters_counter=0;
 			SUPObjectList *parameters_list = nil;
 			parameters_counter++;
 			SUPParameterMetaData* p_isSynchronized_p0 = [SUPParameterMetaData createParameterMetaData:parameters_counter:(SUPString)@"p0":[SUPDataType forName:@"string"]];
 			parameters_list = [SUPObjectList listWithCapacity:parameters_counter];
 			[parameters_list addThis:p_isSynchronized_p0];
 			o_isSynchronized_1.parameters = parameters_list;
 		}
 		[o_isSynchronized_1 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_getLastSynchronizationTime_1 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"getLastSynchronizationTime":[SUPDataType forName:@"dateTime"]:true];
  		{
 			int parameters_counter=0;
 			SUPObjectList *parameters_list = nil;
 			parameters_counter++;
 			SUPParameterMetaData* p_getLastSynchronizationTime_p0 = [SUPParameterMetaData createParameterMetaData:parameters_counter:(SUPString)@"p0":[SUPDataType forName:@"string"]];
 			parameters_list = [SUPObjectList listWithCapacity:parameters_counter];
 			[parameters_list addThis:p_getLastSynchronizationTime_p0];
 			o_getLastSynchronizationTime_1.parameters = parameters_list;
 		}
 		[o_getLastSynchronizationTime_1 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_getPersonalizationParameters_0 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"getPersonalizationParameters":[SUPDataType forName:@"PersonalizationParameters"]:true];
 		[o_getPersonalizationParameters_0 setIsStatic:YES];
 
  		SUPObjectList *operations = [SUPObjectList listWithCapacity:operation_counter];
 		[operations addThis:o_createDatabase_0];
 		[operations addThis:o_cleanAllData_1];
 		[operations addThis:o_cleanAllData_0];
 		[operations addThis:o_getSyncUsername_0];
 		[operations addThis:o_loginToSync_2];
 		[operations addThis:o_onlineLogin_2];
 		[operations addThis:o_offlineLogin_2];
 		[operations addThis:o_synchronize_1];
 		[operations addThis:o_submitPendingOperations_0];
 		[operations addThis:o_synchronize_0];
 		[operations addThis:o_submitPendingOperations_1];
 		[operations addThis:o_cancelPendingOperations_0];
 		[operations addThis:o_submitLogRecords_0];
 		[operations addThis:o_deleteDatabase_0];
 		[operations addThis:o_isSynchronized_1];
 		[operations addThis:o_getLastSynchronizationTime_1];
 		[operations addThis:o_getPersonalizationParameters_0];
 		self.operations = operations;
 		
		SUPOperationMap *operationMap = [SUPOperationMap getInstance];
		[operationMap setOperations:operations];
		self.operationMap = operationMap;

		SUPStringList *publications = [SUPStringList getInstance];
		NSMutableDictionary *publicationsToEntities = [[[NSMutableDictionary alloc] init] autorelease];
		[publications add:@"default"];
		SUPObjectList *defaultEntities = [SUPObjectList getInstance];
		[defaultEntities add:[MedSalesAccounts metaData]];
		[defaultEntities add:[MedSalesInventory metaData]];
		[defaultEntities add:[MedSalesOrganizations metaData]];
		[defaultEntities add:[MedSalesSurgeons metaData]];
		[defaultEntities add:[MedSalesLogRecordImpl metaData]];
		[defaultEntities add:[MedSalesOperationReplay metaData]];
		[defaultEntities add:[MedSalesSISSubscription metaData]];
		[defaultEntities add:[MedSalesPackageProperties metaData]];
		[defaultEntities add:[MedSalesChangeLogImpl metaData]];
		[defaultEntities add:[MedSalesKeyGenerator metaData]];
		[publicationsToEntities setObject:defaultEntities forKey:@"default"];
		
		[publications add:@"unsubscribe"];
		SUPObjectList *unsubscribeEntities = [SUPObjectList getInstance];
		[unsubscribeEntities add:[MedSalesKeyGenerator metaData]];
		[publicationsToEntities setObject:unsubscribeEntities forKey:@"unsubscribe"];
		
		[publications add:@"system"];
		SUPObjectList *systemEntities = [SUPObjectList getInstance];
		[systemEntities add:[MedSalesLogRecordImpl metaData]];
		[systemEntities add:[MedSalesOperationReplay metaData]];
		[systemEntities add:[MedSalesSISSubscription metaData]];
		[systemEntities add:[MedSalesPackageProperties metaData]];
		[systemEntities add:[MedSalesKeyGenerator metaData]];
		[publicationsToEntities setObject:systemEntities forKey:@"system"];
		
		[publications add:@"initialSync"];
		SUPObjectList *initialSyncEntities = [SUPObjectList getInstance];
		[initialSyncEntities add:[MedSalesPackageProperties metaData]];
		[initialSyncEntities add:[MedSalesKeyGenerator metaData]];
		[publicationsToEntities setObject:initialSyncEntities forKey:@"initialSync"];
		
		self.publicationsMap = publicationsToEntities;
		self.publications = publications;
    }
    return self;
}

@end