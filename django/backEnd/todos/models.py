from django.db import models

# Create your models here.
class Todo(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField()
    
    def __str__(self):
        return self.title
    

class Note(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField()
    added_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateField(auto_now=True)
    
    def __str__(self):
        return self.title