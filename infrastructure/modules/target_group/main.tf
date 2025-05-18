resource "aws_lb_target_group" "tg" {
  name     = var.name
  port     = var.port
  protocol = var.protocol
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "tg_attachment" {
  for_each        = toset(var.target_ids)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id       = each.value
  port            = var.port
}