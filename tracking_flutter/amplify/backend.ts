import { defineBackend } from "@aws-amplify/backend"
import { EmailIdentity } from "aws-cdk-lib/aws-ses"
import { Stack } from "aws-cdk-lib/core"
import { auth } from "./auth/resource"

const backend = defineBackend({
  auth,
})

const { cfnUserPool } = backend.auth.resources.cfnResources
const authStack = Stack.of(cfnUserPool)

const email = EmailIdentity.fromEmailIdentityName(
  authStack,
  "EmailIdentity",
  "hello@krolmic.dev"
)

cfnUserPool.emailConfiguration = {
  emailSendingAccount: "DEVELOPER",
  sourceArn: email.emailIdentityArn,
}