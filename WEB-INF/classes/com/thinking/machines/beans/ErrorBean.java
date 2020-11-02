package com.thinking.machines.beans;
import java.util.*;
public class ErrorBean implements java.io.Serializable
{
public String genericError="";
public HashMap<String,String> propertyErrors=new HashMap<>();
public void addError(String property,String error)
{
propertyErrors.put(property,error);
}
public void addError(String error)
{
this.genericError=error;
}
public String getError(String property)
{
String error=propertyErrors.get(property);
if(error==null) error="";
return error;
}
public String getGenericError()
{
return this.genericError;
}
}

