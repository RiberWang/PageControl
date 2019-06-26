# PageControl
仿淘宝首页菜单滑动效果

![仿淘宝首页菜单滑动效果](https://github.com/RiberWang/PageControl/blob/master/Source/scroll.gif?raw=true)

## 重要逻辑：通过菜单的偏移量计算PageControl的偏移量

     pageControl的偏移量为pageControl的总宽度减去滑块的总宽度，
     同理scrollView的偏移量为scrollView的内容宽度减去scrollView的宽度。
     通过比例计算可得出pageControl的偏移量，
     即offsetX:scrollView可偏移的总距离=x:pageControl可偏移的总距离
     整理得x = offsetX*pageControl可偏移的总距离/scrollView可偏移的总距离
