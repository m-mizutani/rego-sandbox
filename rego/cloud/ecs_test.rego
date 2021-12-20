package aws

test_ecs {
    result := deployed_unexpected_image with input as data.testdata.cloudwatch
    result["Deployed unexpected image arn:aws:ecs:us-west-2:111122223333:container/cf159fd6-3e3f-4a9e-84f9-66cbe726af01"]
}
