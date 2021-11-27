import * as cdk from "@aws-cdk/core";
import * as lambda from "@aws-cdk/aws-lambda";

export class CdkStack extends cdk.Stack {
  constructor(scope: cdk.Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    new lambda.Function(this, "main", {
      runtime: lambda.Runtime.GO_1_X,
      // ./build/main にコンパイル済みバイナリが置かれる想定
      handler: "main",
      code: lambda.Code.fromAsset("./build"),
    });
  }
}
