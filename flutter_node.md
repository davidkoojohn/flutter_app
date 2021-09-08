## Flutter 布局基础 widgets

- Row 和 Column 类：Row 水平排列，Column 竖直排列
    - `children: <Widget>[]`
    - `mainAxisSize: MainAxisSize.max | MainAxisSize.min`
    - `mainAxisAlignment: MainAxisAlignment.start` // .start, .end, .center, .spaceBetween, .spaceAround, spaceEvenly
    - `crossAxisAlignment: CrossAxisAlignment.start` // .start, .end, .center, .stretch, .baseline(&& textBaseline: TextBaseline.alphabetic)
    
- Flexible widget
    - `flex: 1` // 决定自身占剩余空间的比例
    - `fit: FlexFit.loose // 自身作为首选大小` (FlexFit.tight 充满所有剩余空间) // 是否能够填充所有剩余空间

- Expanded widget: 包裹一个 widget 并强制其填满剩余空间

- SizedBox widget: 1). 创建精确的尺寸, 2). 能在 widgets 之间创建空间

- Spacer widget: 能在 widgets 之间创建空间

    > SizedBox 和 Spacer 有何不同？
    > 如果你想用 flex 属性创建一段空间，请使用 Spacer。
    > 如果你想创建一个拥有特定逻辑像素值的空间，请使用 SizedBox。

- Text widget: 显示文字，配置不同的字体，大小和颜色

- Icon widget: 显示图形符号
  
- Image widget: 显示了一张图片

- ListTile 在 Card 或者 ListView 中最常用


