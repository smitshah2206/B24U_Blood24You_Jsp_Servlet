package B24U;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class GetInTouch extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        PrintWriter out=response.getWriter();
        try 
        { 
            response.setContentType("text/html");
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String contactnumber=request.getParameter("contactnumber");
            String message=request.getParameter("message");
            Connection con = DatabaseConnection.initializeDatabase();
            Statement st=con.createStatement();
            PreparedStatement rs = con.prepareStatement("INSERT INTO feedback (name,email,contactnumber,message) VALUES (?,?,?,?)");
            rs.setString(1,name);
            rs.setString(2,email);
            rs.setString(3,contactnumber);
            rs.setString(4,message);
            rs.executeUpdate(); 
            rs.close();
            con.close();
            out.print("<html><body><script>alert('Thank you....!!! Your valuable feedback is registered...!!!');window.location='/B24U/get_in_touch.jsp';</script><body></html>");
        } 
        catch (Exception e) 
        { 
            e.printStackTrace();
            out.print("<html><body><script>alert('Something went wrong....!!!');window.location='/B24U/get_in_touch.jsp';</script><body></html>");
        }
    }
}
