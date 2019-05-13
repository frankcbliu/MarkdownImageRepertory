
```java
// 匹配出 url
String pattern = "匹配规则";

//此处是一个例子，匹配点要用\\.，匹配?要用\\?
//匹配除了空格外的字符要用\\S+，但好像不能匹配一些特殊字符
// String pattern = "href=\"(\\S+www\\.baidu\\.com/link\\?\\S+)\"";

// 正则表达式解析
Pattern r = Pattern.compile(pattern);
Matcher m = r.matcher("需要抽取信息的文本");
List<String> urls = new ArrayList<>();
while (m.find()){
    urls.add(m.group(1));
    System.out.println(m.group(1));
}
System.out.println(urls.size());
// 此处利用list来存储匹配到的内容
```