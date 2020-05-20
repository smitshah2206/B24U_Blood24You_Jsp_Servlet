<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="..\CSS\stylecontribute.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style type="text/css">
		.header
{
	width : 100%;
	position: fixed;
	top: 0;
	background-color: whitesmoke;
	box-sizing: border-box;
	height: 15%;
	z-index: 1;
}
.header > img
{
	height: 75px;
}
.header > form
{
	display: inline;
}
.navbtn
{
	padding-top:0px; 
	position: absolute; 
	display: inline;
	left: 90%;
	
}
.navbtn > i 
{
	font-size: 40px;
	margin: 9px;
	margin-left:30px;
	margin-bottom: 24px;
	margin-top: 30px;
	position: absolute;	
	display: block;
}
.navbtn > i:hover
{
	cursor: pointer;
	transition: 0.5s;
	opacity: 1;
}
.nav
{
	position: fixed;
	top: 10%;
	left: 13%;
	background-color: #ed1b24;
    border-color: transparent;
    border: none;
    z-index: 2;
    font-size: 15px;
   	box-sizing: border-box;
	box-shadow: 2px 2px 4px black;
}
.heading
{
	width : 100%;
	position: fixed;
	top: 15%;
	box-sizing: border-box;
	background-color: #ed1b24;
	height: 120px;
	box-shadow: 0 10px 10px grey;
	z-index: 1;	
}
.heading > label
{
	font-size: 25px;
	color: white;
	font-weight: bold;
	top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 300px;
    margin-left: 0px;
    text-align: center;
    position: absolute;
}
.nav ul
{
	display: flex;
	justify-content:flex-end;
	max-width:1200px;
	margin: 0 auto;
	padding:15px 15px;
}
.nav ul li
{
		list-style:none;
		letter-spacing: 1px;
		position:relative;
		padding: 10px 10px;
		margin-right: 2px;
		box-sizing:border-box;
}
.nav ul li:hover
{
	background-color: black;
	color: white;
}
.nav ul li a:hover
{
	color: white;
}
.nav ul li a 
{
	text-decoration:none;
	padding:0 20px;
	color:#95afc0;	
	color: #ecf0f1;
}
.nav ul li ul
{
	position :absolute;
	top:40px;
	left:0;
	padding:0 0px;
	background:#000;
	display:block;
	width:230px;
	opacity:0;
	visibility:hidden;
}
.nav ul li:hover ul
{
	opacity:1;
	visibility:visible;
}
.nav ul li ul li
{
	border:1px solid rgba(255,255,255,.2);
	border-right:none;
	border-left:none;
	margin-right: 0px;
	padding: 10px 0px;
}
.nav ul li ul li:hover
{
	background-color: #c23616;
}
.nav ul li ul li a
{
	color: #dcdde1;
}

.nav ul li ul li a:hover
{
	color: #dcdde1;
}
.active
{
	color: white;
	background-color: black;
}
.sidenav 
{
  height: 50%;
  width: 0;
  position: fixed;
  z-index:2;
  top: 0;
  left: 100%;
  background-color: #111;
  overflow-x: hidden;
  transition: 1.5s;
  padding-top: 60px;
}
.sidenav > a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
  z-index: 3;
}
.sidenav > a:hover {
  color: #f1f1f1;
  cursor: pointer;
}
.sidenav > i 
{
  padding: 8px 8px 8px 10px;
  text-decoration: none;
  font-size: 18px;
  color: #818181;
  display: block;
  transition: 0.3s;
  z-index: 3;
}
.sidenav >.closebtn {
  position: absolute;
  top: 0;
  font-size: 36px;
}
.a
{
	position: absolute;
	left: 50%;
    top: 10px;
    font-size: 30px;
}
.b
{
	position: absolute;
	left: 70%;
	top: 10px;
    font-size: 30px;
}
.btn1
{
	padding-top:10px; 
	margin-bottom:12px;
}
.btn1 >a
{
	position: absolute;
	top: 90%;
	left: 50%;
	transform: translate(-50%,-50%);
}
.btn1 >a> input
{
	display: inline-block;
	width:140px;
	background:#1b00ff;
	text-align:center;
	padding:5px;
	border-radius:25px;
	color:white;
	cursor:pointer;
	border-radius: 25px;
	text-transform:uppercase;
	transition: 0.5s;
}
.btn1 >a>input:hover
{
	background-color: white;
	color: black;
	width:170px;
	transition: 0.5s;
	font-weight: bold;
}
	</style>
</head>
<body>
	
		<div class="header fix">
			<img src="..\Image\logo.png">
				<div class="navbtn">
					<i class="fa fa-bars fa-2x " aria-hidden="true" onclick="openNav()"></i>
				</div>
		</div>
		<div class="nav fix">
				<ul>
			<li><a href="donor_page.jsp" >Donor History</a></li>
			<li><a href="health_report.jsp">Health Report</a></li>
			<li><a href="pending_request_donor.jsp">Pending Request</a></li>
			<li><a href="d_blood_tips.jsp">Blood Tips</a></li>
			<li class="active"><a href="d_contribute.jsp">Contribute</a></li>
			<li><a href="">More &nabla;</a>
					<ul>
						<li><a href="d_about_us.jsp">About Us</a></li>
						<li><a href="d_get_in_touch.jsp">Contact Us</a></li>
					</ul>
			</li>
		</ul>
		</div>
		<div id="mySidenav" class="sidenav">
	  		<a  class="closebtn" onclick="closeNav()">&times;</a>
	  		<a href="update_donor.jsp" class="a"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
	  		<a href="delete_donor.jsp" class="b"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
			<i class="fa fa-id-card-o" aria-hidden="true" style="color:white;">
				&nbsp;${sessionScope.id}
			</i>
			<i class="fa fa-user" aria-hidden="true" style="color:white;">
				&nbsp;${sessionScope.user_full_name}
			</i>
			<i class="fa fa-envelope" aria-hidden="true" style="color:white;">
				&nbsp;${sessionScope.user_email}
			</i>
			<i class="fa fa-phone" aria-hidden="true" style="color:white;">
				&nbsp;${sessionScope.user_number}
			</i>
			<i class="fa fa-calendar" aria-hidden="true" style="color:white;">
				&nbsp;${sessionScope.date_of_birth}
			</i>
			<i class="fa fa-venus-mars" aria-hidden="true" style="color:white;">
				&nbsp;${sessionScope.gender}
			</i>
			<i class="fa fa-tint" aria-hidden="true" style="color:white;">
				&nbsp;${sessionScope.blood_group}
			</i>
			<i class="fa fa-location-arrow" aria-hidden="true" style="color:white;">
				&nbsp;${sessionScope.city}
			</i>
			<div class="btn btn1" >
				<a href="signout_donor.jsp"><input type="button" name="Signout" value="Sign Out"></a>
			</div>
		</div>
		<div class="heading fix">	
			<label>Contribute</label>	
		</div>
		<div class="sharecircle" onclick="share()">
			<i class="fa fa-share-alt" aria-hidden="true"></i>
		</div>
		<div class="sharecircle facebook" id="f">
			<i class="fa fa-facebook" aria-hidden="true"></i>
		</div>
		<div class="sharecircle instagram" id="i">
			<i class="fa fa-instagram" aria-hidden="true"></i>
		</div>
		<div class="sharecircle youtube" id="y">
			<i class="fa fa-youtube-play" aria-hidden="true"></i>
		</div>
		<div class="sharecircle gmail" id="g">
			<i class="fa fa-envelope" aria-hidden="true"></i>
		</div>
		<div class="center">
			<hr>		
			<label>OR</label>
		</div>
		<div class="image">
			<h3>We are also accept BHIM UPI Payment</h3>
			<div class="qr">
				<img src="..\Image\qr.jpg">				
			</div>
			<div class="apps">
				<img src="..\Image\apps.png">
			</div>
		</div>
		<div class="card">
			<form action="/B24U/DonorContribute" method="post" id="myform">
				<div class="login">
					<h3>How Much Would you like to Donate ?</h3>
					<div class="circle circle1">
						<i onclick="f1()">$100</i>
					</div>		
					<div class="circle circle2">
						<i onclick="f2()">$500</i>
					</div>
					<div class="circle circle3">
						<i onclick="f3()">$1000</i>
					</div>
					<div class="circle circle4">
						<i onclick="f4()">$2000</i>
					</div>
					<div class="circle circle5">
						<i onclick="f5()">$5000</i>
					</div>
					<h4>OR</h4>
					<input type="number" name="amount1" id="ir" placeholder="Enter Amount" onkeyup="l()" required autocomplete="off">
				</div>
				<div class="contact">
					<h3>Receipt Details</h3>
					<table>
						<tr>
							<td>
								<label>Full Name:-</label>
								<input type="text" name="name" id="fname" required pattern="[A-z ]+$" title="Use only character & whitespace" autocomplete="off">
							</td>
							<td rowspan="2">
								<label>Address(Optional):-</label>
								<textarea name="address" placeholder="---Type---"></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<label>Email Id:-</label>
								<input type="email" name="email" required pattern="[A-Za-z0-9._%+-]+@[A-z0-9.-]+\.[a-z]{2,}$" title="Email id is not Valid" autocomplete="off">
							</td>
						</tr>
						<tr>
							<td>
								<label>Mobile Number:-</label>
								<input type="text" name="contactnumber" required pattern="^[1-9]{1}[0-9]{9}$" title="Number is not valid" autocomplete="off">
							</td>
							<td>
								<label>Pincode(Optional):-</label>
								<input type="text" name="pincode" pattern="^[0-9]{6}$" title="Pincode is not valid" autocomplete="off">
							</td>	
						</tr>
						<tr>
							<td>
								<label>City(Optional):-</label>
								<input type="text" name="city" pattern="[A-z]+$" title="Use only character" autocomplete="off">
							</td>
							<td>
								<label>State(Optional):-</label>
								<input type="text" name="state"pattern="[A-z]+$" title="Use only character" autocomplete="off">
							</td>
						</tr>
						<tr>
							<td colspan="2" style="background-color:#ecf0f1;">
								<label class="amountlabel">Total Amount</label>
								<input type="text" name="amount" class="amount" id="cr" value="0" readonly>
								<span class="btn"><input type="submit" name="submit" value="Process To Pay"></span>
							</td>
						</tr>
					</table>
				</div>
				</form>
			</div>
				<!--Responsive Table-->
			<div class="rcard">
				<form action="/B24U/DonorContribute" method="post" id="myform">
				<div class="login">
					<h3>How Much Would you like to Donate ?</h3>
					<div class="circle circle1">
						<i onclick="f1()">$100</i>
					</div>		
					<div class="circle circle2">
						<i onclick="f2()">$500</i>
					</div>
					<div class="circle circle3">
						<i onclick="f3()">$1000</i>
					</div>
					<div class="circle circle4">
						<i onclick="f4()">$2000</i>
					</div>
					<div class="circle circle5">
						<i onclick="f5()">$5000</i>
					</div>
					<h4>OR</h4>
					<input type="number" name="amount1" id="ir1" placeholder="Enter Amount" onkeyup="l()" required>
				</div>
				<div class="rcontact">
					<h3>Receipt Details</h3>
					<table>
						<tr>
							<td>
								<label>Full Name:-</label>
								<input type="text" name="name"pattern="[A-z ]+$" title="Use only character & whitespace" required>
							</td>
						</tr>
						<tr>
							<td >
								<label>Address(Optional):-</label>
								<textarea name="address" placeholder="---Type---"></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<label>Email Id</label>
								<input type="email" name="email"  required pattern="[A-Za-z0-9._%+-]+@[A-z0-9.-]+\.[a-z]{2,}$" title="Email id is not Valid">
							</td>
						</tr>
						<tr>
							<td>
								<label>Mobile Number</label>
								<input type="text" name="contactnumber" required pattern="^[1-9]{1}[0-9]{9}$" title="Number is not valid" autocomplete="off">
							</td>
						</tr>
						<tr>
							<td>
								<label>Pincode(Optional):-</label>
								<input type="text" name="pincode" pattern="^[0-9]{6}$" title="Pincode is not valid" autocomplete="off">
							</td>	
						</tr>
						<tr>
							<td>
								<label>City(Optional):-</label>
								<input type="text" name="city"pattern="[A-z ]+$" title="Use only character" autocomplete="off">
							</td>
						</tr>
						<tr>
							<td>
								<label>State(Optional):-</label>
								<input type="text" name="state"pattern="[A-z ]+$" title="Use only character" autocomplete="off">
							</td>
						</tr>
						<tr>
							<td  class="lasttd">
								<label class="amountlabel">Total Amount</label>
								<input type="number" name="amount" id="cr1" class="amount" value="0" readonly>
								<span class="btn"><input type="submit" name="submit" value="Process To Pay"></span>
							</td>
						</tr>
					</table>
				</div>
				
			</form>
		</div>
		<%@include file="../footer.jsp"%>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/additional-methods.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
jQuery.validator.addMethod("checkemail", function(value, element) {
  // allow any non-whitespace characters as the host part
  return this.optional( element ) || /^\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$/i.test( value );
}, 'Please enter a valid email address.');






$(document).ready(function () {

    $('#myform').validate({ 
        rules: {
            fname: {
                required: true,
             	lettersonly:true,
               	whitespace:true,
            },
        
        },
        messages:{
        	fname:{
        		required:"firstname is required",
        		lettersonly:"enter letters only",
        	},
        },
    });

});
</script>
s
</body>
<script type="text/javascript">
	function l()
	{
		var x=document.getElementById('ir');
		var y=document.getElementById('ir1');
		document.getElementById('cr').value=x.value;
		document.getElementById('cr1').value=y.value;
	}
	function f1()
	{
		document.getElementById('ir').value=100;
		document.getElementById('cr').value=100;
		document.getElementById('ir1').value=100;
		document.getElementById('cr1').value=100;		
	}
	function f2()
	{
		document.getElementById('ir').value=500;
		document.getElementById('cr').value=500;
		document.getElementById('ir1').value=500;
		document.getElementById('cr1').value=500;
	}
	function f3()
	{
		document.getElementById('ir').value=1000;
		document.getElementById('cr').value=1000;
		document.getElementById('ir1').value=1000;
		document.getElementById('cr1').value=1000;
	}
	function f4()
	{
		document.getElementById('ir').value=2000;
		document.getElementById('cr').value=2000;
		document.getElementById('ir1').value=2000;
		document.getElementById('cr1').value=2000;
	}
	function f5()
	{
		document.getElementById('ir').value=5000;
		document.getElementById('cr').value=5000;
		document.getElementById('ir1').value=5000;
		document.getElementById('cr1').value=5000;
	}
	function share()
	{
		var a =document.getElementById("f");
		var b=document.getElementById("g");
		var c=document.getElementById("i");
		var d=document.getElementById("y");
		if (a.style.display === "none")
		{
			a.style.display="block";
			b.style.display="block";
			c.style.display="block";
			d.style.display="block";
		}
		else
		{
			a.style.display="none";
			b.style.display="none";
			c.style.display="none";
			d.style.display="none";
		}
	}
	function openNav()
	{
  		document.getElementById("mySidenav").style.left = "78%";
  		document.getElementById("mySidenav").style.width = "300px";
	}
	function closeNav()
	{
  		document.getElementById("mySidenav").style.left = "100%";
  		document.getElementById("mySidenav").style.width = "0";	
	}
</script>
</html>