#!/bin/bash
#
# For Xamarin, change some constants located in some class of the app.
# In this sample, suppose we have an AppConstant.cs class in shared folder with follow content:
#
# namespace Core
# {
#     public class AppConstant
#     {
#         public const string ApiUrl = "https://CMS_MyApp-Eur01.com/api";
#     }
# }
# 
# Suppose in our project exists two branches: master and develop. 
# We can release app for production API in master branch and app for test API in develop branch. 
# We just need configure this behaviour with environment variable in each branch :)
# 
# The same thing can be perform with any class of the app.
#
# AN IMPORTANT THING: FOR THIS SAMPLE YOU NEED DECLARE API_URL ENVIRONMENT VARIABLE IN APP CENTER BUILD CONFIGURATION.

if [ -z "BASE_URL" ]
then
    echo "You need define the BASE_URL variable in App Center"
    exit
fi

if [ -z "AUTHORIZATION_HEADER" ]
then
    echo "You need define the AUTHORIZATION_HEADER variable in App Center"
    exit
fi

if [ -z "OAUTH2_AUTHORISE_URL" ]
then
    echo "You need define the OAUTH2_AUTHORISE_URL variable in App Center"
    exit
fi

if [ -z "OAUTH2_ACCESSTOKEN_URL" ]
then
    echo "You need define the OAUTH2_ACCESSTOKEN_URL variable in App Center"
    exit
fi

if [ -z "OAUTH2_VERIFY_TOKEN_PUBLIC_KEY" ]
then
    echo "You need define the OAUTH2_VERIFY_TOKEN_PUBLIC_KEY variable in App Center"
    exit
fi

if [ -z "OAUTH2_CLIENT_ID" ]
then
    echo "You need define the OAUTH2_CLIENT_ID variable in App Center"
    exit
fi

if [ -z "OAUTH2_SCOPE" ]
then
    echo "You need define the OAUTH2_SCOPE variable in App Center"
    exit
fi

if [ -z "OAUTH2_REDIRECT_URL" ]
then
    echo "You need define the OAUTH2_REDIRECT_URL variable in App Center"
    exit
fi

CONF_FILE=$APPCENTER_SOURCE_DIRECTORY/NDB.Covid19/NDB.Covid19/Configuration/Conf.cs
OAUTH_CONF_FILE=$APPCENTER_SOURCE_DIRECTORY/NDB.Covid19/NDB.Covid19/Configuration/OAuthConf.cs

if [ -e "$CONF_FILE" ]
then
    echo "Updating BASE_URL to $BASE_URL in Conf.cs"
    sed -i '' 's#BASE_URL = "[-A-Za-z0-9:_./]*"#BASE_URL = "'$BASE_URL'"#' $CONF_FILE

    echo "Updating AUTHORIZATION_HEADER to $AUTHORIZATION_HEADER in Conf.cs"
    sed -i '' 's#AUTHORIZATION_HEADER = "[-A-Za-z0-9:_./]*"#AUTHORIZATION_HEADER = "'$AUTHORIZATION_HEADER'"#' $CONF_FILE

    echo "File content:"
    cat $CONF_FILE
    echo "Finished updating $CONF_FILE"
else
    echo "$CONF_FILE is missing"
    exit
fi

if [ -e "$OAUTH_CONF_FILE" ]
then
    echo "Updating OAUTH2_AUTHORISE_URL to $OAUTH2_AUTHORISE_URL in OAuthConf.cs"
    sed -i '' 's#OAUTH2_AUTHORISE_URL = "[-A-Za-z0-9:_./]*"#OAUTH2_AUTHORISE_URL = "'$OAUTH2_AUTHORISE_URL'"#' $OAUTH_CONF_FILE

    echo "Updating OAUTH2_ACCESSTOKEN_URL to $OAUTH2_ACCESSTOKEN_URL in OAuthConf.cs"
    sed -i '' 's#OAUTH2_ACCESSTOKEN_URL = "[-A-Za-z0-9:_./]*"#OAUTH2_ACCESSTOKEN_URL = "'$OAUTH2_ACCESSTOKEN_URL'"#' $OAUTH_CONF_FILE

    echo "Updating OAUTH2_VERIFY_TOKEN_PUBLIC_KEY to $OAUTH2_VERIFY_TOKEN_PUBLIC_KEY in OAuthConf.cs"
    sed -i '' 's#OAUTH2_VERIFY_TOKEN_PUBLIC_KEY = "[-A-Za-z0-9:_./]*"#OAUTH2_VERIFY_TOKEN_PUBLIC_KEY = "'$OAUTH2_VERIFY_TOKEN_PUBLIC_KEY'"#' $OAUTH_CONF_FILE

    echo "Updating OAUTH2_CLIENT_ID to $OAUTH2_CLIENT_ID in OAuthConf.cs"
    sed -i '' 's#OAUTH2_CLIENT_ID = "[-A-Za-z0-9:_./]*"#OAUTH2_CLIENT_ID = "'$OAUTH2_CLIENT_ID'"#' $OAUTH_CONF_FILE

    echo "Updating OAUTH2_SCOPE to $OAUTH2_SCOPE in OAuthConf.cs"
    sed -i '' 's#OAUTH2_SCOPE = "[-A-Za-z0-9:_./]*"#OAUTH2_SCOPE = "'$OAUTH2_SCOPE'"#' $OAUTH_CONF_FILE

    echo "Updating OAUTH2_REDIRECT_URL to $OAUTH2_REDIRECT_URL in OAuthConf.cs"
    sed -i '' 's#OAUTH2_REDIRECT_URL = "[-A-Za-z0-9:_./]*"#OAUTH2_REDIRECT_URL = "'$OAUTH2_REDIRECT_URL'"#' $OAUTH_CONF_FILE

    echo "File content:"
    cat $OAUTH_CONF_FILE
    echo "Finished updating $OAUTH_CONF_FILE"
else
    echo "$OAUTH_CONF_FILE is missing"
    exit
fi
