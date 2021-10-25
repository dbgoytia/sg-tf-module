#################################################
# Security groups
#################################################

resource "aws_security_group" "this" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags
  )

}

#################################################
# Ingress rules
#################################################

resource "aws_security_group_rule" "ingress_rules" {
  count = length(var.ingress_rules)

  security_group_id = aws_security_group.this.id
  type              = "ingress"

  cidr_blocks = split(
    ",",
    lookup(
      var.ingress_rules[count.index],
      "cidr_blocks",
      join(",", var.ingress_cidr_blocks)
    )
  )

  description = lookup(
    var.ingress_rules[count.index],
    "description",
    "Ingress Rule",
  )

  from_port = lookup(
    var.ingress_rules[count.index],
    "from_port",
    var.rules[lookup(var.ingress_rules[count.index], "rule", "_")][0],
  )

  to_port = lookup(
    var.ingress_rules[count.index],
    "to_port",
    var.rules[lookup(var.ingress_rules[count.index], "rule", "_")][1]
  )

  protocol = lookup(
    var.ingress_rules[count.index],
    "protocol",
    var.rules[lookup(var.ingress_rules[count.index], "rule", "_")][2]
  )

}

#################################################
# Egress rules
#################################################

resource "aws_security_group_rule" "egress_rules" {
  count = length(var.egress_rules)

  security_group_id = aws_security_group.this.id
  type              = "egress"

  cidr_blocks = split(
    ",",
    lookup(
      var.egress_rules[count.index],
      "cidr_blocks",
      join(",", var.egress_cidr_blocks)
    )
  )

  description = lookup(
    var.egress_rules[count.index],
    "description",
    "Egress Rule",
  )

  from_port = lookup(
    var.egress_rules[count.index],
    "from_port",
    var.rules[lookup(var.egress_rules[count.index], "rule", "_")][0],
  )

  to_port = lookup(
    var.egress_rules[count.index],
    "to_port",
    var.rules[lookup(var.egress_rules[count.index], "rule", "_")][1]
  )

  protocol = lookup(
    var.egress_rules[count.index],
    "protocol",
    var.rules[lookup(var.egress_rules[count.index], "rule", "_")][2]
  )

}