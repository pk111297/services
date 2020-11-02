package com.thinking.machines.pojo;
import java.io.*;
public class User implements Serializable,Comparable<User>
{
public String name="";
public String password="";
public String username="";
public String dob="";
public boolean equals(Object object)
{
return true;
}
public int compareTo(User anotherMember)
{
return 1;
}
public int hashCode()
{
return 1;
}
public String getName()
{
return this.name;
}
public String getPassword()
{
return this.password;
}
public String getUsername()
{
return this.username;
}
public String getDob()
{
return this.dob;
}
public void setName(String name)
{
this.name=name;
}
public void setPassword(String password)
{
this.password=password;
}
public void getUsername(String username)
{
this.username=username;
}
public void getDob(String dob)
{
this.dob=dob;
}
}
