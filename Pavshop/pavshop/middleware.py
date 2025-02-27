from django.utils.deprecation import MiddlewareMixin
from product.models import BlockedIps

class GetUserIpMiddleware(MiddlewareMixin):
    
    def process_request(self, request):
        ip = request.META.get('REMOTE_ADDR')

        if request.user.is_authenticated:
            if not request.user.ips:
                request.user.ips = []
                if ip not in request.user.ips:
                    request.user.ips.append(ip)
                    request.user.save()


class BlockUserIpAddress(MiddlewareMixin):

    def process_request(self, request):
        ip = request.META.get('REMOTE_ADDR')

        x = BlockedIps.objects.filter(ip_address = ip)
        if x:
            raise PermissionError








# settingsde MIDDLEWARE'de GetUserIpMiddleware elave edilir. elave edilmedikde eks halda islemir
# 'pavshop.middleware.GetUserIpMiddleware'
# 'pavshop.middleware.BlockUserIpAddress'