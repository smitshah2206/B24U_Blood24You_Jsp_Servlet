package B24U;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class ForgotEventProcess extends HttpServlet 
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
            String password=request.getParameter("password");
            String confirm_password=request.getParameter("confirm_password");            
            if (password.compareTo(confirm_password)==0) 
            {
                String user_email=(String)session.getAttribute("user_email");
                st.executeUpdate("UPDATE eventlogin SET password='"+password+"',confirm_password='"+confirm_password+"' WHERE user_email='"+user_email+"' AND status=0");
                session.invalidate();
                con.close();
                out.print("<html><body><script>alert('Your password was successfuly changed..!!!');window.location='/B24U/login_event.jsp';</script><body></html>");
            }
            else 
            {
                con.close();
                out.print("<html><body><script>alert('Password & Confirm-Password does not match...!!!');window.location='/B24U/forgot_event.jsp';</script><body></html>");   
            }
        }
        catch(Exception e)
        {   
            out.print("<html><body><script>alert('Something went wrong...!!!');window.location='/B24U/forgot_event.jsp';</script><body></html>");
        }
    }
}
