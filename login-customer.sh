#!/bin/bash

SESSIONKEY=$SESSION_KEY

REQUESTDATE=`date "+%Y-%m-%dT%H:%M:%S"`
PARTNERID_SHA=`echo -n $PARTNER_ID${REQUESTDATE}| openssl sha1 | sed s/'(stdin)= '//`
LOCALID_SHA=`echo -n $LOCAL_ID${REQUESTDATE}| openssl sha1 | sed s/'(stdin)= '//`
SESSIONSECRET_SHA=`echo -n $SESSION_SECRET${REQUESTDATE}| openssl sha1 | sed s/'(stdin)= '//`



DATA="<login><email>"$EmailId"</email><password>"$Password"</password></login>"
echo $DATA
URL=$VCS_URL/ivi/customer/login/

#echo $URL

loginResp=`curl -v -H "localId: $LOCALID_SHA" -H "partnerId: $PARTNERID_SHA" -H "date: $REQUESTDATE" -H "sessionKey: $SESSIONKEY" -H "sessionSecret: $SESSIONSECRET_SHA" -H "Content-Type: application/xml" -X POST --data $DATA $URL`

#echo ${loginResp}
