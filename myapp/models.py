from django.db import models

# Create your models here.
class login(models.Model):
    username = models.CharField(max_length=25)
    password = models.CharField(max_length=20)
    type = models.CharField(max_length=20)

class user(models.Model):
    name= models.CharField(max_length=100)
    gender = models.CharField(max_length=25)
    house_name = models.CharField(max_length=30)
    place = models.CharField(max_length=25)
    city = models.CharField(max_length=25)
    pin_code = models.IntegerField(db_column='pin code')  # Field renamed to remove unsuitable characters.
    email = models.CharField(max_length=25)
    image=models.CharField(max_length=500,default="")
    phoneno = models.CharField(db_column='phone no', max_length=20)  # Field renamed to remove unsuitable characters.
    LOGIN= models.ForeignKey(login,on_delete=models.CASCADE)

class deliveryBoy(models.Model):
    name= models.CharField(max_length=200)
    email_id = models.CharField(max_length=30)
    housename = models.CharField(max_length=50)
    place = models.CharField(max_length=50)
    city = models.CharField(max_length=50)
    state = models.CharField(max_length=50)
    pincode = models.CharField(max_length=50)
    phone_no = models.CharField(max_length=10)
    LOGIN = models.ForeignKey(login, on_delete=models.CASCADE)



class meat(models.Model):
    meat_name = models.CharField(max_length=30)
    type = models.CharField(max_length=20)
    price_kg = models.IntegerField(db_column='price/kg', max_length=50)  # Field renamed to remove unsuitable characters.
    image = models.CharField(max_length=50)


class stock(models.Model):
    MEAT = models.ForeignKey(meat,models.CASCADE)
    quantity = models.IntegerField()
    curstock = models.IntegerField(default=0)
    date = models.DateField()






class bank(models.Model):
    accountnumber=models.CharField(max_length=40)
    cvv=models.CharField(max_length=40)
    amount=models.IntegerField()





class cart(models.Model):
    meatid=models.ForeignKey(meat,on_delete=models.CASCADE)
    userid=models.ForeignKey(user,on_delete=models.CASCADE)
    qty=models.CharField(max_length=50)



class order_main(models.Model):
    user=models.ForeignKey(user,on_delete=models.CASCADE)
    status=models.CharField(max_length=30)
    amount=models.CharField(max_length=50)
    date=models.DateField(max_length=50,default=0)


class order_sub(models.Model):
    meat=models.ForeignKey(meat,on_delete=models.CASCADE)
    order=models.ForeignKey(order_main,on_delete=models.CASCADE)
    qty=models.IntegerField(max_length=50)





class payment(models.Model):
    ORDER= models.ForeignKey(order_main,on_delete=models.CASCADE)
    date = models.DateField()
    amount=models.CharField(max_length=20,default="")
    status = models.CharField(max_length=30)
    reciept=models.CharField(max_length=150)
    feedback=models.CharField(max_length=150,default='pending')


class feedback(models.Model):
    ORDER = models.ForeignKey(order_main,on_delete=models.CASCADE)
    feedback = models.CharField(max_length=30)
    date = models.DateField()




class deliverystatus(models.Model):
    ORDER= models.ForeignKey(order_main,on_delete=models.CASCADE)
    DELIVERY = models.ForeignKey(deliveryBoy,on_delete=models.CASCADE)
    date = models.DateField()
    status = models.CharField(max_length=30)
