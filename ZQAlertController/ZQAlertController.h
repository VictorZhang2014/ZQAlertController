//
//  ZQAlertController.h
//  ZQAlertController
//
//  Created by Victor Zhang on 8/29/16.
//  Copyright © 2016 XiaoRuiGeGe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger){
    ZRAlertStylePlainTextInput,
    ZRAlertStyleSecureTextInput,
    ZRAlertStyleLoginAndPasswordInput
}ZRAlertStyle;


typedef void(^  _Nullable AlertBlock)(void);
typedef void(^  _Nullable AlertBlock1)(UITextField *textFiled);
typedef void(^  _Nullable AlertBlock2)(UITextField *textFiled1, UITextField *textFiled2);
typedef void(^ActionBlock)(int index, NSString *item);

@interface ZQAlertController : NSObject

+ (instancetype)defaultAlert;


/*
 * Alert View
 **/
- (void)alertShowWithTitle:(NSString * _Nullable)title message:(NSString *)message okayButton:(NSString *)okay completion:(void(^ _Nullable)())completion;

- (void)alertShowWithTitle:(NSString * _Nullable)title message:(NSString *)message cancelButton:(NSString *)cancel okayButton:(NSString *)okay okayHandler:(AlertBlock)okayHandler cancelHandler:(AlertBlock)cancelHandler;

- (void)alertShowWithTitle:(NSString * _Nullable)title message:(NSString *)message cancelButton:(NSString *)cancel okayButton:(NSString *)okay alertStyle:(ZRAlertStyle)style placeHolder:(NSString *)placeHolder okayHandler:(AlertBlock1)okayHandler cancelHandler:(AlertBlock1)cancelHandler;

- (void)alertShowWithTitle:(NSString * _Nullable)title message:(NSString *)message cancelButton:(NSString *)cancel okayButton:(NSString *)okay alertStyle:(ZRAlertStyle)style placeHolder1:(NSString *)placeHolder1 placeHolder2:(NSString *)placeHolder2 sureHandler:(AlertBlock2)okayHandler abolishHandler:(AlertBlock2)cancelHandler;



/*
 * Action Sheet
 **/
- (void)actionViewWithTitle:(NSString * _Nullable)title cancel:(NSString *)cancel others:(NSArray *)others handler:(ActionBlock)handler;

@end

NS_ASSUME_NONNULL_END
