 variable "domain_name" {
   default = "korede.me"
}

resource "aws_route53_zone" "korede" {
  name = var.domain_name
 #lifecycle {
  #prevent_destroy = false
#}

}


resource "aws_route53_record" "ngo" {
  depends_on = [data.local_file.lb_hostname]
  zone_id = data.aws_route53_zone.example.zone_id  

  name    = "ngo"
  type    = "CNAME"
  ttl     = "300"

  records = [data.local_file.lb_hostname.content]
}


resource "aws_route53_record" "grafana" {
  depends_on = [data.local_file.lb_hostname]
  zone_id = data.aws_route53_zone.example.zone_id   

  name    = "grafana" 
  type    = "CNAME"
  ttl     = "300"

  records = [data.local_file.lb_hostname.content]
}


resource "aws_route53_record" "prometheus" {
  depends_on = [data.local_file.lb_hostname]
  zone_id = data.aws_route53_zone.example.zone_id   

  name    = "prometheus" 
  type    = "CNAME"
  ttl     = "300"

  records = [data.local_file.lb_hostname.content]
}


