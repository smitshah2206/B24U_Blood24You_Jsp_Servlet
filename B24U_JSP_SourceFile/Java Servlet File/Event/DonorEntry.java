package Event;
import B24U.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.text.SimpleDateFormat;
import java.util.Date;
public class DonorEntry extends HttpServlet 
{
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        PrintWriter out=response.getWriter();
        HttpSession session=request.getSession(false);
        try 
        { 
            Connection con = DatabaseConnection.initializeDatabase();
            Statement st=con.createStatement();
            response.setContentType("text/html");
            int did=(int)session.getAttribute("did");
            String last_place_donation=(String)session.getAttribute("city");
            String email=(String)session.getAttribute("user_email");
            String user_full_name=(String)session.getAttribute("user_full_name");
            String weight=request.getParameter("weight");
            String bloodpressure=request.getParameter("bloodpressure");
            String pulse=request.getParameter("pulse");
            String hemoglobin=request.getParameter("hemoglobin");
            String need=request.getParameter("need");
            int bl=0;
            int pl=0;
            int pa=0;
            int ev=0;
            String uname="";
            String dname="";
            String dnumber="";
            String dbloodgroup="";
            ResultSet rs = st.executeQuery("SELECT * FROM donorlogin WHERE id='"+did+"' AND status=0");
            rs.last();
            int number=rs.getRow();
            if (number==1)
            {
                rs = st.executeQuery("SELECT * FROM donorlogin WHERE id='"+did+"' AND status=0");
                while(rs.next())
                {
                    dname =rs.getString("user_full_name");
                    dnumber =rs.getString("user_number");
                    dbloodgroup =rs.getString("blood_group");
                    bl =rs.getInt("blood_donation");
                    pl =rs.getInt("pletlets_donation");
                    pa =rs.getInt("plasama_donation");
                    ev =rs.getInt("attend_event");
                    uname =rs.getString("user_name");
                }
                Date date=new Date();
                SimpleDateFormat ft=new SimpleDateFormat("dd-MM-yyyy");
                String report_date=ft.format(date);
                if(need.compareTo("Blood")==0)
                {
                    bl=bl+1;
                }
                else if(need.compareTo("Pletlets")==0)
                {
                    pl=pl+1;   
                }
                else
                {
                    pa=pa+1;
                }
                ev=ev+1;
                int td=bl+pl+pa;
                int es=1;
                st.executeUpdate("UPDATE donorlogin SET  weight='"+weight+"',blood_pressure='"+bloodpressure+"',pulse='"+pulse+"',hemoglobin='"+hemoglobin+"',blood_donation='"+bl+"',pletlets_donation='"+pl+"',plasama_donation='"+pa+"',total_donation='"+td+"',health_report='"+report_date+"',attend_event='"+ev+"',last_donation='"+report_date+"',last_place_donation='"+last_place_donation+"' WHERE id='"+did+"'");
                PreparedStatement rs2 = con.prepareStatement("INSERT INTO `"+uname+"` (`event_status`,`event_name`,`donation_date`,`donation_type`) VALUES (?,?,?,?)");
                rs2.setInt(1,es);
                rs2.setString(2,user_full_name);
                rs2.setString(3,report_date);
                rs2.setString(4,need);
                rs2.executeUpdate();
                PreparedStatement rs3 = con.prepareStatement("INSERT INTO `"+email+"` (`donor_id`,`user_full_name`,`user_number`,`blood_group`,`weight`,`blood_pressure`,`pulse`,`hemoglobin`,`donation_type`) VALUES(?,?,?,?,?,?,?,?,?)");
                rs3.setInt(1,did);
                rs3.setString(2,dname);
                rs3.setString(3,dnumber);
                rs3.setString(4,dbloodgroup);
                rs3.setString(5,weight);
                rs3.setString(6,bloodpressure);
                rs3.setString(7,pulse);
                rs3.setString(8,hemoglobin);
                rs3.setString(9,need);
                rs3.executeUpdate();
                out.print("<html><body><script>alert('Thank you...!!!! Donor is Added ...!!!');window.location='/B24U/Event/donor_entry.jsp';</script><body></html>");
            }
            else
            {
                out.print("<html><body><script>alert('Donor is not registered ...!!!');window.location='/B24U/Event/donor_entry.jsp';</script><body></html>");
            }

        }
        catch (Exception e) 
        {
            out.print("<html><body><script>alert('Something went wrong....!!!');window.location='/B24U/Event/donor_entry.jsp';</script><body></html>");
        }
    }
}
