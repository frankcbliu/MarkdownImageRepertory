
# Accelerated C++ 


## 第8章：编写泛型函数
----
### 什么是泛型函数
> 定义：在使用该函数之前，并不知道它的参数或返回类型是什么，这样的函数称为泛型函数。
---
#### 未知类型的中值
> 实现泛型函数的语言特征被称为模板函数

> 隐藏于模板之后的关键概念是，不同类型的对象仍可以享有共同的行为特征

```c++
template <class T>  T t_median(vector<T> v){
    typedef typename vector<T>::size_type vec_sz;
    vec_sz size = v.size();
    if (size == 0)
        throw domain_error("median of an empty vector");
    sort(v.begin(),v.end());
    vec_sz mid = size/2;
    return size%2 == 0? (v[mid] + v[mid-1]) /2:v[mid];
}
```

> `template <class T>` 这个模板头告知系统环境，我们定义的是一个模板函数，而且这个函数将有一个类型参数。

> `typename`的使用，会告知系统环境，` vector<T>::size_type`是一个类型名——即使系统环境还不知道类型T具体是代表什么的。
>> 有vector<T>这样的依赖于一个模板参数的类型，并且希望使用这个类型的一个诸如 size_type 的成员——本身也是一个类型。我们都必须加上 typename。
