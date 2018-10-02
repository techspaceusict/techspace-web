# README

# techspace-web
Home of techspace

To contribute check out the [Contributor's Guide][COGG]. 

[COGG]: /contribution-guide.md
[Report a bug](https://github.com/techspaceusict/techspace-web/blob/master/contribution-guide.md#submitting-a-bug-reportfeature-request)

This README would normally document whatever steps are necessary to get the
application up and running.

Running techspace-web on your system:

1. Make sure you have Python 3 and pip setup on your computer. 
   https://www.makeuseof.com/tag/install-pip-for-python/
2. Make sure you have virtual environment installed.
   To check run command ```$ pip freeze```
   To install virtual environment``` $ pip install virtualenv ```
   
3. Clone the repository.
4. cd into project ```cd techspace-web```
5. Create and activate virtual environment for the project
   ```
   $ python3 -m virtualenv env
   $ source env/bin/activate
   ```
6. Install requirements
   ```$ pip3 install -r requirements.txt```
   
7. Now run the server:
   ```
   $ python manage.py runserver
   ```
  
8. Make migrations to the database using the following commands:
   ```
   $ python manage.py makemigrations
   $ python manage.py migrate
   ```

9. Now open localhost:8000 in browser and the application must be running.

10. Every time to run the project first activate virtual environment and then run the server
    ```
    $ source env/bin/activate
    $ python manage.py runserver
    ```
    
    
    
# cloudinary configuration

1. Install Cloudinary's module using pip
```  pip install cloudinary ```

2. Add "cloudinary" to the list of INSTALLED_APPS in settings.py.

3. Include Cloudinary's Python classes in settings.py
``` 
   import cloudinary
   import cloudinary.uploader
   import cloudinary.api 
   ```
 4. Initalize Cloudinary tags in your Django templates 
 ``` {% load cloudinary %} ```
 
 5. Create account and setup api in cloudinary at https://cloudinary.com/
 
 6. Configure cloudinary api in settings.py
 ```
   cloudinary.config( 
      cloud_name = "cloud_name",
      api_key = "api_key",
      api_secret = "api_secret",
      secure = "True",
   )
 ```
 Cheers !!!! you are ready to go .
 For more details read https://cloudinary.com/documentation/django_integration#django_getting_started_guide
 


