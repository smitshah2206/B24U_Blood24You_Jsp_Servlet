package Event;
import B24U.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class UpdateEvent extends HttpServlet 
{
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        PrintWriter out=response.getWriter();
        response.setContentType("text/html");
        HttpSession session=request.getSession(false);
        try 
        { 
            int eid=(int)session.getAttribute("id");
            String old_email=(String)session.getAttribute("old_email");
            String old_user_number=(String)session.getAttribute("old_user_number");
            String user_email=request.getParameter("user_email");
            String user_full_name=request.getParameter("user_full_name");
            String password=request.getParameter("password");
            String confirm_password=request.getParameter("confirm_password");
            String user_number=request.getParameter("user_number");
            String event_address=request.getParameter("event_address");
            String event_date=request.getParameter("event_date");
            String start_time=request.getParameter("start_time");
            String end_time=request.getParameter("end_time");
            String pincode=request.getParameter("pincode");
            String city=request.getParameter("city");
            String state=request.getParameter("state");
            String need=request.getParameter("need");
            String other_message=request.getParameter("other_message");
            Connection con = DatabaseConnection.initializeDatabase();
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM eventlogin WHERE user_email='"+user_email+"' AND id!='"+eid+"' AND status=0 ");
            rs.last();
            int number=rs.getRow();
            if(number==0)
            {
                ResultSet rs1=st.executeQuery("SELECT * FROM eventlogin WHERE user_number='"+user_number+"' AND id!='"+eid+"' AND status=0 ");
                rs1.last();
                int number1=rs1.getRow();
                if(number1==0)
                {
                    if(old_email.compareTo(user_email)!=0)
                    {
                        st.executeUpdate("RENAME TABLE `"+old_email+"` TO `"+user_email+"`");
                    }
                    st.executeUpdate("UPDATE eventlogin SET user_full_name='"+user_full_name+"',user_email='"+user_email+"',password='"+password+"',confirm_password='"+confirm_password+"',user_number='"+user_number+"',event_address='"+event_address+"',event_date='"+event_date+"',start_time='"+start_time+"',end_time='"+end_time+"',pincode='"+pincode+"',city='"+city+"',state='"+state+"',need='"+need+"',other_message='"+other_message+"' WHERE id='"+eid+"'");
                    rs.close();
                    rs1.close();
                    session.invalidate();
                    con.close();
                    out.print("<html><body><script>alert('Thank you...!!! Your event details Updated...!!!');window.location='/B24U/login_event.jsp';</script><body></html>");  
                }
                else
                {
                    rs.close();
                    rs1.close();
                    con.close();
                    out.print("<html><body><script>alert('Contact Number is already registered Please use another Number...!!!');window.location='/B24U/Event/update_event.jsp';</script><body></html>");
                }
            
            }
            else
            {
                rs.close();
                con.close();
                out.print("<html><body><script>alert('Email Id is already registered Please use another Email Id...!!!');window.location='/B24U/Event/update_event.jsp';</script><body></html>");
            }
            
        } 
        catch (Exception e) 
        { 
           out.print("<html><body><script>alert('Something went wrong....!!!');window.location='/B24U/Event/update_event.jsp';</script><body></html>");
        }
    }
}