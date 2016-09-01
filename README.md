# ZQAlertController
ZQAlertController , that is an alert view framework and be compitable with iOS 7.0 and later.

## Requirements

- iOS 8.0+ 
- Xcode 7.0+

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate ZQAlertController into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "VictorZhang2014/ZQAlertController" ~> 1.0
```

Run `carthage update` to build the framework and drag the built `ZQAlertController.framework` into your Xcode project.

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate ZQAlertController.framework into your project manually.

## Usage
`[[ZQAlertController defaultAlert] alertShowWithTitle:@"Note" message:@"This is an empty message!" okayButton:@"Ok"];`

```
[[ZQAlertController defaultAlert] alertShowWithTitle:@"Note" message:@"This is an empty message!" cancelButton:@"Cancel" okayButton:@"Ok" okayHandler:^{
    NSLog(@"You clicked the okay button.");
} cancelHandler:^{
    NSLog(@"You clicked the cancel button.");
}];
```

```
[[ZQAlertController defaultAlert] alertShowWithTitle:@"Note" message:@"This is an explanation message!" cancelButton:@"Cancel" okayButton:@"Okay" alertStyle:ZRAlertStyleSecureTextInput placeHolder:@"Type any character" okayHandler:^(UITextField *textFiled) {
    NSLog(@"Your input of textFiled is %@.", textFiled.text);
} cancelHandler:^(UITextField *textFiled) {
    NSLog(@"Your input of textFiled is %@.", textFiled.text);
}];
```

```
[[ZQAlertController defaultAlert] alertShowWithTitle:@"Note" 
                                  message:@"This is an explanation message!" 
                                  cancelButton:@"Cancel" okayButton:@"Ok" 
                                  alertStyle:ZRAlertStyleLoginAndPasswordInput 
                                  placeHolder1:@"Type an account" 
                                  placeHolder2:@"Type a passcode" 
                                  sureHandler:^(UITextField *textFiled1, UITextField *textFiled2) {
    NSLog(@"Your input of Sure textFiled1.text = %@, textFiled2.text = %@. ", textFiled1.text, textFiled2.text);
} abolishHandler:^(UITextField *textFiled1, UITextField *textFiled2) {
    NSLog(@"Your input of Abolish textFiled1.text = %@, textFiled2.text = %@. ", textFiled1.text, textFiled2.text);
}];
```

```
[[ZQAlertController defaultAlert] actionViewWithTitle:nil cancel:@"cancel" others:@[@"aaa",@"bbb",@"ccc"] handler:^(int index, NSString * _Nonnull item) {
    NSLog(@"index = %d, item = %@. ", index, item);
}];
```







