<%@page import="java.sql.*;"  %>
<%@page import="java.io.*;"  %>
<%@page import="javax.servlet.*;"  %>
<%@page import="javax.servlet.http.*;"  %>
<%@page import="B24U.*;"  %>
<%
	Connection con = DatabaseConnection.initializeDatabase();
    Statement stmt=con.createStatement();
	String id=request.getParameter("donor_id");
	String user_email=(String)session.getAttribute("user_email");
	String dname="";
	String dnumber="";
	String dblood_group="";
	String dweight="";
	String dblood_pressure="";
	String dpulse="";
	String dhemoglobin="";
	String d_id="";
	if (id!=null && !id.isEmpty())
	{
		ResultSet rs=stmt.executeQuery("SELECT donor_id FROM `"+user_email+"` WHERE donor_id='"+id+"' ");
		rs.last();
       	int number=rs.getRow();
       	if(number==1)
       	{
       	%>
       		<script> alert("This Donor come before...!!!");window.location="donor_entry.jsp"; </script>
       	<%
       	}
       	else
       	{
       		ResultSet rs1=stmt.executeQuery("SELECT * FROM donorlogin WHERE id='"+id+"' AND status=0");
       		rs1.last();
	       	int number1=rs1.getRow();
	       	if(number1==1)
	       	{
	       		ResultSet rs4=stmt.executeQuery("SELECT * FROM donorlogin WHERE id='"+id+"' AND status=0");
	       		while(rs4.next())
	       		{
	       			session.setAttribute("did",rs4.getInt("id"));
					d_id=id;
					dname =rs4.getString("user_full_name");
					dnumber =rs4.getString("user_number");
					dblood_group =rs4.getString("blood_group");
					dweight =rs4.getString("weight");
					dblood_pressure =rs4.getString("blood_pressure");
					dpulse =rs4.getString("pulse");
					dhemoglobin =rs4.getString("hemoglobin");
	       		}
	       	}
	       	else
	       	{
	       	%>
	       		<script> alert("Donor Id not registered");window.location="donor_entry.jsp"; </script>
	       	<%
	       	}
       	}
	}
%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="..\CSS\styledonorentry.css">
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
				<li><a href="event_status.jsp">Event Status</a></li>
				<li class="active"><a href="donor_entry.jsp" >Donor Entry</a></li>
				<li><a href="e_blood_tips.jsp">Blood Tips</a></li>
				<li><a href="e_contribute.jsp">Contribute</a></li>
				<li><a href="e_about_us.jsp">About Us</a></li>
				<li><a href="e_get_in_touch.jsp">Contact Us</a></li>
			</ul>
		</div>
		<div id="mySidenav" class="sidenav">
  			<a  class="closebtn" onclick="closeNav()">&times;</a>
  			<a href="update_event.jsp" class="a"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
  			<a href="delete_event.jsp" class="b"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
			<i class="fa fa-id-card-o" aria-hidden="true" style="color:white;">
			&nbsp;${sessionScope.id}</i>
			<i class="fa fa-user" aria-hidden="true" style="color:white;">
			&nbsp;${sessionScope.user_full_name}</i>
			<i class="fa fa-envelope" aria-hidden="true" style="color:white;">
			&nbsp;${sessionScope.user_email}</i>
			<i class="fa fa-phone" aria-hidden="true" style="color:white;">
			&nbsp;${sessionScope.user_number}</i>
			<i class="fa fa-calendar" aria-hidden="true" style="color:white;">
			&nbsp;${sessionScope.event_date}</i>
			<i class="fa fa-clock-o" aria-hidden="true" style="color:white;">
			&nbsp;${sessionScope.start_time} &nbsp; to &nbsp; ${sessionScope.end_time}</i>
			<i class="fa fa-location-arrow" aria-hidden="true" style="color:white;">
			&nbsp;${sessionScope.city}</i>
			<div class="btn1" >
				<a href="signout_event.jsp"><input type="button" name="Signout" value="Sign Out"></a>
			</div>
		</div>
			<div class="heading fix">	
				<label>Donor Entry</label>
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
			<h3>Donor Entry</h3>
			<div class="addinfo">
				<i class="fa fa-id-card" aria-hidden="true"></i>
				<form action="donor_entry.jsp" method="post">
					<input type="number" name="donor_id" placeholder="Enter Donor ID " required autocomplete="off">
					<span class="btn">
						<a><input type="submit" name="submit" value="Add"></a>
					</span>
				</form>
			</div>
				<table border="1">
				<th>Donor ID No.</th>
				<th>Donor Name</th>
				<th>Blood Group</th>
				<th>Contact Number</th>
				<%
					try
					{
						ResultSet rs2=stmt.executeQuery("SELECT * FROM `"+user_email+"` ORDER BY id DESC ");
				        while(rs2.next())
				        {
				        %>
				        	<tr>
				            	<td><%=rs2.getString("donor_id")%></td>
				            	<td><%=rs2.getString("user_full_name")%></td>
				            	<td><%=rs2.getString("blood_group")%></td>
								<td><%=rs2.getString("user_number")%></td>
							</tr>
				        <%
				        }
					}
					catch(Exception e)
					{
						out.println("Exception Accour");
					}
				%>
			</table>
		</div>
		<div class="registerdonor">
			<%
				if (id!=null && !id.isEmpty())
				{
				%>
					<form action="/B24U/DonorEntry" method="post">
				<%
				}
				else
				{
				%>
					<form method="post">
				<%
				}
			%>
			<div class="login">
				<h3>Event Information</h3>
					<table>
						<tr>
							<td>
								<label>Donor Id :-</label>
							</td>	
							<td>
								<label class="sinfo"><%= d_id %></label>
							</td>
						</tr>
						<tr>
							<td>
								<label>Donor Name:-</label>
							</td>	
							<td>
								<label class="sinfo"><%= dname %></label>
							</td>
						</tr>
						<tr>
							<td>
								<label>Contact Number:-</label>
							</td>	
							<td>
								<label class="sinfo"><%= dnumber %></label>
							</td>
						</tr>
						<tr>
							<td>
								<label>Blood Group:-</label>
							</td>	
							<td>
								<label class="sinfo"><%= dblood_group %></label>
							</td>
						</tr>
						<tr>
							<td>
								<label>Weight:-</label>
							</td>	
							<td>
								<input type="number" required name="weight" value='<%= dweight%>'>
							</td>
						</tr>
						<tr>
							<td>
								<label>Blood Pressure:-</label>
							</td>
							<td>
								<input type="number" required name="bloodpressure" value='<%= dblood_pressure%>'> 
							</td>
						</tr>
						<tr>
							<td>
								<label>Pulse:-</label>	
							</td>	
							<td>
								<input type="number" required name="pulse" value='<%= dpulse%>'>
							</td>
						</tr>
						<tr>
							<td>
								<label>Hemoglobin:-</label>
							</td>	
							<td>
							<input type="number" required name="hemoglobin" value='<%= dhemoglobin%>'>
							</td>
						</tr>
						<tr>
							<td>
								<label>Donate Type:-</label>
							</td>
							<td>
							<input type="text" list="need" name="need" placeholder="----Select----" required>
								<datalist id="need">
								<option value="Plasama"></option>
								<option value="Blood"></option>
								<option value="Pletlets"></option>	
								</datalist>
							</td>
						</tr>				
						<tr>
							<div class="btn2">
								<input type="submit" name="submit" value="Update">
							</div>
						</tr>
					</table>
				</div>
			</form>
		</div>
		<%@include file="../footer.jsp"%>

	</body>
	<script type="text/javascript">
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