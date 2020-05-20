package Donor;
import B24U.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class DonorContribute extends HttpServlet 
{
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        PrintWriter out=response.getWriter();
        try 
        { 
            response.setContentType("text/html");
            String name=request.getParameter("name");
            String address=request.getParameter("address");
            String email=request.getParameter("email");
            String contactnumber=request.getParameter("contactnumber");
            String pincode=request.getParameter("pincode");
            String city=request.getParameter("city");
            String state=request.getParameter("state");
            String amount=request.getParameter("amount");
            Connection con = DatabaseConnection.initializeDatabase();
            Statement st=con.createStatement();
            PreparedStatement rs = con.prepareStatement("INSERT INTO contribution (name,address,email,contactnumber,pincode,city,state,amount) VALUES (?,?,?,?,?,?,?,?)");
            rs.setString(1,name);
            rs.setString(2,address);
            rs.setString(3,email);
            rs.setString(4,contactnumber);
            rs.setString(5,pincode);
            rs.setString(6,city);
            rs.setString(7,state);
            rs.setString(8,amount);
            rs.executeUpdate(); 
            rs.close(); 
            con.close(); 
            out.print("<html><body><script>alert('Thank you....!!!');window.location='/B24U/Donor/d_contribute.jsp';</script><body></html>");
        } 
        catch (Exception e) 
        { 
            e.printStackTrace();
            out.print("<html><body><script>alert('Something went wrong....!!!');window.location='/B24U/Donor/d_contribute.jsp';</script><body></html>");
        } 
    }
}
