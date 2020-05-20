package B24U;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class ForgotEvent extends HttpServlet 
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
            ResultSet rs = st.executeQuery("SELECT * FROM eventlogin WHERE user_email='"+user_email+"' AND status=0");
            rs.last();
            int number=rs.getRow();
            if (number==1)
            {
                HttpSession session=request.getSession();
                session.setAttribute("user_email",rs.getString("user_email"));
                out.print("<html><body><script>window.location='/B24U/forgot_event.jsp';</script><body></html>");
            }
            else
            {
                rs.close(); 
                con.close();
                out.print("<html><body><script>alert('Email Id is not registared...!!!');window.location='/B24U/forgot_event_password.jsp';</script><body></html>");
            }
        }
        catch(Exception e)
        {   
            out.print("<html><body><script>alert('Something went wrong....!!!');window.location='/B24U/forgot_event_password.jsp';</script><body></html>");
        }
    }
}
