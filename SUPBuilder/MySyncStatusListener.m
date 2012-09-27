//
//  MySyncStatusListener.m
//
//  Created by Nafiz reza on 3/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MySyncStatusListener.h"

@implementation MySyncStatusListener


-(void) onGetSyncStatusChange:(SUPSyncStatusInfo*)info
{
    switch(info.state)
    {
        case SYNC_STATE_NONE:
            MBOLogDebug(@"SYNC_STATE_NONE");
            break;
        case SYNC_STATE_STARTING:
            MBOLogDebug(@"SYNC_STATE_STARTING");
            break;
        case SYNC_STATE_CONNECTING:
            MBOLogDebug(@"SYNC_STATE_CONNECTING");
            break;
        case SYNC_STATE_SENDING_HEADER:   
            MBOLogDebug(@"SYNC_STATE_SENDING_HEADER");
            break;
        case SYNC_STATE_SENDING_TABLE:
            MBOLogDebug(@"SYNC_STATE_SENDING_TABLE");
            break;
        case SYNC_STATE_SENDING_DATA:
            MBOLogDebug(@"SYNC_STATE_SENDING_DATA");
            break;
        case SYNC_STATE_FINISHING_UPLOAD:
            MBOLogDebug(@"SYNC_STATE_FINISHING_UPLOAD");
            break;
        case SYNC_STATE_RECEIVING_UPLOAD_ACK:
            MBOLogDebug(@"SYNC_STATE_RECEIVING_UPLOAD_ACK");
            break;
        case SYNC_STATE_RECEIVING_TABLE:
            MBOLogDebug(@"SYNC_STATE_RECEIVING_TABLE");
            break;
        case SYNC_STATE_RECEIVING_DATA:
            MBOLogDebug(@"SYNC_STATE_RECEIVING_DATA");
            break;
        case SYNC_STATE_COMMITTING_DOWNLOAD:
            MBOLogDebug(@"SYNC_STATE_COMMITTING_DOWNLOAD");
            break;
        case SYNC_STATE_SENDING_DOWNLOAD_ACK:
            MBOLogDebug(@"SYNC_STATE_SENDING_DOWNLOAD_ACK");
            break;
        case SYNC_STATE_DISCONNECTING:
            MBOLogDebug(@"SYNC_STATE_DISCONNECTING");
            break;
        case SYNC_STATE_DONE:
            MBOLogDebug(@"SYNC_STATE_DONE");
            break;           
        default:
            MBOLogDebug(@"DEFAULT");
            break;       
    }
}

@end
