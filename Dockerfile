FROM python:latest

RUN pip install Flask
RUN pip install Flask-API
RUN pip install sqlalchemy
RUN pip install Flask-SQLAlchemy
RUN pip install selenium
RUN pip install behave
RUN pip install requests
RUN pip install pyhamcrest

# COPY lbg.py .
COPY . .
# COPY models.py .
EXPOSE 8081

ENTRYPOINT ["python", "lbg.py"]