# PlantUML server

## UML 画图工具

有两个镜像可选

- `plantuml/plantuml-server:jetty`
- `plantuml/plantuml-server:tomcat`

### Hello World

```
@startuml
A -> B : ping
B -> A : pong
@enduml
```

```
┌─┐          ┌─┐
│A│          │B│
└┬┘          └┬┘
 │   ping     │
 │───────────>│
 │            │
 │   pong     │
 │<───────────│
┌┴┐          ┌┴┐
│A│          │B│
└─┘          └─┘
```

各大主流软件均有插件或其他的直接支持
