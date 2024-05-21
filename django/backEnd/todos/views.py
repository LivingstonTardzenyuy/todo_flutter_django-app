from django.shortcuts import render
from .models import Todo
from .serializers import TodoSerializer
from rest_framework import generics
from rest_framework.response import Response

# Create your views here.
class ListTodo(generics.ListCreateAPIView):
    queryset = Todo.objects.all()
    serializer_class = TodoSerializer

    def list(self, request):
        qq = self.get_queryset()
        serializer = TodoSerializer(qq, many=True)
        return Response(serializer.data)
    
class DetailTodo(generics.RetrieveUpdateDestroyAPIView):
    queryset = Todo.objects.all()
    serializer_class = TodoSerializer