# README

# techspace-web
Home of techspace

To contribute check out the [Contributor's Guide][COGG]. 

[COGG]: /contribution-guide.md

This README would normally document whatever steps are necessary to get the
application up and running.

Running techspace-web on your system:

1. Make sure you have Python 3 and pip setup on your computer. 
   https://www.makeuseof.com/tag/install-pip-for-python/
2. Make sure you have virtual environment installed.
   To check run command ```$ pip freeze```
   To install virtual environment``` $ pip install virtualenv ```
   
3. Clone the repository.
4. Create and activate virtual environment for the project
   ```
   $ python3 -m venv .
   $ source bin/activate
   ```
5. Install requirements
   ```$ pip3 install -r requirements.txt```
   
6. cd into project ```cd techspace-web``` and run:

   ```
   $ python manage.py runserver
   ```
7. Make migrations to the database using the following commands:
   ```
   $ python manage.py makemigratons
   $ python manage.py migrate
   ```

8. Now open localhost:8000 in browser and the application must be running.


