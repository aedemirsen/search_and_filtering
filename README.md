# OAuth2 Authentication

Dynamics CRM API needs OAuth2 Authentication. To authenticate configuration below should be changed:

 - in config/app_config

```
//OAuth2
const String dynamicsCrmApi =
    'https://org6dd210f6.api.crm4.dynamics.com/api/data/v9.2';
const String clientId = '8822511f-94df-47da-900c-9df9392684f6';
const String tenantId = '3c0373be-a110-4245-bebe-dd3b9beb76d0';
const String redirectUrl =
    'https://login.microsoftonline.com/common/oauth2/nativeclient';
const String version = '9.2';

```

For testing UI with static data, I used accounts data without authentication. 
Before using CRM Api base url line should be uncommented in config file.
 
```
//const String baseUrl = "$dynamicsCrmApi/api/data/v$version";
const String baseUrl = "http://aedemirsen.bilgimeclisi.com/rest_api";
```

Also the init function in the main file should be changed into this:
```
void initApp(BuildContext context) {
  if (oneTime) {
    context.read<CubitController>().getAccessToken();
    oneTime = false;
  }
  AppConfig.screenHeight = MediaQuery.of(context).size.height;
  AppConfig.screenWidth = MediaQuery.of(context).size.width;
}
```

![](http://aedemirsen.bilgimeclisi.com/assets/sf.gif)
