#ALB
resource "aws_lb" "alb" {
  name               = "app-load-balance"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg-id]
  subnets            = var.subnet-alb

}

#Listener
resource "aws_lb_listener" "alb-lestener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
#Target Group
resource "aws_lb_target_group" "tg" {
  name     = "alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc-id-tg
  }
#Target Group Attactment
resource "aws_lb_target_group_attachment" "tga" {
  count = length(var.instances)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.instances[count.index]
  port             = 80
}