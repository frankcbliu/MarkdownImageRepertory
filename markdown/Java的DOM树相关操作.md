
## 引入jsoup库
idea下，在file->Project Structure->Modules->Dependencies中，选择添加，找到jar包的位置，添加即可。

## 使用方法
```java
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

// DOM树解析
List<String> urls = new ArrayList<>();
Document document = Jsoup.parse("需要解析的，或者爬虫抓取下来的html文本");
// Elements rows = document.select("div[class=result c-container]");
Elements rows = document.select("h3").select("a");//选择h3标签下的a标签
System.out.println(rows.size());
for (int i = 0; i <rows.size() ; i++) {
    urls.add(rows.get(i).attr("href"));//选择该标签下的href属性
    // System.out.println(rows.get(i).attr("href"));
}
```

## 解析百度搜索结果的原始url

```java
Connection.Response res = null;
for (int i = 0; i <urls.size() ; i++) {
    try {
        // 设置超时 .timeout(int timeout)
        // res = Jsoup.connect(urls.get(i)).timeout(50000).method(Connection.Method.GET).followRedirects(false).execute();
        res = Jsoup.connect(urls.get(i)).method(Connection.Method.GET).followRedirects(false).execute();
        System.out.println(res.header("Location"));//输出真实链接
        // out.write("百度链接："+urls.get(i)+"\n");
        // out.write("真实链接："+res.header("Location")+"\n");
    }catch (MalformedURLException e ){
        e.printStackTrace();
    }
}
```