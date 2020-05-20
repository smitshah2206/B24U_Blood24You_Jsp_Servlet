package Donor;
import B24U.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.text.SimpleDateFormat;
import java.util.Date;
public class DonorPendingRequest extends HttpServlet 
{
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        PrintWriter out=response.getWriter();
        try 
        { 
            response.setContentType("text/html");
            HttpSession session=request.getSession(false);
            Connection con = DatabaseConnection.initializeDatabase();
            Statement st=con.createStatement();
            String id=request.getParameter("id");
            String blood_group=(String)session.getAttribute("blood_group");
            ResultSet rs=st.executeQuery("SELECT * FROM requestblood WHERE id='"+id+"' AND blood_group='"+blood_group+"'");
            if (rs.next()) 
            {
                String date1=rs.getString("required_date");
                SimpleDateFormat ft1=new SimpleDateFormat("yyyy-MM-dd");
                Date d11=ft1.parse(date1);
                SimpleDateFormat ftd1=new SimpleDateFormat("dd-MM-yyyy");
                String report_date=ftd1.format(d11);
                String patient_name=rs.getString("patient_name");
                int status=rs.getInt("status");
                if (status==0) 
                {
                    int d_id=(Integer)session.getAttribute("id");
                    st.executeUpdate("UPDATE  requestblood SET status=1,donor_id='"+d_id+"' WHERE id='"+id+"'");
                    ResultSet rs2=st.executeQuery("SELECT * from donorlogin WHERE id='"+d_id+"'");
                    rs2.next();
                    int bl=rs2.getInt("blood_donation");
                    int pl=rs2.getInt("plasama_donation");
                    int pa=rs2.getInt("pletlets_donation");
                    bl=bl+1;
                    int tl=bl+pl+pa;
                    String type="Blood";
                    String uname=(String)session.getAttribute("user_name");
                    st.executeUpdate("UPDATE donorlogin SET blood_donation='"+bl+"',total_donation='"+tl+"' WHERE id='"+d_id+"'");
                    int temp_status=1;
                    PreparedStatement rs4 = con.prepareStatement("INSERT INTO `"+uname+"` (`donation_date`,`donation_type`,`request_blood_status`,`patient_name`) VALUES (?,?,?,?)");
                    rs4.setString(1,report_date);
                    rs4.setString(2,type);
                    rs4.setInt(3,temp_status);
                    rs4.setString(4,patient_name);
                    rs4.executeUpdate();
                    rs.close();
                    rs2.close();
                    rs4.close();
                    con.close();
                    out.print("<html><body><script>alert('Patient details send in Your register mobile number...!!!');window.location='/B24U/Donor/donor_page.jsp';</script><body></html>");
                }
                else
                {
                    rs.close();
                    con.close();
                    out.print("<html><body><script>alert('Invalid Patient Id...!!');window.location='/B24U/Donor/pending_request_donor.jsp';</script><body></html>");
                }  
            }
            else
            {
                rs.close();
                con.close();    
                out.print("<html><body><script>alert('Invalid Patient Id...!!');window.location='/B24U/Donor/pending_request_donor.jsp';</script><body></html>");
            }            
        } 
        catch (Exception e) 
        { 
            out.print("<html><body><script>alert('Something went wrong....!!!');window.location='/B24U/Donor/pending_request_donor.jsp';</script><body></html>");
        }
    }
}
