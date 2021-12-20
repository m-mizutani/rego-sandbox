package aws

allowed_registries = [
    "111111111.dkr.ecr.us-west-2.amazonaws.com/",
    "222222222.dkr.ecr.us-west-2.amazonaws.com/",
    "111111111.dkr.ecr.ap-northeast-1.amazonaws.com/nginx:",
]

deployed_unexpected_image[msg] {
    input.source == "aws.ecs"
    container := input.detail.containers[_]
    count({x | startswith(container.image, allowed_registries[x])}) == 0

    msg := sprintf("Deployed unexpected image %s", [container.containerArn])
}
