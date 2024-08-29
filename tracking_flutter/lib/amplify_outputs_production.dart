const amplifyConfig = '''{
  "auth": {
    "user_pool_id": "us-east-1_BHfyEWTUa",
    "aws_region": "us-east-1",
    "user_pool_client_id": "4pmb498vio9g12qkqd5hkr24qa",
    "identity_pool_id": "us-east-1:212ca0de-1fe6-4dab-b004-93712dcf952e",
    "mfa_methods": [],
    "standard_required_attributes": [
      "email"
    ],
    "username_attributes": [
      "email"
    ],
    "user_verification_types": [
      "email"
    ],
    "mfa_configuration": "NONE",
    "password_policy": {
      "min_length": 8,
      "require_lowercase": true,
      "require_numbers": true,
      "require_symbols": true,
      "require_uppercase": true
    },
    "unauthenticated_identities_enabled": true
  },
  "version": "1.1"
}''';