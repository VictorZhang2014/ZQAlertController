//
//  ZQAlertController.m
//  ZQAlertController
//
//  Created by Victor Zhang on 8/29/16.
//  Copyright © 2016 XiaoRuiGeGe. All rights reserved.
//

#import "ZQAlertController.h"

@interface ZQAlertController()

@property (nonatomic, strong) UIViewController *windowsRootViewController;
@end

@implementation ZQAlertController

- (UIViewController *)windowsRootViewController
{
    if (!_windowsRootViewController) {
        _windowsRootViewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    }
    return _windowsRootViewController;
}

+ (instancetype)defaultAlert
{
    static ZQAlertController *alertController;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alertController = [[ZQAlertController alloc] init];
    });
    return alertController;
}

- (void)alertShowWithTitle:(NSString * _Nullable)title message:(NSString *)message okayButton:(NSString *)okay completion:(void(^ _Nullable)())completion
{
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:okay style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (completion) {
            completion();
        }
    }];
    [alertC addAction:action];
    [self.windowsRootViewController presentViewController:alertC animated:YES completion:nil];
}

- (void)alertShowWithTitle:(NSString * _Nullable)title message:(NSString *)message cancelButton:(NSString *)cancel okayButton:(NSString *)okay okayHandler:(AlertBlock)okayHandler cancelHandler:(AlertBlock)cancelHandler
{
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action0 = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelHandler)
            cancelHandler();
    }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:okay style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (okayHandler)
            okayHandler();
    }];
    [alertC addAction:action0];
    [alertC addAction:action1];
    [self.windowsRootViewController presentViewController:alertC animated:YES completion:nil];
}

- (void)alertShowWithTitle:(NSString * _Nullable)title message:(NSString *)message cancelButton:(NSString *)cancel okayButton:(NSString *)okay alertStyle:(ZRAlertStyle)style placeHolder:(NSString *)placeHolder okayHandler:(AlertBlock1)okayHandler cancelHandler:(AlertBlock1)cancelHandler
{
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alertC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = placeHolder;
        if (style == ZRAlertStylePlainTextInput) {
            textField.secureTextEntry = NO;
        } else if (style == ZRAlertStyleSecureTextInput) {
            textField.secureTextEntry = YES;
        } else {
            NSLog(@"The parameter of ZRAlertStyle is not correct!");
        }
    }];
    
    UIAlertAction *action0 = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelHandler)
            cancelHandler(alertC.textFields.firstObject);
    }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:okay style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (okayHandler)
            okayHandler(alertC.textFields.firstObject);
    }];
    [alertC addAction:action0];
    [alertC addAction:action1];
    [self.windowsRootViewController presentViewController:alertC animated:YES completion:nil];

}

- (void)alertShowWithTitle:(NSString * _Nullable)title message:(NSString *)message cancelButton:(NSString *)cancel okayButton:(NSString *)okay alertStyle:(ZRAlertStyle)style placeHolder1:(NSString *)placeHolder1 placeHolder2:(NSString *)placeHolder2 sureHandler:(AlertBlock2)okayHandler abolishHandler:(AlertBlock2)cancelHandler
{
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alertC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = placeHolder1;
    }];
    
    [alertC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = placeHolder2;
        textField.secureTextEntry = YES;
    }];
    
    UIAlertAction *action0 = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelHandler)
            cancelHandler(alertC.textFields.firstObject, alertC.textFields.lastObject);
    }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:okay style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (okayHandler)
            okayHandler(alertC.textFields.firstObject, alertC.textFields.lastObject);
    }];
    [alertC addAction:action0];
    [alertC addAction:action1];
    [self.windowsRootViewController presentViewController:alertC animated:YES completion:nil];
}


/*
 * Action Sheet
 **/
- (void)actionViewWithTitle:(NSString * _Nullable)title cancel:(NSString *)cancel others:(NSArray *)others handler:(ActionBlock)handler
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    for (int i = 0; i < others.count; i++) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:others[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (handler) {
                handler(i + 1, others[i]);
            }
        }];
        [alertController addAction:action];
    }
    if (cancel.length) {
        UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (handler) {
                handler(0, cancel);
            }
        }];
        [alertController addAction:actionCancel];
    }
    [self.windowsRootViewController presentViewController:alertController animated:YES completion:nil];
}

@end

