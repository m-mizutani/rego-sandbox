import * as cdk from "@aws-cdk/core";
import * as lambda from "@aws-cdk/aws-lambda";
import * as path from "path";

export class CdkStack extends cdk.Stack {
  constructor(scope: cdk.Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    const rootPath = path.resolve(__dirname, "..");
    const asset = lambda.Code.fromAsset(rootPath, {
      bundling: {
        image: lambda.Runtime.GO_1_X.bundlingImage,
        user: "root",
        command: ["make", "asset"],
      },
    });

    new lambda.Function(this, "main", {
      runtime: lambda.Runtime.GO_1_X,
      handler: "main",
      code: asset,
    });
  }
}
