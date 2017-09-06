from django.shortcuts import render,HttpResponse
from .models import Contact,Club

# Create your views here.

def index(request):
	clubs = Club.objects.all()

	return render(request, 'home/index.html', {clubs:'clubs'})


def contactSubmit(request):
	if request.method == 'POST':
		name = request.POST['name']
		email = request.POST['email']
		content = request.POST['content']

		Contact.objects.create(
			name = name,
			email = email,
			content = content
			)
	return HttpResponse('')

