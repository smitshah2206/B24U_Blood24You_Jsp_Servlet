<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="..\CSS\styleupdatedonor.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">	
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>
<body>
	
		<div class="header fix">
			<img src="..\Image\logo.png">
			<form>
				<div class="navbtn">
					<i class="fa fa-bars fa-2x " aria-hidden="true" onclick="openNav()"></i>
				</div>
			</form>
		</div>
			<div class="nav fix">
				<ul>
			<li><a href="donor_page.jsp" >Donor History</a></li>
			<li><a href="health_report.jsp">Health Report</a></li>
			<li><a href="pending_request_donor.jsp">Pending Request</a></li>
			<li><a href="d_blood_tips.jsp">Blood Tips</a></li>
			<li><a href="d_contribute.jsp">Contribute</a></li>
			<li class="active"><a href="">More &nabla;</a>
					<ul>
						<li><a href="d_about_us.jsp">About Us</a></li>
						<li><a href="d_get_in_touch.jsp">Contact Us</a></li>
					</ul>
			</li>
		</ul>
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
			<div class="heading fix">	
				<label>Update Details</label>
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
		<div class="outerbox">
			<div class="fixedbox">
				<span class="content">
					<h4>Important Note..!!</h4>
					<p><i class="fa fa-times" aria-hidden="true"></i>Password can not Change.</p>
					<p><i class="fa fa-times" aria-hidden="true"></i>Confirm Password can not Change.</p>
					<p><i class="fa fa-times" aria-hidden="true"></i>City can not Change.</p>
					<p><i class="fa fa-times" aria-hidden="true"></i>State can not Change.</p>
					<p><i class="fa fa-times" aria-hidden="true"></i>Blood group can not Change.</p>
					<p><i class="fa fa-times" aria-hidden="true"></i>Weight can not Change.</p>
				</span>
			</div>
			<div class="scrollbox">
				<div class="registerdonor">
					<form action="/B24U/UpdateDonor" method="POST">
						<div class="login">
							<h3>Login Details</h3>
							<table>
								<tr>
									<td colspan="2">
										<label class="username">User Name:-</label>
										<input type="text" name="user_name" required pattern="^[A-Za-z0-9._%+-@]{5,10}$" title="Enter a username between 5 to 10 letter" value="${sessionScope.user_name}">
									</td>
								</tr>
								<tr>
									<td>
										<label>Full Name:-</label>
										<input type="text" name="user_full_name" required pattern="[A-z ]+$" title="Use only character & whitespace" value="${sessionScope.user_full_name}">
									</td>	
									<td>
										<label>Email Id:-</label>
										<input type="email" name="user_email" required pattern="[A-Za-z0-9._%+-]+@[A-z0-9.-]+\.[a-z]{2,}$" title="Email id is not Valid" value="${sessionScope.user_email}">
									</td>
								</tr>
								<tr>
									<td>
										<label>Password:-</label>
										<input type="password"name="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters" value="${sessionScope.password}" readonly>
									</td>
									<td>
										<label>Confirm Password:-</label>
										<input type="text" name="confirm_password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters" value="${sessionScope.confirm_password}" readonly>
									</td>
								</tr>
							</table>
						</div>
						<div class="contact">
							<h3>Contact Details</h3>
							<table>
								<tr>
									<td>
										<label>Mobile Number:-</label>
										<input type="text" name="user_number" required pattern="^[1-9]{1}[0-9]{9}$" title="Number is not valid" value="${sessionScope.user_number}">
									</td>
									<td rowspan="2">
										<label>Address:-</label>
										<textarea name="Address" placeholder="---Type---" required>
											${sessionScope.Address}
										</textarea>
									</td>
								</tr>
								<tr>
									<td>
										<label>Pincode</label>
										<input type="text" name="pincode" required pattern="^[0-9]{6}$" title="Pincode is not valid" value="${sessionScope.pincode}">
									</td>	
								</tr>
								<tr>
									<td>
										<label>City:-</label>
										<input type="text" name="city" value="Ahmedabad" readonly value="${sessionScope.city}">
									</td>
									<td>
										<label>State:-</label>
										<input type="text" name="state" value="Gujarat" readonly value="${sessionScope.state}">
									</td>
								</tr>
							</table>
						</div>
							<div class="personal">
							<h3>Personal Details</h3>
							<table>
								<tr>
									<td>
										<label>Date Of Birth:-</label>
										<input type="date" name="date_of_birth" required value="${sessionScope.date_of_birth_a}">
									</td>
									<td>
										<label>Gender:-</label>
										<div class="radio">
											<%
												String gender=(String)session.getAttribute("gender");
												if(gender.compareTo("Male")==0)
												{
												%>
													<input type="radio" name="gender" class="radio1" value="Male" checked><span class="radioname" required>Male</span>
													<input type="radio" class="radio2" name="gender" value="Female"><span class="radioname" required>Female</span>
												<%
												}
												else
												{
												%>	
													<input type="radio" name="gender" class="radio1" value="Male"><span class="radioname" required>Male</span>
													<input type="radio" class="radio2" name="gender" value="Female" checked><span class="radioname" required>Female</span>
												<%
												}
											%>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<label>Blood Group</label>
										<input type="text" list="bloodgroup" name="blood_group" placeholder="----Select----" required value="${sessionScope.blood_group}" readonly>
										<datalist id="bloodgroup">
											<option value="A+"></option>
											<option value="A-"></option>
											<option value="AB+"></option>
											<option value="B+"></option>
											<option value="B-"></option>
											<option value="O+"></option>
											<option value="O-"></option>
										</datalist>
									</td>
									<td>
										<label>Weight In Kg [Approx]:-</label>
										<input type="number" name="weight" required value="${sessionScope.weight}" readonly>
									</td>	
								</tr>
							</table>
						</div>
						<span>
							<input type="checkbox" name="terms" id="checkbox" required>
						</span><p>I agree to have my contact details broadcasted to the registered donors of B24U.net</p>
						
						<div class="btnn">
							<input type="submit" name="submit" value="Update">
							<input type="reset" name="submit" value="Reset">
						</div>
						</form>
				</div>

			</div>
		</div>
			
			<!-- Responsive Table -->
			<div class="rregisterdonor">
			<form action="/B24U/UpdateDonor" method="POST">
			
				<div class="rlogin">
					<h3>Login Details</h3>
					<table>
						<tr>
							<td >
								<label class="username">User Name:-</label>
								<input type="text" name="user_name" required pattern="^[A-Za-z0-9._%+-@]{5,10}$" title="Enter a username between 5 to 10 letter" value="${sessionScope.user_name}">
							</td>
						</tr>
						<tr>
							<td>
								<label>Full Name:-</label>
								<input type="text" name="user_full_name" required pattern="[A-z ]+$" title="Use only character & whitespace" value="${sessionScope.user_full_name}">
							</td>
						</tr>
						<tr>	
							<td>
								<label>Email Id:-</label>
								<input type="email" name="user_email" required pattern="[A-Za-z0-9._%+-]+@[A-z0-9.-]+\.[a-z]{2,}$" title="Email id is not Valid" value="${sessionScope.user_email}">
							</td>
						</tr>
						<tr>
							<td>
								<label>Password:-</label>
								<input type="password"name="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters" value="${sessionScope.password}" readonly>
							</td>
						</tr>
						<tr>
							<td>
								<label>Confirm Password:-</label>
								<input type="text" name="confirm_password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters" value="${sessionScope.confirm_password}" readonly>
							</td>
						</tr>
					</table>
				</div>
				<div class="rcontact">
					<h3>Contact Details</h3>
					<table>
						<tr>
							<td>
								<label>Mobile Number:-</label>
								<input type="text" name="user_number" required pattern="^[1-9]{1}[0-9]{9}$" title="Number is not valid" value="${sessionScope.user_number}">
							</td>
						</tr>
						<tr>
							<td>
								<label>Address:-</label>
								<textarea name="Address" placeholder="---Type---" required >
									${sessionScope.Address}
								</textarea>
							</td>
						</tr>
						<tr>
							<td>
								<label>Pincode</label>
								<input type="text" name="pincode" required pattern="^[0-9]{6}$" title="Pincode is not valid" value="${sessionScope.pincode}">
							</td>	
						</tr>
						<tr>
							<td>
								<label>City:-</label>
								<input type="text" name="city" value="Ahmedabad" readonly value="${sessionScope.city}">
							</td>
						</tr>
						<tr>
							<td>
								<label>State:-</label>
								<input type="text" name="state" value="Gujarat" readonly value="${sessionScope.state}">
							</td>
						</tr>
					</table>
				</div>
					<div class="rpersonal">
					<h3>Personal Details</h3>
					<table>
						<tr>
							<td>
								<label>Date Of Birth:-</label>
								<input type="date" name="date_of_birth" required value="${sessionScope.date_of_birth}">
							</td>
						</tr>
						<tr>
							<td>
								<label>Gender:-</label>
								<div class="radio">
									<%
										if(gender.compareTo("Male")==0)
										{
										%>
											<input type="radio" name="gender" class="radio1" value="Male" checked><span class="radioname" required>Male</span>
											<input type="radio" class="radio2" name="gender" value="Female"><span class="radioname" required>Female</span>
										<%
										}
										else
										{
										%>
											<input type="radio" name="gender" class="radio1" value="Male"><span class="radioname" required>Male</span>
											<input type="radio" class="radio2" name="gender" value="Female" checked><span class="radioname" required>Female</span>
										<%
										}
									%>		
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<label>Blood Group</label>
								<input type="text" list="bloodgroup" name="blood_group" placeholder="----Select----" required value="${sessionScope.blood_group}" readonly>
								<datalist id="bloodgroup">
									<option value="A+"></option>
									<option value="A-"></option>
									<option value="AB+"></option>
									<option value="B+"></option>
									<option value="B-"></option>
									<option value="O+"></option>
									<option value="O-"></option>
								</datalist>
							</td>
						</tr>
						<tr>
							<td>
								<label>Weight In Kg [Approx]:-</label>
								<input type="number" name="weight" required value="${sessionScope.weight}" readonly>
							</td>	
						</tr>
					</table>
				</div>


				<span>
					<input type="checkbox" name="terms" id="checkbox" required >
				</span><p>I agree to have my contact details broadcasted to the registered donors of B24U.net</p>
				<div class="btnn">
					<input type="submit" name="submit" value="Update">
					<input type="reset" name="submit" value="Reset">
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
               
            },
            lname:{
            	  required: true,
            	  lettersonly:true,

            },
            email:{
            	required:true,
            	email:true,
            	checkemail:true,
            },
            password:{
            	required:true,
            	minlength:7,
            	maxlength:15,

            },
            confirm_password:{
            	required:true,
            	minlength:7,
            	maxlength:15,
            	equalTo: "#password",


            },
            contect_no:{
            	required:true,
            	minlength:10,
            	maxlength:10,
            	digits:true,
            },
            img:{
            	required:true,
            	// uploadfile:true,
            	accept: "jpg,png,jpeg,gif",
            },
        
        },
        messages:{
        	fname:{
        		required:"firstname is required",
        		lettersonly:"enter letters only",
        	},
        	
        	lname:{
        		required:"last name is required",
        		lettersonly:"enter letters only",
        	},
        	email:{
        		required:"email required",
        		email:"enter valid email",
        		checkemail:"enter proper email",

        	},
			password:{
				required:"password is required",
				minlength:"enter password between 7-15",
				maxlength:"enter password between 7-15",
			},
			confirm_password:{
				required:"password is required",
				minlength:"enter password between 7-15",
				maxlength:"enter password between 7-15",
				equalTo:"password must be same",


			},
			contect_no:{
				required:"contect no is required",
				minlength:"enter contect number 10digits",
				maxlength:"enter contect number 10digits",
				digits:"enter 10 digits",


			},
        	img:{
        		required:"upload image",
        		// uploadfile:"upload image",
        		accept:"upload image only jpg,jpeg,png ",


        	},
        },
    });

});
</script>

</body>
<script>
		function openNav()
		{
  			document.getElementById("mySidenav").style.display = "block";
		}
		function closeNav()
		{
  			document.getElementById("mySidenav").style.display = "none";
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
	</script>
</html>