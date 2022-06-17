import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:search_and_filtering/service/auth/IOAuthService.dart';
import 'package:search_and_filtering/config/app_config.dart' as conf;

class OAuthService extends IOAuthService {
  @override
  Future<String?> loginAction() async {
    Config c = Config(
      tenant: conf.tenantId,
      clientId: conf.clientId,
      redirectUri: conf.redirectUrl,
      scope: conf.dynamicCrm,
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
