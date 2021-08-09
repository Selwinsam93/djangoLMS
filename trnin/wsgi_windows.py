
import os
import sys
import site

# Add the site-packages of the chosen virtualenv to work with
site.addsitedir('C:/Users/Student/AppData/Local/Programs/Python/Python38-32/Lib/site-packages')




# Add the app's directory to the PYTHONPATH
sys.path.append('C:/Users/Student/Desktop/trainocateLMS')
sys.path.append('C:/Users/Student/Desktop/trainocateLMS/trnin')

os.environ['DJANGO_SETTINGS_MODULE'] = 'trnin.settings'
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "trnin.settings")

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()