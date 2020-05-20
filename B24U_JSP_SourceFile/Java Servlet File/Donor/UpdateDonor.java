package Donor;
import B24U.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class UpdateDonor extends HttpServlet 
{
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        PrintWriter out=response.getWriter();
        response.setContentType("text/html");
        HttpSession session=request.getSession(false);
        try 
        { 
            int did=(int)session.getAttribute("id");
            String old_user_name=(String)session.getAttribute("old_user_name");
            String old_email=(String)session.getAttribute("old_email");
            String old_user_number=(String)session.getAttribute("old_user_number");
            String user_name=request.getParameter("user_name");
            String user_full_name=request.getParameter("user_full_name");
            String user_email=request.getParameter("user_email");
            String password=request.getParameter("password");
            String confirm_password=request.getParameter("confirm_password");
            String user_number=request.getParameter("user_number");
            String Address=request.getParameter("Address");
            String pincode=request.getParameter("pincode");
            String city=request.getParameter("city");
            String state=request.getParameter("state");
            String date_of_birth=request.getParameter("date_of_birth");
            String gender=request.getParameter("gender");
            String blood_group=request.getParameter("blood_group");
            String weight=request.getParameter("weight");
            Connection con = DatabaseConnection.initializeDatabase();
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM donorlogin WHERE user_name='"+user_name+"' AND id!='"+did+"' AND status=0 ");
            rs.last();
            int number=rs.getRow();
            if(number==0)
            {
                ResultSet rs1=st.executeQuery("SELECT * FROM donorlogin WHERE user_email='"+user_email+"' AND id!='"+did+"' AND status=0 ");
                rs1.last();
                int number1=rs1.getRow();
                if(number1==0)
                {
                    ResultSet rs2=st.executeQuery("SELECT * FROM donorlogin WHERE user_number='"+user_number+"' AND id!='"+did+"' AND status=0 ");
                    rs2.last();
                    int number2=rs2.getRow();
                    if(number2==0)
                    {
                        if(old_user_name.compareTo(user_name)!=0)
                        {
                            st.executeUpdate("RENAME TABLE `"+old_user_name+"` TO `"+user_name+"`");
                        }
                        st.executeUpdate("UPDATE donorlogin SET user_name='"+user_name+"',user_full_name='"+user_full_name+"',user_email='"+user_email+"',password='"+password+"',confirm_password='"+confirm_password+"',user_number='"+user_number+"',Address='"+Address+"',pincode='"+pincode+"',city='"+city+"',state='"+state+"',date_of_birth='"+date_of_birth+"',gender='"+gender+"',blood_group='"+blood_group+"',weight='"+weight+"' WHERE id='"+did+"'");
                        rs.close();
                        rs1.close();
                        rs2.close();
                        session.invalidate();
                        con.close();
                        out.print("<html><body><script>alert('Thank you...!!! Your details Updated...!!!');window.location='/B24U/login_donor.jsp';</script><body></html>");
                    }
                    else
                    {
                        rs.close();
                        rs1.close();
                        rs2.close();
                        con.close();
                        out.print("<html><body><script>alert('Contact Number is already used Please use another Contact Number...!!!');window.location='/B24U/Donor/update_donor.jsp';</script><body></html>");
                    }
                }
                else
                {
                    rs.close();
                    rs1.close();
                    con.close();
                    out.print("<html><body><script>alert('Email Id is already used Please use another Email Id...!!!');window.location='/B24U/Donor/update_donor.jsp';</script><body></html>");
                }

            }
            else
            {
                rs.close();
                con.close();
                out.print("<html><body><script>alert('UserName is already used Please use another UserName...!!!');window.location='/B24U/Donor/update_donor.jsp';</script><body></html>");
            }
        }
        catch (Exception e)
        {
            out.print("<html><body><script>alert('Something went wrong....!!!');window.location='/B24U/Donor/update_donor.jsp';</script><body></html>");
        }
    }
}