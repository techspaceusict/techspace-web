from django.shortcuts import render,HttpResponse
from .models import Contact,Club, Association

# Create your views here.

def index(request):
	#clubs
	club_objects = Club.objects.all()
	app_urls = ['codeschool:index','cogitans:index','droidclub:index','ecell:index','electrotech:index','oslc:index','renderedusict:index','turingai:index']
	clubs = zip(club_objects,app_urls)
	#associations
	assocs = Association.objects.all()

	return render(request, 'home/index.html', {'clubs':clubs, 'assocs':assocs})


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



