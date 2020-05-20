<%@page import="java.sql.*;"  %>
<%@page import="java.io.*;"  %>
<%@page import="javax.servlet.*;"  %>
<%@page import="javax.servlet.http.*;"  %>
<%@page import="B24U.*;"  %>
<%
	String select=request.getParameter("select");
	String user_name=(String)session.getAttribute("user_name");
%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="..\CSS\styledonorhistory.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
			<li class="active"><a href="donor_page.jsp" >Donor History</a></li>
			<li><a href="health_report.jsp">Health Report</a></li>
			<li><a href="pending_request_donor.jsp">Pending Request</a></li>
			<li><a href="d_blood_tips.jsp">Blood Tips</a></li>
			<li><a href="d_contribute.jsp">Contribute</a></li>
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
				<label>Donor History</label>
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
		<div class="box">
			<h3>Donor History</h3>
			<div class="addinfo">
						<form action="donor_history.jsp" method="post">
						<span><i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
						<input type='text' autocomplete="off" list='select' name='select' required value='<% out.print(select); %>' >
						<datalist id='select'>
							<option value='All'></option>
							<option value='Event'></option>
							<option value='Patient'></option>	
					</datalist><br>
			<div class="btn">
				<input type="submit" name="submit" value="Show Details">
			</div>
						</form>
			</div>
			<table border="1">
				<%
					if(select.compareTo("Event")==0)
					{
					%>
						<th>Serial No.</th>
						<th>Event Name</th>
						<th>Event Date</th>
						<th>Donation Type</th>
						<th>Donation Date</th>
					<%
						try
						{
							Connection con = DatabaseConnection.initializeDatabase();
				            Statement stmt=con.createStatement();
				            ResultSet rs=stmt.executeQuery("SELECT * FROM `"+user_name+"` WHERE event_status=1");
				            int a=1;
				            while(rs.next())
				            {
				            	%>
				                <tr>
				                	<td><%=a++%></td>
				                	<td><%=rs.getString("event_name")%></td>
				                	<td><%=rs.getString("donation_date")%></td>
				                	<td><%=rs.getString("donation_type")%></td>
				                	<td><%=rs.getString("donation_date")%></td>
				                </tr>
				              <%
				            }
						}
						catch(Exception e)
						{
							out.println("Exception Accour");
						}
					}
					else if (select.compareTo("Patient")==0) 
					{
					%>
						<th>Serial No.</th>
						<th>Patient Name</th>
						<th>Donation Type</th>
						<th>Donation Date</th>
					<%
						try
						{
							Connection con = DatabaseConnection.initializeDatabase();
				            Statement stmt=con.createStatement();
				            ResultSet rs=stmt.executeQuery("SELECT * FROM `"+user_name+"` WHERE request_blood_status=1");
				            int a=1;
				            while(rs.next())
				            {
				            	%>
				                <tr>
				                	<td><%=a++%></td>
				                	<td><%=rs.getString("patient_name")%></td>
				                	<td><%=rs.getString("donation_type")%></td>
				                	<td><%=rs.getString("donation_date")%></td>
				                </tr>
				              <%
				            }
						}
						catch(Exception e)
						{
							out.println("Exception Accour");
						}	
					}
					else
					{
					%>
						<th>Serial No.</th>
						<th>Donation Date</th>
						<th>Event Name</th>
						<th>Donation Type</th>
						<th>Patient Name</th>
					<%
						try
						{
							Connection con = DatabaseConnection.initializeDatabase();
				            Statement stmt=con.createStatement();
				            ResultSet rs=stmt.executeQuery("SELECT * FROM `"+user_name+"`");
				            int a=1;
				            while(rs.next())
				            {
				            	%>
				                <tr>
				                	<td><%=a++%></td>
				                	<td><%=rs.getString("donation_date")%></td>
				                <%	
				                	if(rs.getString("event_name")!=null && !rs.getString("event_name").isEmpty())
				                	{
				                	%>
				                		<td><%=rs.getString("event_name")%></td>
					                	<td><%=rs.getString("donation_type")%></td>
					                	<td>------</td>
					                <%
				                	}
				                	else
				                	{
				                	%>
				                		<td>------</td>
					                	<td><%=rs.getString("donation_type")%></td>
					                	<td><%=rs.getString("patient_name")%></td>
				                	<%
				                	}
				                	%>
				                </tr>
				              <%
				            }
						}
						catch(Exception e)
						{
							out.println("Exception Accour");
						}
					}
				%>
			</table>
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
	<script type="text/javascript">
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