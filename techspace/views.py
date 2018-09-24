from django.shortcuts import render, render_to_response
from django.template import RequestContext


def handler404(request):
    response = render_to_response('global_components/404.html')
    response.status_code = 404
    return response


def handler500(request):
    response = render_to_response('global_components/500.html')
    response.status_code = 500
    return response
    
def about(request):
    return render(request,'base/about.html')

def alumni(request):
	return render(request,'home/alumni.html')