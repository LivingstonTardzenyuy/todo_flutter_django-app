from django.urls import path, include
from .views import ListTodo, DetailTodo
from rest_framework.routers import DefaultRouter
from .views import ListNotes

router = DefaultRouter()
router.register(r'notes', ListNotes, basename='notes')

urlpatterns = [
    path('', ListTodo.as_view(), name='todo'),
    path('<int:pk>/', DetailTodo.as_view(), name='detail'),
    path('', include(router.urls)),
]