<%@page import="java.sql.*;"  %>
<%@page import="java.io.*;"  %>
<%@page import="javax.servlet.*;"  %>
<%@page import="javax.servlet.http.*;"  %>
<%@page import="B24U.*;"  %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="CSS\styleaboutus.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style type="text/css">
        .nav > ul > li:nth-child(7)
        {
            color: white;
            background-color: black;
        }
    </style>
</head>
<body >
		<%@include file="header.jsp"%>
		<div class="heading fix">	
			<label>About Us</label>
		</div>
		<div class="contentbox">
			<div class="box">
				<h4>What We do ?</h4>
				<p>We connect blood donors with recipients, without any intermediary such as blood banks, for an efficient and seamless process.</p>			
			</div>
			<div class="box">
				<h4>Get Notified..!!!</h4>
				<p>B24U Connect works with network partners to connect blood donors and recipients through an automated SMS service and a web app.</p>			
			</div>
			<div class="box">
				<h4>Tottaly Free</h4>
				<p>B24U Connect's ultimate goal is to provide an easy-to-use, easy-to-access, fast, efficient, and reliable way to get life-saving blood, totally Free of cost.</p>
			</div>
			<div class="box">
				<h4>Save Life</h4>
				<p>We are a non profit foundation and our main objective is to make sure that everything is done to protect vulnerable persons. Help us by making a gift !!!</p>
			</div>
		</div>
		<div class="counterbox">
			<div class="counter">
				<span class="meter">
                                    <%
                                        try
                                        {
                                            Connection con = DatabaseConnection.initializeDatabase();
                                            Statement stmt=con.createStatement();
                                            ResultSet rs=stmt.executeQuery("SELECT * FROM donorlogin");
                                            rs.last();
                                            int a=rs.getRow();
                                            String text;
                                            String t1,t2,t3,t4;
                                            int fi,se,th,fo;
                                            if(a<10)
                                            {
                                                fi=0;
                                                se=0;
                                                th=0;
                                                fo=a;
                                            }
                                            else if(a<100)
                                            {
                                                text=""+a;
                                                fi=0;
                                                se=0;
                                                t2=text.substring(0,1);
                                                th=Integer.valueOf(t2);
                                                t1=text.substring(1,2);
                                                fo=Integer.valueOf(t1);
                                            }
                                            else if(a<1000)
                                            {
                                                text=""+a;
                                                fi=0;
                                                t3=text.substring(0,1);
                                                se=Integer.valueOf(t3);
                                                t2=text.substring(1,2);
                                                th=Integer.valueOf(t2);
                                                t1=text.substring(2,3);
                                                fo=Integer.valueOf(t1);
                                            }
                                            else
                                            {
                                                text=""+a;
                                                t4=text.substring(0,1);
                                                fi=Integer.valueOf(t4);
                                                t3=text.substring(1,2);
                                                se=Integer.valueOf(t3);
                                                t2=text.substring(2,3);
                                                th=Integer.valueOf(t2);
                                                t1=text.substring(3,4);
                                                fo=Integer.valueOf(t1);
                                            }
                                    %>
                                    <span class='block'>
                                        <p><%=fi%></p>
                                    </span>
                                    <span class='block'>
                                        <p><%=se%></p>
                                    </span>
                                    <span class='block'>
                                        <p><%=th%></p>
                                    </span>
                                    <span class='block'>
					                   <p><%=fo%></p>
                                    </span>
                                    <%
                                        }
                                        catch(Exception e)
                                        {
                                            out.println("Exception Accour");
                                            e.printStackTrace();
                                        }
                                    %>
                                    <i class="fa fa-plus" aria-hidden="true"></i>
				</span>
				<span class="label">
					<p>Blood Donors</p>
				</span>
			</div>
			<div class="counter">
				<span class="meter">
                                    <%
                                        try
                                        {
                                            Connection con = DatabaseConnection.initializeDatabase();
                                            Statement stmt=con.createStatement();
                                            ResultSet rs=stmt.executeQuery("SELECT * FROM requestblood");
                                            rs.last();
                                            int a=rs.getRow();
                                            String text;
                                            String t1,t2,t3,t4;
                                            int fi,se,th,fo;
                                            if(a<10)
                                            {
                                                fi=0;
                                                se=0;
                                                th=0;
                                                fo=a;
                                            }
                                            else if(a<100)
                                            {
                                                text=""+a;
                                                fi=0;
                                                se=0;
                                                t2=text.substring(0,1);
                                                th=Integer.valueOf(t2);
                                                t1=text.substring(1,2);
                                                fo=Integer.valueOf(t1);
                                            }
                                            else if(a<1000)
                                            {
                                                text=""+a;
                                                fi=0;
                                                t3=text.substring(0,1);
                                                se=Integer.valueOf(t3);
                                                t2=text.substring(1,2);
                                                th=Integer.valueOf(t2);
                                                t1=text.substring(2,3);
                                                fo=Integer.valueOf(t1);
                                            }
                                            else
                                            {
                                                text=""+a;
                                                t4=text.substring(0,1);
                                                fi=Integer.valueOf(t4);
                                                t3=text.substring(1,2);
                                                se=Integer.valueOf(t3);
                                                t2=text.substring(2,3);
                                                th=Integer.valueOf(t2);
                                                t1=text.substring(3,4);
                                                fo=Integer.valueOf(t1);
                                            }
                                    %>
                                    <span class='block'>
                                        <p><%=fi%></p>
                                    </span>
                                    <span class='block'>
                                        <p><%=se%></p>
                                    </span>
                                    <span class='block'>
                                        <p><%=th%></p>
                                    </span>
                                    <span class='block'>
					<p><%=fo%></p>
                                    </span>
                                    <%
                                        }
                                        catch(Exception e)
                                        {
                                            out.println("Exception Accour");
                                            e.printStackTrace();        
                                        }
                                    %>
					<i class="fa fa-plus" aria-hidden="true"></i>
				</span>
				<span class="label">
					<p>Blood Requests</p>
				</span>
			</div>
			<div class="counter">
				<span class="meter">
                                    <%
                                        try
                                        {
                                            Connection con = DatabaseConnection.initializeDatabase();
                                            Statement stmt=con.createStatement();
                                            ResultSet rs=stmt.executeQuery("SELECT * FROM eventlogin");
                                            rs.last();
                                            int a=rs.getRow();
                                            String text;
                                            String t1,t2,t3,t4;
                                            int fi,se,th,fo;
                                            if(a<10)
                                            {
                                                fi=0;
                                                se=0;
                                                th=0;
                                                fo=a;
                                            }
                                            else if(a<100)
                                            {
                                                text=""+a;
                                                fi=0;
                                                se=0;
                                                t2=text.substring(0,1);
                                                th=Integer.valueOf(t2);
                                                t1=text.substring(1,2);
                                                fo=Integer.valueOf(t1);
                                            }
                                            else if(a<1000)
                                            {
                                                text=""+a;
                                                fi=0;
                                                t3=text.substring(0,1);
                                                se=Integer.valueOf(t3);
                                                t2=text.substring(1,2);
                                                th=Integer.valueOf(t2);
                                                t1=text.substring(2,3);
                                                fo=Integer.valueOf(t1);
                                            }
                                            else
                                            {
                                                text=""+a;
                                                t4=text.substring(0,1);
                                                fi=Integer.valueOf(t4);
                                                t3=text.substring(1,2);
                                                se=Integer.valueOf(t3);
                                                t2=text.substring(2,3);
                                                th=Integer.valueOf(t2);
                                                t1=text.substring(3,4);
                                                fo=Integer.valueOf(t1);
                                            }
                                    %>
                                    <span class='block'>
                                        <p><%=fi%></p>
                                    </span>
                                    <span class='block'>
                                        <p><%=se%></p>
                                    </span>
                                    <span class='block'>
                                        <p><%=th%></p>
                                    </span>
                                    <span class='block'>
					                    <p><%=fo%></p>
                                    </span>
                                    <%
                                        }
                                        catch(Exception e)
                                        {
                                            out.println("Exception Accour");
                                            e.printStackTrace();        
                                        }
                                    %>
                                    <i class="fa fa-plus" aria-hidden="true"></i>
				</span>
				<span class="label">
					<p>Event Organize</p>
				</span>
			</div>
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
		<%@include file="footer.jsp"%>
	</body>
</html>