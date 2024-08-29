const amplifyConfig = '''{
  "auth": {
    "user_pool_id": "us-east-1_VI0A2dm7r",
    "aws_region": "us-east-1",
    "user_pool_client_id": "5e91ufp24no3ucjj97tkuvgrrc",
    "identity_pool_id": "us-east-1:c6ce63bd-7632-430d-8aac-31843d826756",
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