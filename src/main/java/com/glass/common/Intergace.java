package com.glass.common;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.opendata.api.ODPRequest;

public class Intergace {
	
    public static void main(String args[]) {
/*    	retrieveData("http://192.168.2.148:8080/glass-wall/user/getname?name=1","");*/
/*    	httpURLGETCase("http://192.168.2.148:8080/glass-wall/user/getname");*/
    	httpURLPOSTCase("http://192.168.2.148:8080/glass-wall/user/getname");
    }

    private static void retrieveData(String url,String data){
    	System.out.println(333);
    	//传入url与秘钥
		String res=new ODPRequest(url, "1")
/*		//应用参数
		.addTextAppPara("name",data)*/
		.get();
		System.out.println("111");
		JSONObject o= JSON.parseObject(res);
		Object cc = o.getJSONObject("MsgResponse").get("ResponseInfo");
		System.out.println(cc);
			JSONObject obj =  o.getJSONObject("MsgResponse").getJSONObject("Data").getJSONObject("NewDataSet").getJSONObject("dtRetu");
			System.out.println(obj);
    }
    
    
    private static void httpURLGETCase(String urls) {
    	
    	         HttpURLConnection connection = null;
    	         BufferedReader reader = null;
    	         String line = null;
    	        try {
    	            URL url = new URL(urls + "?name=1dfgdfgdfg");
    	             connection = (HttpURLConnection) url.openConnection();// 根据URL生成HttpURLConnection
    	             connection.setRequestMethod("GET");// 默认GET请求
    	            connection.connect();// 建立TCP连接
    	            System.out.println(1111);
                 if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
                	 System.out.println(2222);
    	                reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));// 发送http请求
    	                StringBuilder result = new StringBuilder();
    	                // 循环读取流
    	                while ((line = reader.readLine()) != null) {
    	                    result.append(line).append(System.getProperty("line.separator"));// "\n"
    	                }
    	                System.out.println(result.toString());
    	            }
    	        } catch (IOException e) {
    	            e.printStackTrace();
    	         } finally {
    	            try {
    	                 reader.close();
                 } catch (IOException e) {
                    e.printStackTrace();
    	            }
                 connection.disconnect();
    	       }
         }

    
    
    
    private static void httpURLPOSTCase(String urls) {
                  System.err.println(34534534);
    	          HttpURLConnection connection = null;
    	          OutputStream dataout = null;
    	          BufferedReader reader = null;
    	          String line = null;
    	          System.out.println(111);
    	         try {
    	             URL url = new URL(urls);
    	              connection = (HttpURLConnection) url.openConnection();// 根据URL生成HttpURLConnection
                 connection.setDoOutput(true);// 设置是否向connection输出，因为这个是post请求，参数要放在http正文内，因此需要设为true,默认情况下是false
    	             connection.setDoInput(true); // 设置是否从connection读入，默认情况下是true;
    	            connection.setRequestMethod("POST");// 设置请求方式为post,默认GET请求
    	          connection.setUseCaches(false);// post请求不能使用缓存设为false
    	             connection.setConnectTimeout(3000);// 连接主机的超时时间
    	            connection.setReadTimeout(3000);// 从主机读取数据的超时时间
    	             connection.setInstanceFollowRedirects(true);// 设置该HttpURLConnection实例是否自动执行重定向
    	             connection.setRequestProperty("connection", "Keep-Alive");// 连接复用
    	             connection.setRequestProperty("charset", "utf-8");
    	             
    	             connection.setRequestProperty("Content-Type", "application/json");
    	             connection.setRequestProperty("Authorization", "Bearer 66cb225f1c3ff0ddfdae31rae2b57488aadfb8b5e7");
    	             connection.connect();// 建立TCP连接,getOutputStream会隐含的进行connect,所以此处可以不要
    	             System.out.println(1);
    	             dataout = new DataOutputStream(connection.getOutputStream());// 创建输入输出流,用于往连接里面输出携带的参数
    	             System.out.println(2);
    	             String body = "[{\"name\":\"44921902\"}]";
    	             dataout.write(body.getBytes());
    	             dataout.flush();
    	             dataout.close();
    	 System.out.println(9999);
    	 System.out.println(connection.getResponseCode());
    	 System.out.println(HttpURLConnection.HTTP_OK);
    	             if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
    	            	 System.out.println(3423);
    	                 reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));// 发送http请求
    	                 System.out.println(4);
    	                 StringBuilder result = new StringBuilder();
    	                 // 循环读取流
    	                 while ((line = reader.readLine()) != null) {
    	                     result.append(line).append(System.getProperty("line.separator"));//
    	                 }
    	                 System.out.println(result.toString());
    	             }
    	         } catch (IOException e) {
    	             e.printStackTrace();
    	         } finally {
    	             try {
    	                reader.close();
    	             } catch (IOException e) {
    	                 e.printStackTrace();
                 }
    	            connection.disconnect();
    	         }
    	    }


}
