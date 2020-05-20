package B24U;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class RequestBlood extends HttpServlet 
{
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        PrintWriter out=response.getWriter();
        try 
        { 
            response.setContentType("text/html");
            String patient_name=request.getParameter("patient_name");
            String hospital_name=request.getParameter("hospital_name");
            String hospital_address=request.getParameter("hospital_address");
            String doctor_name=request.getParameter("doctor_name");
            String blood_group=request.getParameter("blood_group");
            String city=request.getParameter("city");
            String contact_name=request.getParameter("contact_name");
            String contact_number=request.getParameter("contact_number");
            String contact_mail_id=request.getParameter("contact_mail_id");
            String other_message=request.getParameter("other_message");
            String required_date=request.getParameter("required_date");
            int status=0;
            Connection con = DatabaseConnection.initializeDatabase();
            Statement st=con.createStatement();
            PreparedStatement rs = con.prepareStatement("INSERT INTO requestblood (patient_name,hospital_name,hospital_address,doctor_name,blood_group,city,contact_name,contact_number,contact_mail_id,other_message,required_date,status) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");
            rs.setString(1,patient_name);
            rs.setString(2,hospital_name);
            rs.setString(3,hospital_address);
            rs.setString(4,doctor_name);
            rs.setString(5,blood_group);
            rs.setString(6,city);
            rs.setString(7,contact_name);
            rs.setString(8,contact_number);
            rs.setString(9,contact_mail_id);
            rs.setString(10,other_message);
            rs.setString(11,required_date);
            rs.setInt(12,status);
            rs.executeUpdate(); 
            rs.close(); 
            con.close(); 
            out.print("<html><body><script>alert('Your details are recorded..!!! Donor help to you ASAP..!!!');window.location='/B24U/request_blood.jsp';</script><body></html>");
        } 
        catch (Exception e) 
        { 
            e.printStackTrace();
            out.print("<html><body><script>alert('Something went wrong....!!!');window.location='/B24U/request_blood.jsp';</script><body></html>");
        } 
    }
}
