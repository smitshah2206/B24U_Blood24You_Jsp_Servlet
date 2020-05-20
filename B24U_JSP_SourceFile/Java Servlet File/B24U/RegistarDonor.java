package B24U;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class RegistarDonor extends HttpServlet 
{
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        PrintWriter out=response.getWriter();
        try 
        { 
            Connection con = DatabaseConnection.initializeDatabase();
            Statement st=con.createStatement();
            response.setContentType("text/html");
            String password=request.getParameter("password");
            String confirm_password=request.getParameter("confirm_password");
            if (password.compareTo(confirm_password)==0)
            {
                String user_name=request.getParameter("user_name");
                ResultSet rs2 = st.executeQuery("SELECT * FROM donorlogin WHERE user_name='"+user_name+"' AND status=0");
                rs2.last();
                int number=rs2.getRow();
                if (number==1)
                {
                    out.print("<html><body><script>alert('User Name is already registered Please use another User name.');window.location='/B24U/registar_donor.jsp';</script><body></html>");
                    rs2.close(); 
                    con.close();        
                }
                else
                {
                    String user_email=request.getParameter("user_email");
                    ResultSet rs = st.executeQuery("SELECT * FROM donorlogin WHERE user_email='"+user_email+"' AND status=0");
                    rs.last();
                    int number1=rs.getRow();
                    if (number1==1)
                    {
                        out.print("<html><body><script>alert('Email Id is already registered Please use another Email Id.');window.location='/B24U/registar_donor.jsp';</script><body></html>");
                        rs.close(); 
                        con.close();        
                    }
                    else
                    {
                        String user_number=request.getParameter("user_number");
                        ResultSet rs1 = st.executeQuery("SELECT * FROM donorlogin WHERE user_number='"+user_number+"' AND status=0");
                        rs1.last();
                        int number2=rs1.getRow();
                        if (number2==1)
                        {
                            out.print("<html><body><script>alert('Contact Number is already registered Please use another Number.');window.location='/B24U/registar_donor.jsp';</script><body></html>");
                            rs1.close(); 
                            con.close();        
                        }
                        else
                        {
                            String user_full_name=request.getParameter("user_full_name");
                            String Address=request.getParameter("Address");
                            String pincode=request.getParameter("pincode");
                            String city=request.getParameter("city");
                            String state=request.getParameter("state");
                            String date_of_birth=request.getParameter("date_of_birth");
                            String gender=request.getParameter("gender");
                            String blood_group=request.getParameter("blood_group");
                            String weight=request.getParameter("weight");
                            int status=0;
                            st.executeUpdate("CREATE TABLE `"+user_name+"`(id INT(255) UNSIGNED AUTO_INCREMENT PRIMARY KEY,event_status INT(255),event_name VARCHAR(255),donation_date VARCHAR(255),donation_type VARCHAR(255),request_blood_status INT(255),patient_name VARCHAR(255))");
                            PreparedStatement rs3 = con.prepareStatement("INSERT INTO donorlogin (`user_name`,`user_full_name`,`user_email`,`password`,`confirm_password`,`user_number`,`Address`,`pincode`,`city`,`state`,`date_of_birth`,`gender`,`blood_group`,`weight`,`blood_pressure`,`pulse`,`hemoglobin`,`blood_donation`,`pletlets_donation`,`plasama_donation`,`total_donation`,`attend_event`,`created_by`,`status`) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                            rs3.setString(1,user_name);
                            rs3.setString(2,user_full_name);
                            rs3.setString(3,user_email);
                            rs3.setString(4,password);
                            rs3.setString(5,confirm_password);
                            rs3.setString(6,user_number);
                            rs3.setString(7,Address);
                            rs3.setString(8,pincode);
                            rs3.setString(9,city);
                            rs3.setString(10,state);
                            rs3.setString(11,date_of_birth);
                            rs3.setString(12,gender);
                            rs3.setString(13,blood_group);
                            rs3.setString(14,weight);
                            rs3.setInt(15,status);
                            rs3.setInt(16,status);
                            rs3.setInt(17,status);
                            rs3.setInt(18,status);
                            rs3.setInt(19,status);
                            rs3.setInt(20,status);
                            rs3.setInt(21,status);
                            rs3.setInt(22,status);
                            rs3.setString(23,user_full_name);
                            rs3.setInt(24,status);
                            rs3.executeUpdate();
                            rs.close();
                            rs1.close();
                            rs2.close();
                            rs3.close();
                            con.close();
                            out.print("<html><body><script>alert('Thank you...!!!! Your account is created  ...!!!');window.location='/B24U/login_donor.jsp';</script><body></html>");
                        }
                    }
                }
            }
            else
            {
                out.print("<html><body><script>alert('Password & Confirm-Password does not match.');window.location='/B24U/registar_donor.jsp';</script><body></html>");
                con.close();
            }
        } 
        catch (Exception e) 
        { 
            out.print("<html><body><script>alert('Something went wrong....!!!');window.location='/B24U/registar_donor.jsp';</script><body></html>");
        } 
    }
}
