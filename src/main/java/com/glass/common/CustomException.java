package com.glass.common;

public class CustomException extends Exception{
	public CustomException(){}
	public CustomException(String str){
		super(str);//父类的有一个参数的构造方法，也就是设置message属性的那个构造方法。
	}
}
