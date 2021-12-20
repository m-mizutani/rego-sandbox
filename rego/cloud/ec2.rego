package aws

allowed_instances := [
	"i-00000000000000000",
	"i-11111111111111111",
	"i-22222222222222222",
]

allowed_tags := [{
	"Key": "type",
	"Value": "public",
}]

exposed_instances[msg] {
	instance := input.Reservations[_].Instances[_]
	instance.PublicIpAddress != ""

	count({x | allowed_instances[x] == instance.InstanceId}) == 0
	count({y |
		allowed_tags[y].Key == instance.Tags[z].Key
		allowed_tags[y].Value == instance.Tags[z].Value
	}) == 0

	msg := sprintf("instance %s is exposed unexpectedly", [instance.InstanceId])
}
