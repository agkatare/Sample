#!/bin/bash

SESSIONKEY=$SESSION_KEY

REQUESTDATE=`date "+%Y-%m-%d%H:%M:%S"`
PARTNERID_SHA=`echo -n $PARTNER_ID${REQUESTDATE}| openssl sha1 | sed s/'(stdin)= '//`

SESSIONSECRET_SHA=`echo -n $SESSION_SECRET${REQUESTDATE}| openssl sha1 | sed s/'(stdin)= '//`
LOCALID_SHA=`echo -n $LOCAL_ID${REQUESTDATE}| openssl sha1 | sed s/'(stdin)= '//`


#. ./seturl.sh

URL=$VCS_URL/ivi/customer/$CUSTOMER_ID/logout
echo $URL
registerResp=`curl -v -H "localId: $LOCALID_SHA" -H "partnerId: $PARTNERID_SHA" -H "date: $REQUESTDATE" -H "sessionKey: $SESSIONKEY" -H "sessionSecret: $SESSIONSECRET_SHA" -X GET $URL`

echo $registerResp
 