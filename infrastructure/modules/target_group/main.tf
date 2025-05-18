resource "aws_lb_target_group" "tg" {
  name     = var.name
  port     = var.port
  protocol = var.protocol
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "tg_attachment" {
  count = length(var.target_ids)
  # for_each        = tomap(var.target_ids)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id       = var.target_ids[count.index]
  port            = var.port
}