package aws

test_ec2 {
    {"instance i-1234567890abcdef0 is exposed unexpectedly"} == exposed_instances with input as data.testdata.ec2
}
