from datetime import datetime

from django.core.files.storage import FileSystemStorage
from django.http import *
from django.shortcuts import *
from flask import session

from .models import *
# Create your views here.

def logins(request):
    return render(request,"login.html")


def launchinghome(request):
    return render(request,"temp/home.html")

def admin_add_deliveryboy(request):
    return  render(request,"admins/deliveryboy_add.html")

def admin_add_deliveryboy_post(request):
    obj=deliveryBoy()
    name=request.POST["name"]
    email_id=request.POST["email"]
    housename=request.POST["housename"]
    place=request.POST["place"]
    city=request.POST["city"]
    state=request.POST["state"]
    pincode=request.POST["pincode"]
    phone_no= request.POST["phone"]

    obj.name=name
    obj.email_id=email_id
    obj.housename=housename
    obj.place=place
    obj.city=city
    obj.state=state
    obj.pincode=pincode
    obj.phone_no=phone_no

    import random
    pswd= random.randint(1000,10000)

    lobj=login()
    lobj.username=email_id
    lobj.password=pswd
    lobj.type="deliveryboy"
    lobj.save()

    obj.LOGIN= lobj
    obj.save()

    return  HttpResponse("<script>alert('Delivery boy addedd Successfully');window.location='/myapp/admin_add_deliveryboy/'</script>")

def admin_edit_deliveryboy_post(request):
    id=request.POST["id"]
    obj=deliveryBoy.objects.get(id=id)
    name=request.POST["name"]
    email_id=request.POST["email"]
    housename=request.POST["housename"]
    place=request.POST["place"]
    city=request.POST["city"]
    state=request.POST["state"]
    pincode=request.POST["pincode"]
    phone_no= request.POST["phone"]

    obj.name=name
    obj.email_id=email_id
    obj.housename=housename
    obj.place=place
    obj.city=city
    obj.state=state
    obj.pincode=pincode
    obj.phone_no=phone_no
    obj.save()

    return  HttpResponse("<script>alert('Delivery boy updated Successfully');window.location='/myapp/admin_deliveryboy_view/'</script>")


def deliveryboy_view(request):
    objs= deliveryBoy.objects.all()
    return render(request,"admins/deliveryboy_view.html",{'data':objs})

def search_deliveryboy_view(request):
    name=request.POST["search"]
    objs = deliveryBoy.objects.filter(name__contains=name)
    return render(request, "admins/deliveryboy_view.html", {'data': objs})


def admin_deliveryboy_delete(request,id):
    objs= deliveryBoy.objects.get(id=id)
    objs.delete()
    return HttpResponse("<script>alert('Delivery boy deleted Successfully');window.location='/myapp/admin_deliveryboy_view/'</script>")

def admin_deliveryboy_edit(request,id):
    objs= deliveryBoy.objects.get(id=id)

    return render(request,"admins/deliveryboy_edit.html",{'data':objs})


def admin_addmeat(request):
    return render(request,"admins/meat_add.html")
def admin_addmeat_post(request):
    photo = request.FILES['file']
    meats = request.POST["name"]
    meattype = request.POST["meattype"]
    price = request.POST["price"]
    from datetime import  datetime
    filename= datetime.now().strftime("%Y%m%d%H%M%S")
    fs = FileSystemStorage()
    s = filename + ".jpg"
    fs.save(s, photo)
    obj = meat()
    obj.meat_name = meats
    obj.type = meattype
    obj.price_kg = price
    obj.image = fs.url(s)
    obj.save()
    return HttpResponse("<script>alert('Meat added Successfully');window.location='/myapp/admin_addmeat/'</script>")

def admin_viewmeat(request):
    obj=meat.objects.all().order_by('-id')
    return render(request, "admins/meat_view.html",{'c':obj})

def search_admin_viewmeat(request):
    mname=request.POST["search"]
    obj = meat.objects.filter(meat_name__contains=mname)
    return render(request, "admins/meat_view.html", {'c': obj})


def edit_meat_admin(request,id):
    res=meat.objects.get(pk=id)
    return render(request,"admins/meat_edit.html",{'data':res})

def edit_meat_admin_post(request):
    mid=request.POST["mid"]
    meatname=request.POST["name"]
    type=request.POST["meattype"]
    price=request.POST["price"]
    if 'file' in request.FILES:
        image = request.FILES["file"]
        if image.filename!="":
            from datetime import datetime
            filename = datetime.now().strftime("%Y%m%d%H%M%S")
            fs = FileSystemStorage()
            s = filename + ".jpg"
            fs.save(s, image)
            res=meat.objects.filter(id=mid).update(meat_name=meatname,type=type,price_kg=price,image=fs.url(s))
        else:
            res = meat.objects.filter(id=mid).update(meat_name=meatname, type=type, price_kg=price)
    else:
        res = meat.objects.filter(id=mid).update(meat_name=meatname, type=type, price_kg=price)
    return HttpResponse("<script>alert('Meat Update Successfully');window.location='/myapp/admin_viewmeat/'</script>")





def adminmeatdelete(request,id):
    ms=meat.objects.get(id=id)
    ms.delete()
    return HttpResponse("<script>alert('Meat deleted Successfully');window.location='/myapp/admin_viewmeat/'</script>")


def admin_addmeatstock(request):
    m=meat.objects.all()
    return render(request, "admins/meat_stockadd.html",{'m':m})

def admin_addmeatstock_post(request):
    from datetime import  datetime
    meat= request.POST["meat"]
    stocks= request.POST["stock"]
    m=stock()
    m.MEAT_id=meat
    m.quantity=stocks
    m.curstock=stocks
    m.date=datetime.now()
    m.save()

    return HttpResponse("<script>alert('Stock added Successfully');window.location='/myapp/admin_addmeatstock/'</script>")


def admin_viewmeatstock(request):
    mst= stock.objects.all().order_by('-id')
    return  render(request,"admins/meat_viewstock.html",{'mst':mst})


def search_admin_viewmeatstock(request):
    from_date=request.POST["search"]
    to_date=request.POST["search1"]
    mst = stock.objects.filter(date__range=[from_date,to_date])
    return render(request, "admins/meat_viewstock.html", {'mst': mst})



def admin_viewusers(request):
    usr= user.objects.all().order_by('-id')
    return render(request,"admins/user_view.html",{'c':usr})

def search_admin_viewusers(request):
    name=request.POST["search"]
    usr = user.objects.filter(name__contains=name)
    return render(request, "admins/user_view.html", {'c': usr})




def admin_viewfeedback(request):
    f= payment.objects.exclude(feedback="pending").order_by("-id")
    return render(request,"admins/user_viewfeedback.html",{'c':f})


def search_admin_viewfeedback(request):
    from_date=request.POST["search"]
    to_date=request.POST["search1"]
    f = payment.objects.exclude(feedback="pending").filter(date__range=[from_date,to_date])
    return render(request, "admins/user_viewfeedback.html", {'c': f})



def admin_vieworders(request):
    d=deliveryBoy.objects.all()
    f= order_main.objects.all().order_by('-id')
    return render(request,"admins/user_vieworders.html",{'c':f,'d':d})

def search_admin_vieworders(request):
    from_date=request.POST["search"]
    to_date=request.POST["search1"]
    d = deliveryBoy.objects.all()
    f = order_main.objects.filter(date__range=[from_date,to_date])
    return render(request, "admins/user_vieworders.html", {'c': f, 'd': d})



def adminviewmoreorder(request,id):
    res=order_sub.objects.filter(order_id=id)
    return render(request,"admins/admin_viewordermore.html",{"data":res})



# def searchorder(request):
#     d = deliveryBoy.objects.all()
#     f = payment.objects.filter(ORDER.ordered_date)
#     from_date=request.POST['search']
#     to_date=request.POST['search1']
#     if from_date:
#         carForm = payment.objects.filter(ordered_date=from_date)
#     if to_date:
#         carForm = payment.objects.filter(ordered_date=to_date)
#     return render(request,"deliveryboy/user_vieworders.html")


def adminassignoder(request):
    id=request.POST["id"]
    print(id)
    d=request.POST["del"]
    from datetime import  datetime
    deliverystatuso=deliverystatus()
    deliverystatuso.ORDER_id=id
    deliverystatuso.DELIVERY_id=d
    deliverystatuso.status="pending"
    deliverystatuso.date=datetime.now()
    deliverystatuso.save()
    print(id)
    oobj=order_main.objects.get(id=id)
    oobj.status='Assigned'
    oobj.save()

    return HttpResponse("<script>alert('OrderAllocatedSuccessfully');window.location='/myapp/admin_vieworders/'</script>")


def admin_viewassignedorders(request):
    deliverystatusobj=deliverystatus.objects.all().order_by('-id')
    return  render(request,"admins/user_allocation.html",{'c':deliverystatusobj})


def search_admin_viewassignedorders(request):
    from_date=request.POST["search"]
    to_date=request.POST["search1"]
    deliverystatusobj = deliverystatus.objects.filter(ORDER__date__range=[from_date,to_date])
    return render(request, "admins/user_allocation.html", {'c': deliverystatusobj})

def assigned_viewmore(request,id):
    res=order_sub.objects.filter(order=id)
    return render(request,"admins/assigned_viewordermore.html",{"data":res})






#########################

def edit_user_profile(request):
    res=user.objects.get(LOGIN=request.session["lid"])
    print(res)
    return render(request,"user/edit_my_profile.html",{"data":res})

def edit_user_profile_post(request):
    name=request.POST["name"]
    gender=request.POST["radio"]
    email=request.POST["email"]
    phone=request.POST["phone"]
    hname=request.POST["housename"]
    place=request.POST["place"]
    city=request.POST["city"]
    pin=request.POST["pincode"]
    if 'file' in request.FILES:
        img = request.FILES["photo"]
        if img.filename!="":
            from datetime import datetime
            filename = datetime.now().strftime("%Y%m%d%H%M%S")
            fs = FileSystemStorage()
            s = filename + ".jpg"
            fs.save(s, img)
            res=user.objects.filter(LOGIN=request.session["lid"]).update(name=name,gender=gender,email=email,phoneno=phone,house_name=hname,place=place,city=city,pin_code=pin,image=fs.url(s),LOGIN=request.session["lid"])
        else:
            res=user.objects.filter(LOGIN=request.session["lid"]).update(name=name,gender=gender,email=email,phoneno=phone,house_name=hname,place=place,city=city,pin_code=pin,LOGIN=request.session["lid"])
    else:
        res = user.objects.filter(LOGIN=request.session["lid"]).update(name=name, gender=gender, email=email, phoneno=phone, house_name=hname, place=place,city=city, pin_code=pin,LOGIN=request.session["lid"])
    return HttpResponse("<script>alert('Update Successfully');window.location='/myapp/edit_profile_user/'</script>")







def usersignup(request):
    return render(request,"usersignup.html")

def usersignuppost(request):
    name =request.POST["name"]
    gender = request.POST["gender"]
    house_name =request.POST["house_name"]
    place = request.POST["place"]
    city = request.POST["city"]
    pin_code = request.POST["pin_code"]
    email = request.POST["email"]
    phone_no = request.POST["phone_no"]
    password = request.POST["password"]

    photo=request.FILES["file"]
    from datetime import datetime
    filename = datetime.now().strftime("%Y%m%d%H%M%S")
    fs = FileSystemStorage()
    s = filename + ".jpg"
    fs.save(s, photo)
    u=user()
    u.name=name
    u.phoneno=phone_no
    u.gender=gender
    u.house_name=house_name
    u.place=place
    u.city=city
    u.pin_code=pin_code
    u.email=email
    u.image=fs.url(s)
    l=login()
    l.username=email
    l.password=password
    l.type="user"
    l.save()
    u.LOGIN=l
    u.save()
    return HttpResponse("<script>alert('Account created successfully');window.location='/myapp/login/'</script>")

def adminhome(request):
    return render(request,"admins/home.html")





def logins(request):
    return render(request,"loginnew.html")


def loginpost(request):
    username=request.POST["username"]
    password=request.POST["password"]
    loginobj=login.objects.filter(username=username,password=password)
    if loginobj.exists():
        l=loginobj[0]
        request.session["lid"]=l.id
        if l.type=="admin":
            return  render(request,"admins/home.html")
        elif l.type=="deliveryboy":
            return redirect('/myapp/delhome/')

        elif l.type=="user":
             res= user.objects.filter(LOGIN_id=request.session["lid"])
             if res.exists():
                r=res[0]
                request.session["uid"]=r.id
                request.session["mail"]=r.email
                print(request.session["uid"])
                return redirect('/myapp/userhome/')
             else:
                 return HttpResponse(
                     "<script>alert('Invalid');window.location='/myapp/login/'</script>")

        else:
            return HttpResponse("<script>alert('Invalid username or password');window.location='/myapp/login/'</script>")
    else:
        return HttpResponse("<script>alert('Invalid username or password');window.location='/myapp/login/'</script>")


###############deliveryboy

def delhome(request):
    d=deliveryBoy.objects.get(LOGIN_id=request.session["lid"])
    return render(request, "deliveryboy/home.html",{'u':d})


def delivery_assignedorders(request):
    d=deliverystatus.objects.filter(DELIVERY__LOGIN_id=request.session["lid"]).order_by('-id')
    return render(request,"deliveryboy/user_vieworders.html",{'d':d})

def search_delivery_assignedorders(request):
    fromdate=request.POST["search"]
    todate=request.POST["search1"]
    d = deliverystatus.objects.filter(DELIVERY__LOGIN_id=request.session["lid"],ORDER__date__range=[fromdate,todate])
    return render(request, "deliveryboy/user_vieworders.html", {'d': d})



def delivery_viewmoreassignorder(request,id):
    # order_main.objects.filter()
    res=order_sub.objects.filter(order_id=id)
    return render(request,"deliveryboy/deliveryboy_viewordermore.html",{"data":res})




def deliverystatusupdate(request,id):

    ob=deliverystatus.objects.get(id=id)
    ob.status="Delivered"
    ob.save()
    sb=ob.ORDER
    sb.status="Delivered"
    sb.save()


    obm= payment.objects.get(ORDER=sb)
    obm.status='Delivered'
    obm.save()



    return HttpResponse(
        "<script>alert('Updated successfully');window.location='/myapp/delivery_assignedorders/'</script>")




# def adminmeatupdate(request,id):
#
#     ob=deliverystatus.objects.get(id=id)
#     ob.status="Delivered"
#     ob.save()
#     sb=ob.ORDER
#     sb.status="Delivered"
#     sb.save()
#
#
#     obm= payment.objects.get(ORDER=sb)
#     obm.status='Delivered'
#     obm.save()
#
#
#
#     return HttpResponse(
#         "<script>alert('Updated successfully');window.location='/myapp/delivery_assignedorders/'</script>")
#


#######################user


def userviewmeats(request):
    from datetime import  datetime
    allmeats= stock.objects.filter(date=datetime.now()).order_by('-id')
    return render(request,"user/meat_view.html",{'m':allmeats})


def search_userviewmeats(request):
    name=request.POST["search"]
    allmeats= stock.objects.filter(date=datetime.now(),MEAT__meat_name__contains=name)
    return render(request,"user/meat_view.html",{'m':allmeats})


def userviewmeatspost(request):
    d=request.POST["date"]
    allmeats= stock.objects.filter(date=d)
    return render(request,"user/booking.html",{'m':allmeats})

def useraddtocart(request,id):
    request.session["stockid"]=id
    from datetime import  datetime
    st=stock.objects.get(id=id)
    return render(request,"user/booking.html",{'i':st })

def userbooking(request):
    from datetime import  datetime
    orderobj=order()
    orderobj.USER=  user.objects.get(LOGIN_id=request.session["lid"])
    orderobj.quantity=request.POST["qty"]
    orderobj.STOCK_id=request.session["stockid"]
    orderobj.ordered_date=datetime.now()
    orderobj.save()
    request.session["oid"]=orderobj.id
    stockobj=stock.objects.get(id=request.session["stockid"])
    stockobj.curstock=stockobj.curstock-int(request.POST["qty"])
    stockobj.save()
    amt= stock.objects.get(id=request.session["stockid"]).MEAT.price_kg
    f=float(request.POST["qty"]) * float(amt+"")
    request.session["amnt"]=f
    return render(request,"user/payment2.html",{'order': orderobj,'f':f})


# def userbooking_repaet(request):
#     orderobj=order.objects.get(id=request.session["oid"])
#     f=request.session["amnt"]
#     return render(request,"user/payment2.html",{'order': orderobj,'f':f})

def userpayment(request):
    reciept=request.FILES["file"]
    amount=request.POST["textfield"]
    from datetime import datetime
    filename=datetime.now().strftime("%Y%m%d-%H%M%S")
    fs=FileSystemStorage()
    s=filename+".jpg"
    fs.save(s,reciept)
    obj=payment()
    obj.date=datetime.now()
    obj.status="paid"
    # amnt = request.session["amnt"]
    obj.amount =amount
    obj.reciept=fs.url(s)
    obj.ORDER_id=request.session['omid']
    obj.save()

    return HttpResponse("<script>alert('Payment done successfully');window.location='/myapp/userviewmeats/'</script>")




# def userpayment(request):
#     account=request.POST["account"]
#     cvv=request.POST["cvv"]
#     amnt=request.session["amnt"]
#
#     print(amnt)
#
#     ba= bank.objects.filter(accountnumber=account,cvv=cvv)
#     if ba.exists():
#         s=ba[0]
#         if s.amount < amnt:
#             return HttpResponse(
#                 "<script>alert('Insufficient amount');window.location='/myapp/userbooking_repaet/'</script>")
#         else:
#             paymentobj=payment()
#             paymentobj.ORDER_id=request.session["oid"]
#             paymentobj.status="PAID"
#             from datetime import  datetime
#             paymentobj.date=datetime.now()
#             paymentobj.amount=amnt
#             paymentobj.save()
#             return HttpResponse(
#                 "<script>alert('Payment done successfully');window.location='/myapp/userviewmeats/'</script>")
#
#
#
#     else:
#         return HttpResponse("<script>alert('Invalid bank details');window.location='/myapp/userbooking_repaet/'</script>")
#


def userhome(request):
    u= user.objects.get(LOGIN_id=request.session["lid"])
    return render(request,"user/home.html",{'u':u})


def uservieworders(request):
    orderview=payment.objects.filter(ORDER__user_id=request.session["uid"]).order_by('-id')
    print(orderview)
    # paymentobj=payment.objects.filter(ORDER__USER__LOGIN_id=request.session["lid"])
    # paymentobj=order_main.objects.filter(user__LOGIN_id=request.session["lid"])
    return render(request,"user/user_vieworders.html",{ 'c': orderview })

def search_uservieworders(request):
    from_date=request.POST["search"]
    to_date=request.POST["search1"]
    orderview = payment.objects.filter(ORDER__user_id=request.session["uid"],date__range=[from_date,to_date])
    print(orderview)
    return render(request, "user/user_vieworders.html", {'c': orderview})





# def search_uservieworders(request):
#     search=request.POST["search"]
#     paymentobj = payment.objects.filter(ORDER__USER__LOGIN_id=request.session["lid"],ORDER__STOCK__MEAT__meat_name__contains=search)
#     return render(request,"user/user_vieworders.html",{ 'c': paymentobj })

def userfeedback(request,id):
    return render(request,"user/feebback.html",{"oid":id})

#
# def usersentfeedback(request):
#     id=request.POST["id"]
#     f=request.POST["feedback"]
#     obj=feedback()
#     obj.feedback=f
#     obj.date=datetime.now()
#     obj.ORDER_id=id
#     obj.save()
#     return HttpResponse(
#             "<script>alert('Feedback added Successfully');window.location='/myapp/uservieworders/'</script>")




def usersentfeedback(request):
    id=request.POST["id"]
    f=request.POST["feedback"]
    paymentobj= payment.objects.get(id=id)
    paymentobj.feedback=f
    paymentobj.save()
    return HttpResponse(
        "<script>alert('Feedback added Successfully');window.location='/myapp/uservieworders/'</script>")

def addcart(request,id,curstock):
    res=meat.objects.get(id=id)
    return render(request,"user/cartadd.html",{'mid':res,'curstock':curstock})

def addcartpost(request):
    meatid = request.POST['mid']
    userid = user.objects.get(LOGIN_id=request.session["lid"])
    quantity = request.POST['qnty']
    addcart=cart()
    addcart.qty=quantity
    addcart.meatid_id=meatid
    addcart.userid=userid
    addcart.save()
    return HttpResponse("<script>alert('cart add successfully');window.location='/myapp/userhome/'</script>")


def viewcartmeats(request):
    res=cart.objects.filter(userid=request.session["uid"])
    tot=0
    mm=[]
    for i in res:
        pp=meat.objects.get(id=i.meatid_id)
        m= float(i.qty)*float(pp.price_kg)
        tot+=m
        mm.append({'mid':pp.id,"mname":pp.meat_name,"qty":i.qty,"price_kg":pp.price_kg,"tot":m,"cid":i.id})
    import smtplib
    print("start")
    # Get email ID and password from user
    email = "janananshad@outlook.com"
    password = "Anshad123#"

    # Set SMTP host and port
    # if "gmail" in email:
    #     host = "smtp.gmail.com"
    #     port = 587
    # elif "outlook" in email:
    host = "smtp-mail.outlook.com"
    port = 587
    # Create SMTPLib object and contact server
    server = smtplib.SMTP(host, port)
    check = server.ehlo()
    if check[0] == 250:
        print("Successfully contacted mail server")
    else:
        print("Unable to contact server")
        exit(0)

    # Start TLS encryption (only to be done if conencting to port 587 i.e. TLS)
    server.starttls()

    # Logging into the server
    try:
        server.login(email, password)
        print("Login successful")
    except smtplib.SMTPAuthenticationError as ex:

        print("Exception:", ex)
        exit(0)

        # Get email details from user
    sender_mail = email
    receiver_email = request.session["mail"]
    subject = "Order Placed"
    content =  "Order Placed"

    # Create email body by merging emails object and content
    body = "Subject: " + subject + '\n' + content
    try:
        # Send the mail
        output = server.sendmail(sender_mail, receiver_email, body)
        if not len(output):
            print("Send mail successfully")
        else:
            print("Unable to send mail, please try again")

    except:
        print("errrorrrr")
    return render(request,"user/user_viewcart.html",{'data':mm,'tot':tot} )


def search_viewcartmeats(request):
    name=request.POST["search"]
    res = cart.objects.filter(userid=request.session["uid"],meatid__meat_name__contains=name)
    tot = 0
    mm = []
    for i in res:
        pp = meat.objects.get(id=i.meatid_id)
        m = float(i.qty) * float(pp.price_kg)
        tot += m
        mm.append({"mname": pp.meat_name, "qty": i.qty, "price_kg": pp.price_kg, "tot": m, "cid": i.id})
    print(tot)
    return render(request, "user/user_viewcart.html", {'data': mm, 'tot': tot})





def placeorder(request):
    from datetime import datetime
    date=datetime.now()
    cob=cart.objects.filter(userid=request.session["uid"])
    om=order_main()
    om.status='pending'
    om.amount='0'
    om.date=date
    om.user_id=request.session['uid']
    om.save()
    tot=0
    for i in cob:
        osj=order_sub()
        osj.order=om
        osj.qty=i.qty
        osj.meat=i.meatid
        osj.save()
        pp = meat.objects.get(id=i.meatid_id)
        m = float(i.qty) * float(pp.price_kg)
        tot+=m
        request.session['tot']=tot
        cmm=cart.objects.get(id=i.id)
        cmm.delete()
    omm=order_main.objects.get(id=om.id)
    omm.amount=tot
    omm.save()
    request.session['omid']=omm.id
    return redirect("/myapp/cartpayment")



def cartpayment(request):
    amount=request.session['tot']
    return render(request,"user/payment3.html",{'f':amount})