# soundContrast_Matlab_demo

基于VQ的说话人识别系统

训练：提取语音信息的特征参数并分类，产生不同码字所组成的码本。

识别：采用欧式距离测度，用VQ方法计算平均失真测度。

## 

## 函数说明

### mfcc

基本过程：

连续语音 - 预加重 - 分帧 - 加窗 - 快速FFT - Mel滤波器组 - 对数运算 - DCT



### train

调用mfcc函数提取音频特征得到Mel倒谱系数，然后通过vqlbg函数得到VQ码本。

### melfb

### disteu

### vqlbg

### voicepringt

### soundContrast

