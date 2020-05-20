package B24U;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class RegistarEvent extends HttpServlet 
{
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        PrintWriter out=response.getWriter();
        try 
        { 
            Connection con = DatabaseConnection.initializeDatabase();
            Statement st=con.createStatement();
            response.setContentType("text/html");
            String user_email=request.getParameter("user_email");
            String password=request.getParameter("password");
            String confirm_password=request.getParameter("confirm_password");
            if (password.compareTo(confirm_password)==0)
            {
                ResultSet rs = st.executeQuery("SELECT * FROM eventlogin WHERE user_email='"+user_email+"' AND status=0");
                rs.last();
                int number=rs.getRow();
                if (number==1)
                {
                    out.print("<html><body><script>alert('Email Id is already registered Please use another Email Id.');window.location='/B24U/registar_event.jsp';</script><body></html>");
                    rs.close(); 
                    con.close();        
                }
                else
                {
                    String user_number=request.getParameter("user_number");
                    ResultSet rs1 = st.executeQuery("SELECT * FROM eventlogin WHERE user_number='"+user_number+"' AND status=0");
                    rs1.last();
                    int number1=rs1.getRow();
                    if (number1==1)
                    {
                        out.print("<html><body><script>alert('Contact Number is already registered Please use another Number.');window.location='/B24U/registar_event.jsp';</script><body></html>");
                        rs1.close(); 
                        con.close();        
                    }
                    else
                    {
                        String user_full_name=request.getParameter("user_full_name");
                        String event_address=request.getParameter("event_address");
                        String event_date=request.getParameter("event_date");
                        String start_time=request.getParameter("start_time");
                        String end_time=request.getParameter("end_time");
                        String pincode=request.getParameter("pincode");
                        String city=request.getParameter("city");
                        String state=request.getParameter("state");
                        String need=request.getParameter("need");
                        String other_message=request.getParameter("other_message");
                        int status=0;
                        st.executeUpdate("CREATE TABLE `"+user_email+"`(id INT(255) UNSIGNED AUTO_INCREMENT PRIMARY KEY,donor_id VARCHAR(255),user_full_name VARCHAR(255),user_number VARCHAR(255),blood_group VARCHAR(255),weight INT(255),blood_pressure INT(255),pulse INT(255),hemoglobin INT(255),donation_type VARCHAR(255))");
                        PreparedStatement rs3 = con.prepareStatement("INSERT INTO eventlogin (`user_full_name`,`user_email`,`password`,`confirm_password`,`user_number`,`event_address`,`event_date`,`start_time`,`end_time`,`pincode`,`city`,`state`,`need`,`other_message`,`created_by`,`status`) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                        rs3.setString(1,user_full_name);
                        rs3.setString(2,user_email);
                        rs3.setString(3,password);
                        rs3.setString(4,confirm_password);
                        rs3.setString(5,user_number);
                        rs3.setString(6,event_address);
                        rs3.setString(7,event_date);
                        rs3.setString(8,start_time);
                        rs3.setString(9,end_time);
                        rs3.setString(10,pincode);
                        rs3.setString(11,city);
                        rs3.setString(12,state);
                        rs3.setString(13,need);
                        rs3.setString(14,other_message);
                        rs3.setString(15,user_full_name);
                        rs3.setInt(16,status);
                        rs3.executeUpdate();
                        rs.close();
                        rs1.close();
                        rs3.close();
                        con.close();
                        out.print("<html><body><script>alert('Thank you...!!!! Your event is created ...!!!');window.location='/B24U/login_event.jsp';</script><body></html>");
                    }
                }
            }
            else
            {
                out.print("<html><body><script>alert('Password & Confirm-Password does not match.');window.location='/B24U/registar_event.jsp';</script><body></html>");
                con.close();
            }
        } 
        catch (Exception e) 
        { 
            out.print("<html><body><script>alert('Something went wrong....!!!');window.location='/B24U/registar_event.jsp';</script><body></html>");
        } 
    }
}
