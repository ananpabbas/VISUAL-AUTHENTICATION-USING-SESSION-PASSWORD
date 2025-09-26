from flask import *
from database import *
import random

bank=Blueprint('bank',__name__)


@bank.route('/bankhome')
def bankhome():
	data={}
	data['bankname']=session['bankname']
	return render_template("bankhome.html",data=data)

@bank.route('/bankmanageemployee',methods=['get','post'])
def bankmanageemployee():
	bid=session['bid']
	data={}
	q="select * from employee where bank_id='%s'"%(bid)
	res=select(q)
	data['employee']=res


	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action=None

	if action=="delete":
		q="delete from login where login_id='%s'"%(id)
		delete(q)
		q="delete from employee where login_id='%s'"%(id)
		delete(q)
		return redirect(url_for('bank.bankmanageemployee'))
	if action=="update":
		q="select * from employee where login_id='%s'"%(id)
		res=select(q)
		data['emp']=res
	if 'update' in request.form:
		firstname=request.form['firstname']
		lastname=request.form['lastname']
		housename=request.form['housename']
		place=request.form['place']
		gender=request.form['gender']
		phone=request.form['phone']
		email=request.form['email']
		qualification=request.form['qualification']
		q="update employee set firstname='%s',lastname='%s',housename='%s',place='%s',gender='%s',phone='%s',email='%s',qualification='%s' where login_id='%s'"%(firstname,lastname,housename,place,gender,phone,email,qualification,id)
		update(q)
		return redirect(url_for('bank.bankmanageemployee'))

	if 'add' in request.form:
		firstname=request.form['firstname']
		lastname=request.form['lastname']
		housename=request.form['housename']
		place=request.form['place']
		gender=request.form['gender']
		phone=request.form['phone']
		email=request.form['email']
		qualification=request.form['qualification']
		username=request.form['username']
		password=request.form['password']
		q="SELECT * FROM `login` WHERE `username`='%s'"%(username)
		res=select(q)
		if res:
			flash("Username Already Exist")
			return redirect(url_for('bank.bankmanageemployee'))	
		else:
			q="insert into login values(null,'%s','%s','employee')" %(username,password)
			lid=insert(q)
			q="insert into employee values(null,'%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')"%(lid,bid,firstname,lastname,housename,place,gender,phone,email,qualification)
			insert(q)
			return redirect(url_for('bank.bankmanageemployee'))	

	return render_template("bankmanageemployee.html",data=data)


@bank.route('/bankviewaccountsandcustomers')
def bankviewaccountsandcustomers():
	bid=session['bid']
	data={}
	q="select * from account inner join customer using(customer_id) where bank_id='%s' order by account_id desc"%(bid)
	res=select(q)
	data['accounts']=res
	return render_template("bankviewaccountsandcustomers.html",data=data)


@bank.route('/bankmanageloandetails',methods=['get','post'])
def bankmanageloandetails():
	bid=session['bid']
	data={}
	q="select * from loans where bank_id='%s'"%(bid)
	res=select(q)
	data['loans']=res

	if 'manage' in request.form:
		loanname=request.form['loanname']
		details=request.form['details']
		interestrate=request.form['interestrate']
		maxamount=request.form['maxamount']
		q="insert into loans values(null,'%s','%s','%s','%s','%s')"%(bid,loanname,details,interestrate,maxamount)
		insert(q)
		return redirect(url_for('bank.bankmanageloandetails'))

	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action=None

	if action=="delete":
		q="delete from loans where loan_id='%s'"%(id)
		delete(q)
		return redirect(url_for('bank.bankmanageloandetails'))
	if action=="update":
		q="select * from loans where loan_id='%s'"%(id)
		res=select(q)
		data['loan']=res
	if 'update' in request.form:
		loanname=request.form['loanname']
		details=request.form['details']
		interestrate=request.form['interestrate']
		maxamount=request.form['maxamount']
		q="update loans set loan_name='%s',details='%s',interest_rate='%s',max_amount='%s' where loan_id='%s'"%(loanname,details,interestrate,maxamount,id)
		update(q)
		return redirect(url_for('bank.bankmanageloandetails'))

	return render_template("bankmanageloandetails.html",data=data)


@bank.route('/bankmanagenotification',methods=['get','post'])
def bankmanagenotification():
	bid=session['bid']
	data={}
	q="select * from notification where bank_id='%s'" %(bid)
	res=select(q)
	data['notification']=res
	if 'manage' in request.form:
		notification=request.form['notification']
		q="insert into notification values(null,'%s','%s',curdate())"%(bid,notification)
		insert(q)
		return redirect(url_for('bank.bankmanagenotification'))
	return render_template("bankmanagenotification.html",data=data)



@bank.route('/bankviewloanrequest')
def bankviewloanrequest():
	bid=session['bid']
	data={}
	q="SELECT * FROM `loanrequest` INNER JOIN `customer` USING(customer_id) INNER JOIN `loans` USING(loan_id) where bank_id='%s'"%(bid)
	res=select(q)
	data['request']=res
	return render_template("bankviewloanrequest.html",data=data)

@bank.route('/bankviewaccounts')
def bankviewaccounts():
	bid=session['bid']
	data={}
	q="SELECT * FROM account INNER JOIN customer USING(customer_id) where bank_id='%s'"%(bid)
	res=select(q)
	data['account']=res
	return render_template("bankviewaccounts.html",data=data)

@bank.route('/bankviewchat',methods=['get','post'])
def bankviewchat():
	data={}
	bid=session['lid']
	data['lid']=bid
	elid=request.args['elid']

	if "submit" in request.form:
		message=request.form['message']
		q="insert into chat values(null,'%s','%s','%s',curdate())"%(bid,elid,message)
		insert(q)
		return redirect(url_for('bank.bankviewchat',elid=elid))
	
	q="select * from chat where (reciver_id='%s' and sender_id='%s') or(reciver_id='%s' and sender_id='%s')"%(elid,bid,bid,elid)
	res=select(q)
	data['chatemp']=res
	return render_template("bankviewchat.html",data=data)


@bank.route('/bank_view_account_request')
def bank_view_account_request():
	bid=session['bid']
	data={}
	q="SELECT * FROM account INNER JOIN customer USING(customer_id) where bank_id='%s'"%(bid)
	res=select(q)
	data['account']=res

	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action=None

	if action=='accept':
		number=random.randint(1000000000,9999999999)
		q="update account set status='Accepted',account_number='%s' where account_id='%s'"%(number,id)
		update(q)
		flash("Accepted")
		return redirect(url_for('bank.bank_view_account_request'))

	if action=='reject':
		q="update account set status='Rejected' where account_id='%s'"%(id)
		update(q)
		flash("Rejected")
		return redirect(url_for('bank.bank_view_account_request'))
	return render_template("bank_view_account_request.html",data=data)