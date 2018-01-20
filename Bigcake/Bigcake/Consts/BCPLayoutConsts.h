//
//  BCPLayoutConsts.h
//  Bigcake
//
//  Created by 武国斌 on 2018/1/21.
//  Copyright © 2018年 武国斌. All rights reserved.
//

#ifndef BCPLayoutConsts_h
#define BCPLayoutConsts_h

CGFloat fixValue(CGFloat value);

/**
 获取屏幕宽高比
 */
#define kAUTOLAYOUTSCALE            (kScreenWidth / 375.0)
/**
 根据屏幕宽高比获取缩放值
 */
#define SCALE(value)                (fixValue((value) * (kAUTOLAYOUTSCALE)))
/**
 根据屏幕宽高比将缩放值恢复
 */
#define REVERSE_SCALE(value)        (fixValue((value) / (kAUTOLAYOUTSCALE)))
/**
 取半值
 */
#define HALF_OF(value)              (fixValue((value) / (2.f)))

#endif /* BCPLayoutConsts_h */
