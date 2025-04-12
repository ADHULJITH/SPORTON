from flask import *
from database import*
import uuid

user=Blueprint('user',__name__)



@user.route("/user_home")
def user_home():
	if not session.get("lid") is None:
		
        
		return render_template("user_home.html")
	

@user.route("/user_view_turf",methods=['get','post'])
def user_view_turf():
	data={}
	q="select * from turfs "
	data['turf']=select(q)



	return render_template("user_view_turf.html",data=data)

@user.route("/user_view_single_turf_image",methods=['get','post'])
def user_view_single_turf_image():
	id=request.args['id']
	data={}
	q="select * from images where turf_id='%s'"%(id)
	data['turf']=select(q)



	return render_template("user_view_single_turf_image.html",data=data)

@user.route("/user_view_slot_turf",methods=['get','post'])
def user_view_slot_turf():
	data={}
	id=request.args['id']
	q="select * from slots inner join turfs using(turf_id) where turf_id='%s'"%(id)
	data['slots']=select(q)

	if 'action' in request.args:
		action=request.args['action']
		sid=request.args['sid']
		date_time=request.args['date_time']
		date_time=request.args['date_time']

	else:
		action=None

	if action=='book':
		qr="select * from bookings where slot_id='%s' and date_time='%s'"%(sid, date_time)
		res=select(qr)
		if res:
			flash("sloted is already booked")
		else:
			return redirect(url_for("user.user_booking",sid=sid,date_time=date_time))
	return render_template("user_view_slot_turf.html",data=data)
@user.route("/user_booking",methods=['get','post'])
def user_booking():
	data={}
	sid=request.args['sid']
	date_time=request.args['date_time']
	amount=request.args['amount']

	return render_template("user_booking.html",data=data,sid=sid,amount=amount,date_time=date_time)
@user.route("/user_indoor",methods=['get','post'])
def user_indoor():
	data={}
	sid=request.args['sid']
	date_time=request.args['date_time']
	amount=request.args['amount']
	if 'book' in request.form:
		t=request.form['tit']
		# qr="select * from bookings where bookings.slot_id='%s' and date_time='%s' and book_type='indoor' and game='%s' and user_id='%s'"%(sid,date_time,t,session['uid'])
		qr="SELECT * FROM bookings INNER JOIN slots ON bookings.slot_id=slots.slot_id INNER JOIN turfs ON turfs.turf_id=slots.turf_id WHERE bookings.slot_id='%s' AND bookings.date_time='%s' AND book_type='indoor' AND game='%s' AND user_id='%s'"%(sid,date_time,t,session['uid'])

		res=select(qr)
		print("==============",res)
		if res:
			flash("slot is already booked")
			return redirect(url_for('user.user_Viewbooking'))
		else:
			ins="insert into bookings values(null,'%s','%s','%s','indoor','pending','%s')"%(session['uid'],sid,date_time,t)
			insert(ins)
			return redirect(url_for('user.user_Viewbooking'))

	return render_template("user_outdoor.html",data=data,sid=sid,amount=amount,date_time=date_time)	
@user.route("/user_outdoor",methods=['get','post'])
def user_outdoor():
	data={}
	sid=request.args['sid']
	date_time=request.args['date_time']
	amount=request.args['amount']
	if 'book' in request.form:
		t=request.form['tit']
		qr="select * from bookings where slot_id='%s' and date_time='%s' and book_type='outdoor' and game='%s' and user_id='%s'"%(sid,date_time,t,session['uid'])
		res=select(qr)
		print("==============",res)
		if res:
			flash("slot is already booked")
			return redirect(url_for('user.user_Viewbooking'))
		else:
			ins="insert into bookings values(null,'%s','%s','%s','outdoor','pending','%s')"%(session['uid'],sid,date_time,t)
			insert(ins)
			return redirect(url_for('user.user_Viewbooking'))
	return render_template('user_outdoor.html',data=data,sid=sid,amount=amount,date_time=date_time)	
@user.route("/user_facilities",methods=['get','post'])
def user_facilities():
	data={}
	id=request.args['id']
	q="select * from facilities where turf_id='%s'"%(id)
	data['fac']=select(q)



	return render_template("user_facilities.html",data=data)


@user.route("/user_Viewbooking",methods=['get','post'])
def user_Viewbooking():
	data={}
	q="SELECT *, `bookings`.`date_time`AS Bdate FROM bookings INNER JOIN `slots` USING(slot_id) INNER JOIN turfs USING(turf_id) where user_id='%s'"%(session['uid'])
	data['book']=select(q)
	

	return render_template("user_Viewbooking.html",data=data)


@user.route("/user_payment",methods=['get','post'])
def user_payment():
	data={}
	print("=======================")
	q="select * from bookings"
	data['book']=select(q)
	bid=request.args['bid']	
	amount=request.args['amount']
	if 'pay' in request.form:
		print("=======================")
		bid=request.args['bid']
		amount=request.args['amount']
		q="insert into payments values (null,'%s','user','online',now(),'%s')"%(bid,amount)
		insert(q)
		q1="update bookings set status='paid' where book_id='%s'" %(bid)
		update(q1)
		flash("SUCCESS...........!")
		return redirect(url_for("user.user_home"))
	return render_template("user_payment.html",data=data,amount=amount)




@user.route("/user_view_turf_image",methods=['get','post'])
def user_view_turf_image():
	data={}
	q="SELECT * FROM `images` INNER JOIN `turfs` USING(turf_id)"
	data['turf']=select(q)
	




	return render_template("user_view_turf_image.html",data=data)



@user.route("/user_shedule_match",methods=['get','post'])
def user_shedule_match():
	data={}
	q="select * from users where login_id='%s'"%(session['uid'])
	res1=select(q)
	data['turf']=res1

	qr="select *,concat(users.first_name,'',users.last_name) as user_name,concat(turfs.owner_first_name,'',turfs.owner_last_name) as owner_name from bookings inner join slots using(slot_id) inner join turfs using(turf_id) inner join matches using(book_id) inner join users on users.user_id=matches.opp_user_id where bookings.user_id='%s' or `matches`.`opp_user_id`='%s'"%(res1[0]['user_id'],res1[0]['user_id'])
	data['view']=select(qr)


	if 'action' in request.args:
		action=request.args['action']
		vid=request.args['stid']
   
	else:
		action=None

	if action == "accept":

		q="update matches set status='accept' where match_id='%s' "%(vid)
		update(q)
		return redirect(url_for("user.user_shedule_match"))
	
	if action == "reject":

		q="update matches set status='reject' where match_id='%s' "%(vid)
		update(q)
		return redirect(url_for("user.user_shedule_match"))



	return render_template("user_shedule_match.html",data=data)







@user.route("/send_feedback", methods=['GET', 'POST'])
def customersend_feedback():
    data = {}
    q = "select * from feedbacks"
    data['view'] = select(q)
    qr = "select * from turfs"
    data['turf'] = select(qr)
    
    if 'submit' in request.form:
        feedback = request.form['feedback']
        title = request.form['title']
        date = request.form['date']
        mat_id = request.form['mat_id']
        q = "insert into feedbacks values(null,'%s','%s', '%s','%s',now())" % (session['uid'],mat_id,title, feedback)
        insert(q)

    return render_template('user_sendfeedback.html', data=data)




@user.route("/user_send_complaints_and_reply",methods=['get','post'])
def user_send_complaints_and_reply():
	if not session.get("lid") is None:
		data={}
		q="SELECT *,CONCAT(first_name,' ',last_name) AS username FROM complaints INNER JOIN users USING(user_id) where user_id='%s'"%(session['uid'])
		data['msgs']=select(q)
		i=1
		s="SELECT * FROM complaints INNER JOIN turfs USING (turf_id) WHERE user_id='%s'"%(session['uid'])
		data['cmp']=select(s)
		w="select * from turfs"
		data['turfs']=select(w)
		for row in data['msgs']:
			if 'submit' in request.form:
				turfs=request.form['turfs']
				complaint=request.form['complaint']
			
				q="insert into complaints values(null,'%s','%s','%s','pending',curdate())"%(session['uid'],turfs,complaint)
				insert(q)
				return redirect(url_for('user.user_send_complaints_and_reply'))
		

		return render_template("user_send_complaints_and_reply.html",data=data)
	else:
		return redirect(url_for("public.login"))

@user.route('/useradvrating',methods=['post','get'])
def useradvrating():
	data={}
	q="select * from turfs"
	data['turf']=select(q)
	if "rate" in request.form:
		ad=request.form['turf']
		r=request.form['rate']
		re=request.form['review']
		e="select * from ratings where turf_id='%s' and user_id='%s'"%(ad,session['uid'])
		res=select(e)
		if res:
			flash("This user already Added...")
		else:
			ins="insert into ratings values(null,'%s','%s','%s','%s',now())"%(session['uid'],ad,r,re)
			insert(ins)
			flash("Added Successfully..")
			return redirect(url_for('user.useradvrating'))
	return render_template("user_rating.html",data=data)








		