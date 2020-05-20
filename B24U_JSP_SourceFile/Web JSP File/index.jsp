<%@page import="java.sql.*;"  %>
<%@page import="java.io.*;"  %>
<%@page import="javax.servlet.*;"  %>
<%@page import="javax.servlet.http.*;"  %>
<%@page import="B24U.*;"  %>
<%@page import="java.text.SimpleDateFormat;"  %>
<%@page import="java.util.Date;"  %>
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="CSS\styleindex.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style type="text/css">
    .nav > ul > li:nth-child(2)
    {
      color: white;
      background-color: black;
    }
  </style>
</head>
<body >
    <%@include file="header.jsp"%>
    <div class="heading fix"> 
      <label>Home</label>
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
    <div class="slideshow" onmouseover="arrowshow()" onmouseout="arrowhide()">
      <div class="mySlides fade">
        <img src="https://www.nysenate.gov/sites/default/files/styles/760x377/public/donate_blood_rotator.jpg?itok=SKSv3T7P&timestamp=1444009944">
      </div>
      <div class="mySlides fade">
          <img src="https://www.sentinelassam.com/wp-content/uploads/2019/06/iStock-690302872.jpg">
      </div>
      <div class="mySlides fade">
        <img src="http://healthstaff.co.za/wp-content/uploads/2018/06/World-Blood-Donor-Day-Quotes-Slogans-Sayings-Images-Whatsapp-Status-FB-DP.jpg">
      </div>
      <div class="mySlides fade">
          <img src="https://sgc.edu.in/wp-content/uploads/2017/04/BDC.jpg">
      </div>
      <div class="arrow" id="a1">
        <i class="fa fa-chevron-left" aria-hidden="true" onclick="plusSlides(-1)" ></i>
        <i class="fa fa-chevron-right" aria-hidden="true" onclick="plusSlides(1)" ></i>
        <span class="dot" onclick="currentSlide(1)"></span> 
          <span class="dot" onclick="currentSlide(2)"></span> 
          <span class="dot" onclick="currentSlide(3)"></span>
          <span class="dot" onclick="currentSlide(4)"></span>
      </div>
    </div>
    <div class="eventheader">
      <label>RECENT&nbsp;EVENT</label>
    </div>
    <div class="eventobox first">
      <a href="viewall.jsp">View all</a>
      <%
        try
        {
          Connection con = DatabaseConnection.initializeDatabase();
          Statement stmt=con.createStatement();
          ResultSet rs=stmt.executeQuery("SELECT * FROM eventlogin WHERE status=0 AND DATEDIFF(event_date,CURDATE()) >0 ORDER BY date(`event_date`)");
          rs.last();
          int number=rs.getRow();
          int a=0;
          if(number>0)
          {
            rs=stmt.executeQuery("SELECT * FROM eventlogin WHERE status=0 AND DATEDIFF(event_date,CURDATE()) >0 ORDER BY date(`event_date`)");
            while(rs.next())
            {
              if(a<4)
              {
                String date=rs.getString("event_date");
                SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd");
                Date d1=ft.parse(date);
                SimpleDateFormat ftd=new SimpleDateFormat("dd");
                SimpleDateFormat ftm=new SimpleDateFormat("MMM");
                SimpleDateFormat fty=new SimpleDateFormat("yyyy");
                %>
                  <div class='eventibox'>
                    <div class='eventdate'> 
                      <p><%=ftd.format(d1)%></p><BR><p><%=ftm.format(d1)%></p><BR><p><%=fty.format(d1)%></p>
                    </div>
                    <div class='eventdetails'>
                      <ul>
                        <li>
                          <i class='fa fa-user' aria-hidden='true'></i><p><%=rs.getString("user_full_name")%></p>  
                        </li>
                        <li>
                          <i class='fa fa-phone' aria-hidden='true'></i><p><%=rs.getString("user_number")%></p>
                        </li>
                        <li>
                          <i class='fa fa-clock-o' aria-hidden='true'></i><p><%=rs.getString("start_time")%> to&nbsp;<%=rs.getString("end_time")%></p>
                        </li>
                        <li>
                          <i class='fa fa-location-arrow' aria-hidden='true'></i><p><%=rs.getString("city")%></p>
                        </li>
                      </ul>
                    </div>
                  </div>
                <%
                a++;
              }
              if(a>3)
              {
                break;
              }
            }
          }
          while(a < 4)
            {
              %>
              <div class='eventibox'>
                  <div class='eventdate'> 
                    <p></p><BR><p style="font-size: 85px;top: 0;"><i class="fa fa-frown-o"></i></p><BR><p></p>
                  </div>
                  <div class='eventdetails'>
                    <ul>
                      <li>
                        <p></p> 
                      </li>
                      <li>
                        <p style="padding-left: 40px;font-size: 20px;">More Events are </p>
                      </li>
                      <li>
                        <p style="padding-left: 40px;font-size: 20px;">Comeing Soon..!!!</p>
                      </li>
                      <li>
                        <p></p>
                      </li>
                    </ul>
                  </div>
              </div>
              <%
              a++;
            }
        }
        catch(Exception e)
        {
          out.println("Exception Accour");
          e.printStackTrace();
        }
      %>
    </div>
    <div class="eventobox last">
      <a href="viewall.jsp">View all</a>
      <%
        try
        {
          Connection con = DatabaseConnection.initializeDatabase();
          Statement stmt=con.createStatement();
          ResultSet rs=stmt.executeQuery("SELECT * FROM eventlogin WHERE status=0 AND DATEDIFF(event_date,CURDATE()) >0 ORDER BY date(`event_date`)");
          rs.last();
          int number=rs.getRow();
          int a=0;
          if(number>0)
          {
            rs=stmt.executeQuery("SELECT * FROM eventlogin WHERE status=0 AND DATEDIFF(event_date,CURDATE()) >0 ORDER BY date(`event_date`)");
            while(rs.next())
            {
              if(a<3)
              {
                String date=rs.getString("event_date");
                SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd");
                Date d1=ft.parse(date);
                SimpleDateFormat ftd=new SimpleDateFormat("dd");
                SimpleDateFormat ftm=new SimpleDateFormat("MMM");
                SimpleDateFormat fty=new SimpleDateFormat("yyyy");
                %>
                  <div class='eventibox'>
                    <div class='eventdate'> 
                      <p><%=ftd.format(d1)%></p><BR><p><%=ftm.format(d1)%></p><BR><p><%=fty.format(d1)%></p>
                    </div>
                    <div class='eventdetails'>
                      <ul>
                        <li>
                          <i class='fa fa-user' aria-hidden='true'></i><p><%=rs.getString("user_full_name")%></p>  
                        </li>
                        <li>
                          <i class='fa fa-phone' aria-hidden='true'></i><p><%=rs.getString("user_number")%></p>
                        </li>
                        <li>
                          <i class='fa fa-clock-o' aria-hidden='true'></i><p><%=rs.getString("start_time")%> to&nbsp;<%=rs.getString("end_time")%></p>
                        </li>
                        <li>
                          <i class='fa fa-location-arrow' aria-hidden='true'></i><p><%=rs.getString("city")%></p>
                        </li>
                      </ul>
                    </div>
                  </div>
                <%
                a++;
              }
              if(a>2)
              {
                break;
              }
            }
          }
          
            while(a < 3)
            {
            %>
              <div class='eventibox'>
                  <div class='eventdate'> 
                    <p></p><BR><p style="font-size: 85px;top: 0;"><i class="fa fa-frown-o"></i></p><BR><p></p>
                  </div>
                  <div class='eventdetails'>
                    <ul>
                      <li>
                        <p></p> 
                      </li>
                      <li>
                        <p style="padding-left: 20px;font-size: 20px;">More Events are </p>
                      </li>
                      <li>
                        <p style="padding-left: 20px;font-size: 20px;">Comeing Soon..!!!</p>
                      </li>
                      <li>
                        <p></p>
                      </li>
                    </ul>
                  </div>
              </div>
            <%
              a++;
            }
        }
        catch(Exception e)
        {
          out.println("Exception Accour");
          e.printStackTrace();
        }
      %>
    </div>

    <div class="teacherimage">
      <img src="Image/teacher.png">
    </div>
    <div class="quote">
            <div class="quoteiconl">
              <i class="fa fa-quote-left" aria-hidden="true"></i>
            </div>
            <section class="quotes">
              <div class="quote-text"></div>
          </section>
          <div class="quoteiconr">
            <i class="fa fa-quote-right" aria-hidden="true"></i>
          </div>
    </div>
    <div class="containt">
      <div class="video">
        <iframe width="485" height="206" src="https://www.youtube.com/embed/nzpf3ZxB3p8" frameborder="0"  allowfullscreen></iframe>
      </div>
      <div class="write">
        <h4>Why are platelets so important ?</h4>
        <p>Platelets are tiny cells in your blood that form clots and stop bleeding. For millions of Americans, they are essential to surviving and fighting cancer, chronic diseases, and traumatic injuries. Every 15 seconds someone needs platelets. Platelets must be used within five days and new donors are needed every day. That's why we need you.</p>
      </div>
    </div>
    <div class="readobox">
      <div class="readibox">
        <i class="fa fa-tint" aria-hidden="true"></i>
        <h4>WHY GIVE BLOOD ?</h4>
        <a href="blood_tips.jsp"><button> READ MORE</button></a>
      </div>
      <div class="readibox">
        <i class="fa fa-user" aria-hidden="true"></i>
        <h4>Donor Register now !</h4>
        <a href="registar_donor.jsp"><button>Become Donor</button></a>
      </div>
      <div class="readibox lasti">
        <i class="fa fa-list-alt" aria-hidden="true"></i>
        <h4>Pending Blood Request</h4>
        <a href="pending_request.jsp"><button>Show details</button></a>
      </div>
    </div>
    <%@include file="footer.jsp"%>
    
</body>
<script type="text/javascript">
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
  function arrowshow()
  {
    document.getElementById("a1").style.display="block";
    document.getElementById("a2").style.display="block";
  }
  function arrowhide()
  {
    document.getElementById("a1").style.display="none";
    document.getElementById("a2").style.display="block";
  }
  var slideIndex = 1;
  showSlides(slideIndex);
  function plusSlides(n)
  {
      showSlides(slideIndex += n);
  }
  function currentSlide(n)
  {
      showSlides(slideIndex = n);
  }
  function showSlides(n)
  {
      var i;
      var slides = document.getElementsByClassName("mySlides");
       var dots = document.getElementsByClassName("dot");
      if (n > slides.length) 
      {
        slideIndex = 1
      }    
      if (n < 1) 
      {
        slideIndex = slides.length
      }
      for (i = 0; i < slides.length; i++)
      {
          slides[i].style.display = "none";  
      }
      for (i = 0; i < dots.length; i++)
      {
        dots[i].className = dots[i].className.replace(" active", "");
      }
      slides[slideIndex-1].style.display = "block";
      dots[slideIndex-1].className += " active";
  }
  setInterval(function(){plusSlides(1);},5000);
  
const endpoint = 'https://api.whatdoestrumpthink.com/api/v1/quotes/random';
  getQuote();
  setInterval(getQuote,9000);
function getQuote() {
  fetch(endpoint)
    .then(function (response) {
      return response.json();
    })
    .then(function (data) {
      displayQuote(data.message);
    })
    .catch(function () {
      console.log("An error occurred");
    });
}
function displayQuote(quote) {
  const quoteText = document.querySelector('.quote-text');
  quoteText.textContent = quote;
}
</script>
</html>