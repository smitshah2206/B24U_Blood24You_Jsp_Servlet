package B24U;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.text.SimpleDateFormat;
import java.util.Date;
public class LoginEvent extends HttpServlet 
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
            ResultSet rs = st.executeQuery("SELECT * FROM eventlogin WHERE user_email='"+user_email+"' AND confirm_password='"+password+"' AND status=0");
            rs.last();
            int number=rs.getRow();
            if (number==1)
            {
                HttpSession session=request.getSession();
                rs = st.executeQuery("SELECT * FROM eventlogin WHERE user_email='"+user_email+"' AND confirm_password='"+password+"' AND status=0");
                while(rs.next())
                {
                    session.setAttribute("id",rs.getInt("id"));
                    session.setAttribute("password",rs.getString("confirm_password"));
                    session.setAttribute("confirm_password",rs.getString("confirm_password"));
                    session.setAttribute("pincode",rs.getString("pincode"));
                    session.setAttribute("state",rs.getString("state"));
                    session.setAttribute("need",rs.getString("need"));
                    session.setAttribute("other_message",rs.getString("other_message"));
                    session.setAttribute("old_email",rs.getString("user_email"));
                    session.setAttribute("user_email",rs.getString("user_email"));
                    session.setAttribute("event_address",rs.getString("event_address"));
                    session.setAttribute("user_full_name",rs.getString("user_full_name"));
                    session.setAttribute("old_user_number",rs.getString("user_number"));
                    session.setAttribute("user_number",rs.getString("user_number"));
                    session.setAttribute("event_date_a",rs.getString("event_date"));
                    session.setAttribute("start_time",rs.getString("start_time"));
                    session.setAttribute("end_time",rs.getString("end_time"));
                    session.setAttribute("city",rs.getString("city"));
                    String date=rs.getString("event_date");
                    SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd");
                    Date d1=ft.parse(date);
                    SimpleDateFormat ftd=new SimpleDateFormat("dd-MM-yyyy");
                    session.setAttribute("event_date",ftd.format(d1));
                }
                out.print("<html><body><script>alert('Welcome ...!!!!');window.location='/B24U/Event/event_status.jsp';</script><body></html>");
                rs.close(); 
                con.close();        
            }
            else
            {
                out.print("<html><body><script>alert('Username/password Combination does not match.');window.location='/B24U/login_event.jsp';</script><body></html>");                
                rs.close(); 
                con.close();
            }
        } 
        catch (Exception e) 
        { 
            out.print("<html><body><script>alert('Something went wrong....!!!');window.location='/B24U/login_event.jsp';</script><body></html>");
        } 
    }
}
