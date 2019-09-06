# Java 读写比较


1. 统一输入为 String path

方法1：
```java
FileInputStream inputStream = null;
Scanner scanner = null;
try{
    inputStream = new FileInputStream(path);
    // 使用这种方法只需要 385ms
    BufferedInputStream bis = new BufferedInputStream(inputStream);
    BufferedReader reader = new BufferedReader(new InputStreamReader(bis,"utf-8"), 5*1024*1024);
    String line = "";
    while ((line= reader.readLine())!=null){
        // 在此处对拿到的行进行处理
        System.out.println(line);//简单输出文件里的内容
    }
    inputStream.close();
}catch (Exception e){ 
    e.printStackTrace();
} 
```

方法2：
```java
try{
    String line = "";
    FileReader fr = new FileReader(path);
    BufferedReader br = new BufferedReader(fr);
    while ((line = br.readLine())!=null){
        System.out.println(line);
          // 在此处对拿到的行进行处理
    }
}catch (Exception e){
    e.printStackTrace();
}

```

方法3：（比前面的方法慢）
```java
FileInputStream inputStream = null;
Scanner scanner = null;
try{
    inputStream = new FileInputStream(path);
    scanner = new Scanner(inputStream,"UTF-8");
    while (scanner.hasNextLine()){
        String line = scanner.nextLine();
        System.out.println(line);
    }
    inputStream.close();
    scanner.close();
}catch (Exception e){ }

```


### 写
```java
try{
    String line = "";
    FileWriter fw = new FileWriter(path);
    BufferedWriter bw = new BufferedWriter(fw);
    bw.write(content);
    bw.close();
}catch (Exception e){
    e.printStackTrace();
}
```