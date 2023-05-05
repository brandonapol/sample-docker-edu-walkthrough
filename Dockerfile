from python

COPY app.py app.py
COPY requirements.txt requirements.txt
COPY boot.sh boot.sh

RUN python3 -m venv venv 
RUN venv/bin/pip install -r requirements.txt 

RUN chmod +x boot.sh

EXPOSE 5000

RUN ./boot.sh

CMD [ "venv/bin/gunicorn", "--bind", "0.0.0.0:5000", "app:app" ]


