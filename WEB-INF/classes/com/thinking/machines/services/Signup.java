package com.thinking.machines.services;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import com.thinking.machines.beans.*;
import java.net.*;
public class Signup extends HttpServlet
{
public void doPost(HttpServletRequest rq,HttpServletResponse rs)
{ 
try
{
System.out.println("Signup Service Chali");
System.out.println(rq.getParameter("name")+"\n"+rq.getParameter("username")+"\n"+rq.getParameter("password")+"\n"+rq.getParameter("rePassword")+"\n"+rq.getParameter("dateOfBirth"));
String username=rq.getParameter("username");
String password=rq.getParameter("password");
String name=rq.getParameter("name");
String rePassword=rq.getParameter("rePassword");
String dateOfBirth=rq.getParameter("dateOfBirth");
if(username.trim().length()==0 || name.trim().length()==0 || dateOfBirth.trim().length()==0 || password.trim().length()==0 || rePassword.trim().length()==0)
{
ErrorBean errorBean=new ErrorBean();
errorBean.addError("Please fill all the fields!");
rq.setAttribute("errorBean",errorBean);
RequestDispatcher requestDispatcher;
requestDispatcher=rq.getRequestDispatcher("register.jsp");
requestDispatcher.forward(rq,rs);
}
if(!password.trim().equalsIgnoreCase(rePassword.trim()))
{
ErrorBean errorBean=new ErrorBean();
errorBean.addError("Password and ReEnter Password doesnot matches!");
rq.setAttribute("errorBean",errorBean);
RequestDispatcher requestDispatcher;
requestDispatcher=rq.getRequestDispatcher("register.jsp");
requestDispatcher.forward(rq,rs);
}
String path=rq.getServletContext().getRealPath("")+"files/users.txt";
File file=new File(path);
RandomAccessFile randomAccessFile=new RandomAccessFile(file,"rw");
while(randomAccessFile.getFilePointer()<randomAccessFile.length())
{
String fUsername=randomAccessFile.readLine();
String fPassword=randomAccessFile.readLine();
String fName=randomAccessFile.readLine();
String fDOB=randomAccessFile.readLine();
if(username.equalsIgnoreCase(fUsername) && name.equalsIgnoreCase(fName))
{
randomAccessFile.close();
ErrorBean errorBean=new ErrorBean();
errorBean.addError("User already exists");
rq.setAttribute("errorBean",errorBean);
RequestDispatcher requestDispatcher;
requestDispatcher=rq.getRequestDispatcher("register.jsp");
requestDispatcher.forward(rq,rs);
}
if(username.equalsIgnoreCase(fUsername))
{
randomAccessFile.close();
ErrorBean errorBean=new ErrorBean();
errorBean.addError("Username already exists.Choose another one!");
rq.setAttribute("errorBean",errorBean);
RequestDispatcher requestDispatcher;
requestDispatcher=rq.getRequestDispatcher("register.jsp");
requestDispatcher.forward(rq,rs);
}
}//while ends
randomAccessFile.writeBytes(username+"\n");
randomAccessFile.writeBytes(password+"\n");
randomAccessFile.writeBytes(name+"\n");
randomAccessFile.writeBytes(dateOfBirth+"\n");
System.out.println("User Added");
randomAccessFile.close();
ErrorBean errorBean=new ErrorBean();
errorBean.addError("User Added! Please Login");
rq.setAttribute("errorBean",errorBean);
RequestDispatcher requestDispatcher;
requestDispatcher=rq.getRequestDispatcher("login.jsp");
requestDispatcher.forward(rq,rs);
}catch(Exception e)
{
System.out.println(e);
}
}
}
