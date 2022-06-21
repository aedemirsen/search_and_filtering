import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:search_and_filtering/config/app_config.dart' as conf;

import 'IOAuthService.dart';

class OAuthService extends IOAuthService {
  @override
  Future<String?> authenticate() async {
    Config c = Config(
      tenant: conf.tenantId,
      clientId: conf.clientId,
      redirectUri: conf.redirectUrl,
      scope: conf.dynamicsCrmApi,
      navigatorKey: conf.AppConfig.navigatorKey,
    );
    AadOAuth auth = AadOAuth(c);
    try {
      await auth.login();
      return await auth.getAccessToken();
    } on Exception {
      return null;
    }
  }
}
