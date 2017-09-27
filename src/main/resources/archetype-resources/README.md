# 系统原型
由于经常需要搭建一些系统，如果每次都是手动创建项目，创建模块，拷贝配置，再修改配置，无疑是蛋疼的。  
所以我需要做一个项目原型，每次需要搭建类似的系统的时候，只需要一键即可生成！

然而这还是满足不了我的需求，一键生成项目之后，只能带有一些基本功能，比如用户管理、角色管理、菜单管理。  
如果想开发其他功能还是要一点一点的敲代码，所以我在原型中内置了一个模块，可以一键生成一个实体对应curl的全部代码！

## 一、系统简介
### 1. 各个模块之间的依赖关系
- `web模块` 依赖 `biz模块`
- `biz模块` 依赖 `service模块`、`dao模块`和`remote模块`
- `service模块` 依赖 `model模块`
- `dao模块` 依赖 `model模块`和`common模块`

### 2. 主要技术和框架
- Spring
- SpringMVC
- Mybatis
- autoconfig
- mbg
- shiro
- redis
- dubbo
- mysql
- freemarker
- ace admin ajax
- log4j2
- fastjson
- lombok
- 等

## 二、基本功能
由于这只是一个项目原型，以后可能会用于各大场景，所以下面的功能只是一些最基础的。

#### 网站
1. 登录
2. 注册
3. 找回密码

#### 工作台
1. 系统
    - 用户管理
    - 角色管理
    - 菜单管理
    - 缓存管理
2. 工具
    - 验证码查询
    - 代码生成
3. 我的
    - 基本信息

## 四、使用方法
1. 拉取项目到本地 `git clone https://github.com/kangyonggan/codegen.git`
2. 编译并安装 `mvn clean install`
3. 一键生成项目 `mvn archetype:generate -DarchetypeGroupId=com.kangyonggan.archetype -DarchetypeArtifactId=codegen -DarchetypeVersion=1.0-SNAPSHOT -DarchetypeCatalog=local`

