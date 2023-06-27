 variable "domain_name" {
   default = "basils.live"
}


 resource "kubernetes_ingress_v1" "microservice" {
    depends_on = [helm_release.nginix-ingress]
  metadata {
    name = "ngo"
     #namespace = "sock-shop"
     annotations = {
       "kubernetes.io/ingress.class" = "nginx"
       "nginx.ingress.kubernetes.io/ssl-redirect" = "true"
       #"cert-manager.io/cluster-issuer" = "letsencrypt-prod"
     }
   }
  spec {
     rule { 
       host = "ngo.korede.me"
       http {
         path {
           backend {
             service {
                 name = "ngo-app-service"
                 port {
                     number = 80
                     }
                 }
             }
          }
        }
    }

    #tls {
     #  hosts = ["ngo.korede.me"]
      #secret_name = "ssl"
    #}

  }
 }


 resource "kubernetes_ingress_v1" "grafana" {
     depends_on = [helm_release.nginix-ingress]
   metadata {
     name = "grafana"
     namespace = "monitoring"
     annotations = {
       "kubernetes.io/ingress.class" = "nginx"
       "nginx.ingress.kubernetes.io/ssl-redirect" = "true"
       #"cert-manager.io/cluster-issuer" = "letsencrypt-prod"
     }
   }
  spec {
     rule {
       host = "grafana.basils.live"
       http {
         path {
          backend {
             service {
                 name = "prometheus-grafana"
              port {
                 number = 80
             } 

             } 

           }
         }
       }
     }

    #tls {
     #  hosts = ["grafana.basils.live"]
      # secret_name = "ssl"
     #}

  }
 }


 resource "kubernetes_ingress_v1" "prometheus" {
     depends_on = [helm_release.nginix-ingress]
   metadata {
    name = "prometheus"
     namespace = "monitoring"
     annotations = {
       "kubernetes.io/ingress.class" = "nginx"
       "nginx.ingress.kubernetes.io/ssl-redirect" = "true"
       #"cert-manager.io/cluster-issuer" = "letsencrypt-prod"
     }
   }
  spec {
     rule {
        host = "prometheus.basils.live"
       http {
         path {
           backend {
             service {
                 name = "prometheus-kube-prometheus-prometheus"
              port {
                 number = 9090
             } 

             } 

           }
         }
       }
     }

     #tls {
     #  hosts = ["grafana.basils.live"]
      # secret_name = "ssl"
     #}
 }
 }





