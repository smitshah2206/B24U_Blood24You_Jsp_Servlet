package Event;
import B24U.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class DeleteEvent extends HttpServlet 
{
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        PrintWriter out=response.getWriter();
        HttpSession session=request.getSession(false);
        try 
        { 
            response.setContentType("text/html");
            String answer=request.getParameter("submit");
            if(answer.equals("Yes"))
            {
                String user_email=(String)session.getAttribute("user_email");
                Connection con = DatabaseConnection.initializeDatabase();
                Statement st=con.createStatement();
                st.executeUpdate("UPDATE eventlogin SET status=1 WHERE user_email='"+user_email+"'");
                st.executeUpdate("DROP TABLE `"+user_email+"`");
                con.close();
                session.invalidate();
                out.print("<html><body><script>alert('Your acount sucessfully deleted...!!!');window.location='/B24U/login_event.jsp';</script><body></html>");
            }
            else
            {
                out.print("<html><body><script>window.location='/B24U/Event/delete_event.jsp';</script><body></html>");
            }
            
        } 
        catch (Exception e) 
        { 
            e.printStackTrace();
            out.print("<html><body><script>alert('Something went wrong....!!!');window.location='/B24U/Event/delete_event.jsp';</script><body></html>");
        } 
    }
}
