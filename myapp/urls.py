"""Fishmart URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path,include
from Fishmart import settings
from . import views
urlpatterns = [
    path("lhome/",views.launchinghome),
    path("login/",views.logins),
    path("admin_home/",views.adminhome),
    path("admin_add_deliveryboy/",views.admin_add_deliveryboy),
    path("admin_add_deliveryboy_post/",views.admin_add_deliveryboy_post),
    path("admin_edit_deliveryboy_post/",views.admin_edit_deliveryboy_post),
    path("admin_deliveryboy_view/",views.deliveryboy_view),
    path("search_deliveryboy_view/",views.search_deliveryboy_view),


    path("admin_deliveryboy_delete/<str:id>",views.admin_deliveryboy_delete),
    path("admin_deliveryboy_edit/<str:id>",views.admin_deliveryboy_edit),
    path("admin_addmeat/",views.admin_addmeat),
    path("admin_addmeat_post/",views.admin_addmeat_post),
    path("adminmeatdelete/<str:id>",views.adminmeatdelete),
    path("admin_viewmeat/",views.admin_viewmeat),
    path("search_admin_viewmeat/",views.search_admin_viewmeat),
    path("edit_meat_admin/<str:id>",views.edit_meat_admin),
    path("edit_meat_admin_post/",views.edit_meat_admin_post),


    path("admin_addmeatstock/",views.admin_addmeatstock),
    path("admin_addmeatstock_post/",views.admin_addmeatstock_post),
    path("admin_viewmeatstock/",views.admin_viewmeatstock),
    path("search_admin_viewmeatstock/",views.search_admin_viewmeatstock),

    path("admin_viewusers/",views.admin_viewusers),
    path("search_admin_viewusers/",views.search_admin_viewusers),


    path("admin_viewfeedback/",views.admin_viewfeedback),


    path("search_admin_viewfeedback/",views.search_admin_viewfeedback),
    path("admin_vieworders/",views.admin_vieworders),

    path("search_admin_vieworders/",views.search_admin_vieworders),

    path("adminviewmoreorder/<str:id>",views.adminviewmoreorder),

    path("adminassignoder/",views.adminassignoder),
    path("admin_viewassignedorders/",views.admin_viewassignedorders),

    path("search_admin_viewassignedorders/",views.search_admin_viewassignedorders),

    path("assigned_viewmore/<str:id>",views.assigned_viewmore),

    # path("userbooking/",views.userbooking),
    # path("userbooking_repaet/",views.userbooking_repaet),
    path("edit_profile_user/",views.edit_user_profile),
    path("edit_profile_user_post/",views.edit_user_profile_post),
    path("usersignup/",views.usersignup),
    path("usersignuppost/",views.usersignuppost),
    path("userlogin/",views.logins),
    path("userloginpost/",views.loginpost),
    path("userviewmeats/",views.userviewmeats),

    path("search_userviewmeats/",views.search_userviewmeats),

    path("userviewmeatspost/",views.userviewmeatspost),
    path("userhome/",views.userhome),
    path("userpayment/",views.userpayment),
    path("useraddtocart/<str:id>",views.useraddtocart),
    path("uservieworders/",views.uservieworders),
    path("search_uservieworders/",views.search_uservieworders),


    path("usersentfeedback/",views.usersentfeedback),
    path("useraddcart/<str:id>/<str:curstock>",views.addcart),
    path("useraddcartpost",views.addcartpost),

    path("userviewcart/",views.viewcartmeats),
    path("search_viewcartmeats/",views.search_viewcartmeats),

    path("delhome/",views.delhome),
    path("delivery_assignedorders/",views.delivery_assignedorders),
    path("delivery_viewmoreassignorder/<str:id>",views.delivery_viewmoreassignorder),
    path("search_delivery_assignedorders/",views.search_delivery_assignedorders),
    path("deliverystatusupdate/<str:id>",views.deliverystatusupdate),
    path("placeorder/",views.placeorder),
    path("cartpayment/",views.cartpayment),




]
